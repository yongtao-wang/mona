// The LLM provider adapter (spec §11.5, D11). The gateway talks only to this interface,
// so the provider decision stays cheap to change.

/** Chosen by the gateway from the route, never by the client (§11.4 step 5). */
export type ModelTier = "large" | "small";

export type Usage = {
  inputTokens: number;
  cachedTokens: number;
  cacheWriteTokens: number;
  outputTokens: number;
};

export type LlmRequest = {
  tier: ModelTier;
  /** Versioned prompt; stable prefix, cacheable. */
  system: string;
  /** Compact rendering of the pseudonymized request. */
  input: string;
  /** JSON Schema the output must follow (structured output). */
  schema: Record<string, unknown>;
  effort: "low" | "medium" | "high";
  maxOutputTokens: number;
  timeoutMs: number;
};

export type LlmResult =
  | { kind: "ok"; output: unknown; usage: Usage; modelId: string }
  | { kind: "refused"; category: string | null; usage: Usage; modelId: string }
  /** Cut off or not parseable; the gateway retries once, then returns 502. */
  | { kind: "invalid"; usage: Usage; modelId: string };

/** Thrown when the provider does not answer within `timeoutMs`; becomes 504. */
export class LlmTimeout extends Error {}

export interface LlmProvider {
  complete(req: LlmRequest): Promise<LlmResult>;
  /** Cost in micro-dollars for usage on a model this provider returned. */
  costMicros(modelId: string, usage: Usage): number;
}

export const NO_USAGE: Usage = { inputTokens: 0, cachedTokens: 0, cacheWriteTokens: 0, outputTokens: 0 };
