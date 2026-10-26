// Edge function entry point. Base URL: https://<project>.supabase.co/functions/v1/gateway
import { configFromEnv } from "./deps.ts";
import { ClaudeProvider } from "./llm/claude.ts";
import { FakeProvider } from "./llm/fake.ts";
import { handle } from "./handler.ts";
import { makeLogger } from "./log.ts";
import { supabaseAdmin, SupabaseAuth, SupabaseStore } from "./supabase_deps.ts";

const db = supabaseAdmin();
const deps = {
  auth: new SupabaseAuth(db),
  store: new SupabaseStore(db),
  config: configFromEnv((k) => Deno.env.get(k)),
  // LLM_PROVIDER=fake runs the pipeline without a model; otherwise Claude needs ANTHROPIC_API_KEY.
  llm: Deno.env.get("LLM_PROVIDER") === "fake" ? new FakeProvider() : ClaudeProvider.fromEnv(),
  log: makeLogger(),
  now: () => Date.now(),
  requestId: () => crypto.randomUUID(),
};

Deno.serve((req) => handle(req, deps));
