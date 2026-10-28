// Hosted dev preview on Vercel (D33): the real gateway handler with the fake model and
// an in-memory store, as Web-standard handlers for Vercel's Node runtime. Bundled into
// one file by `deno task bundle:vercel`. No API key and no real data.
import { devDeps } from "./dev_deps.ts";
import { handle } from "./handler.ts";
import { FakeProvider } from "./llm/fake.ts";

declare const process: { env: Record<string, string | undefined> };

const deps = devDeps({ env: (k) => process.env[k], llm: new FakeProvider(), trustAnyDevice: true });
const serve = (req: Request) => handle(req, deps);

export const GET = serve;
export const POST = serve;
export const OPTIONS = serve;
