// Dependencies for running the real gateway handler without Supabase: an in-memory
// store, a fixed dev token instead of Supabase Auth, and no quotas. Used by the local
// dev server and the hosted dev preview (D31, D33). Never by the Supabase function.
import type { DeviceRequest } from "../_shared/contracts/types.ts";
import { configFromEnv, type Deps } from "./deps.ts";
import type { LlmProvider } from "./llm/provider.ts";
import { makeLogger } from "./log.ts";

const DEV_USER = "00000000-0000-4000-8000-00000000d0d0";

export function devDeps(opts: {
  env: (key: string) => string | undefined;
  llm: LlmProvider;
  /**
   * Serverless instances don't share memory, so a device registered on one instance is
   * unknown on the next. With this set, any device id is accepted for the dev user.
   */
  trustAnyDevice?: boolean;
}): Deps {
  const devices = new Map<string, { installId: string; req: DeviceRequest }>();
  const token = opts.env("DEV_TOKEN") ?? "dev";
  return {
    auth: { verify: (jwt) => Promise.resolve(jwt === token ? DEV_USER : null) },
    store: {
      isKnownDevice: (_u, d) => Promise.resolve(opts.trustAnyDevice === true || devices.has(d)),
      upsertDevice: (_u, req) => {
        for (const [id, d] of devices) if (d.installId === req.install_id) return Promise.resolve(id);
        const id = crypto.randomUUID();
        devices.set(id, { installId: req.install_id, req });
        return Promise.resolve(id);
      },
      consumeQuota: () => Promise.resolve({ allowed: true }),
      recordUsage: () => Promise.resolve(),
    },
    config: configFromEnv(opts.env),
    llm: opts.llm,
    log: makeLogger(),
    now: () => Date.now(),
    requestId: () => crypto.randomUUID(),
  };
}
