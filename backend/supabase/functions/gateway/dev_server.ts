// Local dev server: the real gateway handler with an in-memory store and a dev token,
// for running the app against the pipeline without a Supabase project.
//   deno task dev                      fake model (no API key needed)
//   ANTHROPIC_API_KEY=... deno task dev  Claude
// Never deployed: Supabase serves index.ts.
import type { DeviceRequest } from "../_shared/contracts/types.ts";
import { configFromEnv, type Deps } from "./deps.ts";
import { handle } from "./handler.ts";
import { ClaudeProvider } from "./llm/claude.ts";
import { FakeProvider } from "./llm/fake.ts";
import { makeLogger } from "./log.ts";

const DEV_USER = "00000000-0000-4000-8000-00000000d0d0";
const devices = new Map<string, { installId: string; req: DeviceRequest }>();
const claude = Deno.env.get("LLM_PROVIDER") === "fake" ? null : ClaudeProvider.fromEnv();

const deps: Deps = {
  auth: { verify: (jwt) => Promise.resolve(jwt === (Deno.env.get("DEV_TOKEN") ?? "dev") ? DEV_USER : null) },
  store: {
    isKnownDevice: (_u, d) => Promise.resolve(devices.has(d)),
    upsertDevice: (_u, req) => {
      for (const [id, d] of devices) if (d.installId === req.install_id) return Promise.resolve(id);
      const id = crypto.randomUUID();
      devices.set(id, { installId: req.install_id, req });
      return Promise.resolve(id);
    },
    consumeQuota: () => Promise.resolve({ allowed: true }),
    recordUsage: () => Promise.resolve(),
  },
  config: configFromEnv((k) => Deno.env.get(k)),
  llm: claude ?? new FakeProvider(),
  log: makeLogger(),
  now: () => Date.now(),
  requestId: () => crypto.randomUUID(),
};

const port = Number(Deno.env.get("PORT") ?? 8787);
console.log(`gateway dev server on http://localhost:${port}/gateway (model: ${claude ? "claude" : "fake"})`);
Deno.serve({ port }, (req) => handle(req, deps));
