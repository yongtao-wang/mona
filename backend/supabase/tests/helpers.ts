// Shared test setup: an in-memory store, a fake auth verifier and a fake model.
import { assertEquals } from "@std/assert";
import type { DeviceRequest } from "../functions/_shared/contracts/types.ts";
import { configFromEnv, type Deps, type QuotaResult } from "../functions/gateway/deps.ts";
import { FakeProvider } from "../functions/gateway/llm/fake.ts";
import type { Usage } from "../functions/gateway/llm/provider.ts";
import { makeLogger } from "../functions/gateway/log.ts";

export const USER = "11111111-1111-4111-8111-111111111111";
export const INSTALL = "33333333-3333-4333-8333-333333333333";
export const BASE = "https://example.supabase.co/functions/v1/gateway";

export function setup(opts: { quota?: QuotaResult; throwOnUpsert?: boolean; llm?: boolean } = {}) {
  const devices = new Map<string, { userId: string; installId: string; req: DeviceRequest }>();
  const logs: string[] = [];
  const usage: { endpoint: string; usage: Usage; costMicros: number; refused: boolean }[] = [];
  const llm = new FakeProvider();
  let n = 0;
  const deps: Deps = {
    auth: { verify: (jwt) => Promise.resolve(jwt === "good" ? USER : null) },
    store: {
      isKnownDevice: (u, d) => Promise.resolve(devices.get(d)?.userId === u),
      upsertDevice: (u, req) => {
        if (opts.throwOnUpsert) throw new Error("db down");
        for (const [id, d] of devices) {
          if (d.userId === u && d.installId === req.install_id) {
            d.req = req;
            return Promise.resolve(id);
          }
        }
        const id = `00000000-0000-4000-8000-00000000000${devices.size}`;
        devices.set(id, { userId: u, installId: req.install_id, req });
        return Promise.resolve(id);
      },
      consumeQuota: () => Promise.resolve(opts.quota ?? { allowed: true }),
      recordUsage: (_u, endpoint, u) => {
        usage.push({ endpoint, ...u });
        return Promise.resolve();
      },
    },
    config: configFromEnv(() => undefined),
    llm: opts.llm === false ? null : llm,
    log: makeLogger((l) => logs.push(l)),
    now: () => 1000,
    requestId: () => `req-${++n}`,
  };
  return { deps, devices, logs, usage, llm };
}

export function request(path: string, init: RequestInit & { jwt?: string | null; device?: string } = {}) {
  const headers = new Headers(init.headers);
  if (init.jwt !== null) headers.set("authorization", `Bearer ${init.jwt ?? "good"}`);
  if (!headers.has("x-app-version")) headers.set("x-app-version", "0.1.0");
  if (init.device) headers.set("x-device-id", init.device);
  if (init.body) headers.set("content-type", "application/json");
  return new Request(BASE + path, { ...init, headers });
}

export const deviceBody = (extra: Record<string, unknown> = {}) =>
  JSON.stringify({
    schema_version: 1,
    install_id: INSTALL,
    platform: "ios",
    app_version: "0.1.0",
    os_version: "26.0",
    model: "iPhone16,1",
    ...extra,
  });

export async function errorCode(res: Response): Promise<string> {
  const body = await res.json();
  assertEquals(Object.keys(body), ["error"]);
  return body.error.code;
}
