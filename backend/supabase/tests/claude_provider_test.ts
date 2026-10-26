// The Claude adapter against a stubbed HTTP layer: what it sends, and how it reads
// answers, refusals and truncation. No network.
import Anthropic from "@anthropic-ai/sdk";
import { assert, assertEquals, assertFalse } from "@std/assert";
import { ClaudeProvider, forStructuredOutput } from "../functions/gateway/llm/claude.ts";
import type { LlmRequest } from "../functions/gateway/llm/provider.ts";

function provider(answer: Record<string, unknown>) {
  const sent: Record<string, unknown>[] = [];
  const fetch = (_url: string | URL | Request, init?: RequestInit) => {
    sent.push(JSON.parse(String(init?.body)));
    return Promise.resolve(
      new Response(
        JSON.stringify({
          id: "msg_1",
          type: "message",
          role: "assistant",
          model: (sent.at(-1) as { model: string }).model,
          content: [],
          stop_reason: "end_turn",
          stop_details: null,
          usage: { input_tokens: 100, output_tokens: 20, cache_read_input_tokens: 600, cache_creation_input_tokens: 0 },
          ...answer,
        }),
        { status: 200, headers: { "content-type": "application/json" } },
      ),
    );
  };
  const client = new Anthropic({ apiKey: "test", fetch, maxRetries: 0 });
  return { p: new ClaudeProvider(client), sent };
}

const req: LlmRequest = {
  tier: "small",
  system: "SYSTEM",
  input: "u1|ME|0|hello",
  schema: { type: "object", properties: { title: { type: "string", maxLength: 10 } }, required: ["title"] },
  effort: "low",
  maxOutputTokens: 4000,
  timeoutMs: 25_000,
};

Deno.test("Claude: sends structured output, effort and a cached system prompt; no sampling parameters", async () => {
  const { p, sent } = provider({ content: [{ type: "text", text: '{"title":"Hi"}' }] });
  const res = await p.complete(req);
  assertEquals(res.kind, "ok");
  if (res.kind === "ok") assertEquals(res.output, { title: "Hi" });
  type Sent = {
    model: string;
    system: unknown;
    output_config: { effort: string; format: { type: string; schema: { properties: Record<string, unknown> } } };
  };
  const body = sent[0] as Sent & Record<string, unknown>;
  assertEquals(body.model, "claude-haiku-5-5");
  assertEquals(body.system, [{ type: "text", text: "SYSTEM", cache_control: { type: "ephemeral" } }]);
  assertEquals(body.output_config.effort, "low");
  assertEquals(body.output_config.format.type, "json_schema");
  assertEquals(body.output_config.format.schema.properties.title, { type: "string" });
  for (const k of ["temperature", "top_p", "top_k", "thinking"]) assertFalse(k in body, k);
});

Deno.test("Claude: a refusal is returned with its category, not as output", async () => {
  const { p } = provider({
    stop_reason: "refusal",
    stop_details: { type: "refusal", category: "general_harms", explanation: null },
  });
  const res = await p.complete({ ...req, tier: "large" });
  assertEquals(res.kind, "refused");
  if (res.kind === "refused") {
    assertEquals(res.category, "general_harms");
    assertEquals(res.modelId, "claude-sonnet-5-5");
  }
});

Deno.test("Claude: truncated or non-JSON output is invalid", async () => {
  assertEquals(
    (await provider({ stop_reason: "max_tokens", content: [{ type: "text", text: '{"ti' }] }).p.complete(req)).kind,
    "invalid",
  );
  assertEquals((await provider({ content: [{ type: "text", text: "not json" }] }).p.complete(req)).kind, "invalid");
});

Deno.test("Claude: usage includes cache reads, and cost uses list prices", async () => {
  const { p } = provider({ content: [{ type: "text", text: '{"title":"x"}' }] });
  const res = await p.complete(req);
  assertEquals(res.usage, { inputTokens: 100, cachedTokens: 600, cacheWriteTokens: 0, outputTokens: 20 });
  // Sonnet 5.5: 1000 input × 2 + 100 output × 10 + 1000 cache reads × 0.2 = 3200 micro-dollars.
  assertEquals(
    p.costMicros("claude-sonnet-5-5", {
      inputTokens: 1000,
      cachedTokens: 1000,
      cacheWriteTokens: 0,
      outputTokens: 100,
    }),
    3200,
  );
});

Deno.test("forStructuredOutput drops unsupported keywords but keeps properties that share their names", () => {
  const out = forStructuredOutput({
    title: "X",
    type: "object",
    properties: { title: { type: ["string", "null"], maxLength: 200 }, n: { type: "number", minimum: 0, maximum: 1 } },
    required: ["title", "n"],
  });
  assertEquals(out, {
    type: "object",
    properties: { title: { type: ["string", "null"] }, n: { type: "number" } },
    required: ["title", "n"],
  });
  assert(!("title" in out));
});
