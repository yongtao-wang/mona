// Applies the migrations to PGlite (Postgres in WASM) with a minimal stand-in for
// Supabase's auth schema, so the schema is tested without Docker. CI also applies
// them to a real local Supabase (backend.yml).
import { PGlite } from "@electric-sql/pglite";
import { assert, assertEquals } from "@std/assert";

const AUTH_STUB = `
  create role anon nologin;
  create role authenticated nologin;
  create role service_role nologin bypassrls;
  create schema auth;
  create table auth.users (id uuid primary key);
  create function auth.uid() returns uuid language sql stable as
    $$ select nullif(current_setting('request.jwt.claim.sub', true), '')::uuid $$;
  grant usage on schema auth to anon, authenticated;
  grant execute on function auth.uid() to anon, authenticated;
`;

async function freshDb(): Promise<PGlite> {
  const db = new PGlite();
  await db.exec(AUTH_STUB);
  const dir = new URL("../migrations/", import.meta.url);
  const files = [...Deno.readDirSync(dir)].map((e) => e.name).filter((n) => n.endsWith(".sql")).sort();
  for (const f of files) await db.exec(Deno.readTextFileSync(new URL(f, dir)));
  await db.exec(`grant usage on schema public to authenticated;
                 grant select on all tables in schema public to authenticated;`);
  return db;
}

const U1 = "11111111-1111-4111-8111-111111111111";
const U2 = "22222222-2222-4222-8222-222222222222";

Deno.test("every public table has row-level security on", async () => {
  const db = await freshDb();
  const res = await db.query<{ relname: string; relrowsecurity: boolean }>(
    `select c.relname, c.relrowsecurity from pg_class c
       join pg_namespace n on n.oid = c.relnamespace
      where n.nspname = 'public' and c.relkind = 'r'`,
  );
  assert(res.rows.length >= 8);
  for (const r of res.rows) assert(r.relrowsecurity, `${r.relname} has RLS off`);
});

Deno.test("a new auth user gets an alpha profile", async () => {
  const db = await freshDb();
  await db.query("insert into auth.users (id) values ($1)", [U1]);
  const res = await db.query<{ plan: string }>("select plan from public.profile where user_id = $1", [U1]);
  assertEquals(res.rows, [{ plan: "alpha" }]);
});

Deno.test("users read only their own devices", async () => {
  const db = await freshDb();
  await db.query("insert into auth.users (id) values ($1), ($2)", [U1, U2]);
  for (const u of [U1, U2]) {
    await db.query(
      `insert into public.device (user_id, install_id, platform, app_version, os_version)
       values ($1, gen_random_uuid(), 'ios', '0.1.0', '26.0')`,
      [u],
    );
  }
  await db.exec(`set role authenticated; set request.jwt.claim.sub = '${U1}';`);
  const res = await db.query<{ user_id: string }>("select user_id from public.device");
  assertEquals(res.rows, [{ user_id: U1 }]);
  await db.exec("reset role;");
});

Deno.test("clients cannot call consume_quota", async () => {
  const db = await freshDb();
  await db.exec("set role authenticated;");
  let failed = false;
  try {
    await db.query("select * from public.consume_quota($1, 'config')", [U1]);
  } catch {
    failed = true;
  }
  await db.exec("reset role;");
  assert(failed, "authenticated role could execute consume_quota");
});

Deno.test("consume_quota allows 30 calls a minute, then rate-limits", async () => {
  const db = await freshDb();
  await db.query("insert into auth.users (id) values ($1)", [U1]);
  type Row = { allowed: boolean; code: string | null; retry_after_s: number };
  for (let i = 0; i < 30; i++) {
    const r = await db.query<Row>("select * from public.consume_quota($1, 'config')", [U1]);
    assertEquals(r.rows[0].allowed, true);
  }
  const r = await db.query<Row>("select * from public.consume_quota($1, 'config')", [U1]);
  assertEquals(r.rows[0].allowed, false);
  assertEquals(r.rows[0].code, "rate_limited");
  assert(r.rows[0].retry_after_s >= 1 && r.rows[0].retry_after_s <= 60);
});

Deno.test("consume_quota enforces the plan's daily call cap", async () => {
  const db = await freshDb();
  await db.query("insert into auth.users (id) values ($1)", [U1]);
  await db.query("update public.profile set plan = 'free' where user_id = $1", [U1]);
  await db.query(
    `insert into public.usage_daily (user_id, day, endpoint, calls)
     values ($1, (now() at time zone 'utc')::date, 'moments_label', 100)`,
    [U1],
  );
  const r = await db.query<{ allowed: boolean; code: string; retry_after_s: number }>(
    "select * from public.consume_quota($1, 'moments_label')",
    [U1],
  );
  assertEquals(r.rows[0].allowed, false);
  assertEquals(r.rows[0].code, "quota_exceeded");
  assert(r.rows[0].retry_after_s >= 1 && r.rows[0].retry_after_s <= 86400);
});

Deno.test("device registration is unique per user and install", async () => {
  const db = await freshDb();
  await db.query("insert into auth.users (id) values ($1)", [U1]);
  const insert = `insert into public.device (user_id, install_id, platform, app_version, os_version)
                  values ($1, '33333333-3333-4333-8333-333333333333', 'ios', '0.1.0', '26.0')`;
  await db.query(insert, [U1]);
  let failed = false;
  try {
    await db.query(insert, [U1]);
  } catch {
    failed = true;
  }
  assert(failed);
});

Deno.test("record_usage adds calls, tokens, cost and refusals per day and endpoint", async () => {
  const db = await freshDb();
  await db.query("insert into auth.users (id) values ($1)", [U1]);
  const call = "select public.record_usage($1, 'moments_label', $2, $3, $4, $5, $6)";
  await db.query(call, [U1, 900, 600, 120, 1020, false]);
  await db.query(call, [U1, 100, 0, 10, 50, true]);
  const r = await db.query<Record<string, number>>(
    "select calls, input_tokens::int, cached_tokens::int, output_tokens::int, refusals, cost_micros::int from public.usage_daily",
  );
  assertEquals(r.rows, [{
    calls: 2,
    input_tokens: 1000,
    cached_tokens: 600,
    output_tokens: 130,
    refusals: 1,
    cost_micros: 1070,
  }]);
});
