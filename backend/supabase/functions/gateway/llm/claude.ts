// Claude as the provider (spec §11.5, D11, D22), through the official SDK.
//
// Rules from the spec: no sampling parameters; structured output for the response
// schema; a refusal is HTTP 200 with stop_reason "refusal" and is returned, not retried;
// the system prompt is a cache breakpoint. Server-side refusal fallbacks are left off:
// the spec allows them only for models covered by the same zero-retention agreement.
import Anthropic from "@anthropic-ai/sdk";
import {
  type LlmProvider,
  type LlmRequest,
  type LlmResult,
  LlmTimeout,
  type ModelTier,
  type Usage,
} from "./provider.ts";

const MODELS: Record<ModelTier, string> = {
  large: "claude-sonnet-5-5",
  small: "claude-haiku-5-5",
};

/** List prices in dollars per million tokens (October 2026), so micro-dollars per token. */
const PRICES: Record<string, { input: number; output: number; cacheRead: number; cacheWrite: number }> = {
  "claude-sonnet-5-5": { input: 2, output: 10, cacheRead: 0.2, cacheWrite: 2.5 },
  "claude-haiku-5-5": { input: 0.1, output: 0.5, cacheRead: 0.01, cacheWrite: 0.125 },
};

export class ClaudeProvider implements LlmProvider {
  constructor(private readonly client: Anthropic) {}

  static fromEnv(): ClaudeProvider | null {
    const apiKey = Deno.env.get("ANTHROPIC_API_KEY");
    return apiKey ? new ClaudeProvider(new Anthropic({ apiKey, maxRetries: 1 })) : null;
  }

  async complete(req: LlmRequest): Promise<LlmResult> {
    const model = MODELS[req.tier];
    let response: Anthropic.Message;
    try {
      response = await this.client.messages.create({
        model,
        max_tokens: req.maxOutputTokens,
        system: [{ type: "text", text: req.system, cache_control: { type: "ephemeral" } }],
        messages: [{ role: "user", content: req.input }],
        output_config: { effort: req.effort, format: { type: "json_schema", schema: forStructuredOutput(req.schema) } },
      }, { timeout: req.timeoutMs });
    } catch (e) {
      if (e instanceof Anthropic.APIConnectionTimeoutError) throw new LlmTimeout();
      throw e;
    }

    const usage = usageOf(response.usage);
    const modelId = response.model;
    if (response.stop_reason === "refusal") {
      return { kind: "refused", category: response.stop_details?.category ?? null, usage, modelId };
    }
    if (response.stop_reason === "max_tokens") return { kind: "invalid", usage, modelId };
    const text = response.content.flatMap((b) => (b.type === "text" ? [b.text] : [])).join("");
    try {
      return { kind: "ok", output: JSON.parse(text), usage, modelId };
    } catch {
      return { kind: "invalid", usage, modelId };
    }
  }

  costMicros(modelId: string, u: Usage): number {
    const p = PRICES[modelId] ?? PRICES[MODELS.large];
    return Math.round(
      u.inputTokens * p.input + u.outputTokens * p.output + u.cachedTokens * p.cacheRead +
        u.cacheWriteTokens * p.cacheWrite,
    );
  }
}

function usageOf(u: Anthropic.Usage): Usage {
  return {
    inputTokens: u.input_tokens,
    cachedTokens: u.cache_read_input_tokens ?? 0,
    cacheWriteTokens: u.cache_creation_input_tokens ?? 0,
    outputTokens: u.output_tokens,
  };
}

/**
 * Structured outputs reject numeric and string-length constraints and complex array
 * constraints. They are dropped here; the gateway validates the full schema afterwards.
 */
export function forStructuredOutput(schema: unknown): Record<string, unknown> {
  const DROP = new Set([
    "minimum",
    "maximum",
    "minLength",
    "maxLength",
    "minItems",
    "maxItems",
    "maxProperties",
    "title",
    "description",
    "$id",
    "$schema",
  ]);
  // `isMap` marks objects whose keys are property names, not keywords.
  const walk = (v: unknown, isMap = false): unknown => {
    if (Array.isArray(v)) return v.map((x) => walk(x));
    if (v && typeof v === "object") {
      return Object.fromEntries(
        Object.entries(v)
          .filter(([k]) => isMap || !DROP.has(k))
          .map(([k, x]) => [k, walk(x, !isMap && (k === "properties" || k === "$defs"))]),
      );
    }
    return v;
  };
  return walk(schema) as Record<string, unknown>;
}
