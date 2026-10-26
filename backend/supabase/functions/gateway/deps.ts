// What the gateway needs from the outside world. Tests pass fakes; index.ts wires
// Supabase (supabase_deps.ts).
import type { ConfigResponse, DeviceRequest } from "../_shared/contracts/types.ts";
import type { LlmProvider, Usage } from "./llm/provider.ts";
import { LABEL_PROMPT_VERSION } from "./prompts/label_v1.ts";
import type { LogEntry } from "./log.ts";

export type QuotaResult =
  | { allowed: true }
  | { allowed: false; code: "rate_limited" | "quota_exceeded"; retryAfterS: number };

export interface AuthVerifier {
  /** The user id for a valid access token, or null. */
  verify(jwt: string): Promise<string | null>;
}

export interface Store {
  isKnownDevice(userId: string, deviceId: string): Promise<boolean>;
  upsertDevice(userId: string, req: DeviceRequest): Promise<string>;
  consumeQuota(userId: string, endpoint: string): Promise<QuotaResult>;
  /** Adds one call's tokens, cost and refusal to `usage_daily`. Never content (I11). */
  recordUsage(
    userId: string,
    endpoint: string,
    u: { usage: Usage; costMicros: number; refused: boolean },
  ): Promise<void>;
}

export type Deps = {
  auth: AuthVerifier;
  store: Store;
  config: ConfigResponse;
  /** Null when no provider is configured: analysis routes answer 503 analysis_disabled. */
  llm: LlmProvider | null;
  log: (e: LogEntry) => void;
  now: () => number;
  requestId: () => string;
};

export const MAX_BODY_BYTES = 256 * 1024;

export function configFromEnv(env: (k: string) => string | undefined): ConfigResponse {
  return {
    min_app_version: env("MIN_APP_VERSION") ?? "0.1.0",
    analysis_enabled: (env("ANALYSIS_ENABLED") ?? "true") === "true",
    recap_enabled: (env("RECAP_ENABLED") ?? "true") === "true",
    prompt_versions: {
      label: LABEL_PROMPT_VERSION,
      recap: env("PROMPT_VERSION_RECAP") ?? "recap-v0",
    },
    max_body_kb: MAX_BODY_BYTES / 1024,
  };
}
