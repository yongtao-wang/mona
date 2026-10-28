// Local dev server: the real gateway handler with an in-memory store and a dev token,
// for running the app against the pipeline without a Supabase project (D31).
//   deno task dev                        fake model (no API key needed)
//   ANTHROPIC_API_KEY=... deno task dev  Claude
// Never deployed: Supabase serves index.ts.
import { devDeps } from "./dev_deps.ts";
import { handle } from "./handler.ts";
import { ClaudeProvider } from "./llm/claude.ts";
import { FakeProvider } from "./llm/fake.ts";

const env = (k: string) => Deno.env.get(k);
const claude = env("LLM_PROVIDER") === "fake" ? null : ClaudeProvider.fromEnv();
const deps = devDeps({ env, llm: claude ?? new FakeProvider() });

const port = Number(env("PORT") ?? 8787);
console.log(`gateway dev server on http://localhost:${port}/gateway (model: ${claude ? "claude" : "fake"})`);
Deno.serve({ port }, (req) => handle(req, deps));
