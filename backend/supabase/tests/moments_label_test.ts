import { assert, assertEquals, assertFalse } from "@std/assert";
import type { MomentLabelRequest, MomentLabelResponse } from "../functions/_shared/contracts/types.ts";
import { handle } from "../functions/gateway/handler.ts";
import { NO_USAGE } from "../functions/gateway/llm/provider.ts";
import { checkCitations, renderCompact } from "../functions/gateway/routes/moments_label.ts";
import { deviceBody, errorCode, request, setup } from "./helpers.ts";

const labelBody = (purpose: "label" | "minutes" = "minutes"): MomentLabelRequest => ({
  schema_version: 1,
  moment: {
    ref: "m1",
    scene_hint: "meeting",
    local_date: "2026-10-27",
    local_start: "10:00",
    tz: "Asia/Taipei",
    duration_s: 1260,
    languages: ["en", "zh-TW"],
  },
  participants: ["S1", "ME"],
  mentioned: ["P1"],
  utterances: [
    { id: "u1", speaker: "S1", t: 0, text: "Can we lock the spec by Friday?", uncertain: false },
    { id: "u2", speaker: "ME", t: 4, text: "I'll send the draft to P1 by Thursday.", uncertain: false },
    { id: "u3", speaker: "S1", t: 9, text: "好，那我們禮拜五前定案", uncertain: true },
  ],
  options: { purpose, want_title: true },
});

const modelOutput = (extra: Partial<MomentLabelResponse> = {}) => ({
  scene: { label: "meeting", confidence: 0.9 },
  tone: "neutral",
  title: "Spec lock",
  summary: "S1 asked to lock the spec; ME will send the draft to P1.",
  items: [
    {
      id: "i1",
      type: "promise",
      text: "Send the spec draft to P1",
      owner: "ME",
      counterpart: "P1",
      due: { phrase: "by Thursday", date: "2026-10-29" },
      sources: ["u2"],
      confidence: 0.88,
    },
  ],
  minutes: { decisions: [], promises: ["i1"], open_questions: [], follow_up_draft: null },
  ...extra,
});

async function registered() {
  const t = setup();
  const res = await handle(request("/v1/device", { method: "POST", body: deviceBody() }), t.deps);
  const { device_id } = await res.json();
  t.usage.length = 0;
  const label = (body: unknown = labelBody()) =>
    handle(request("/v1/moments/label", { method: "POST", device: device_id, body: JSON.stringify(body) }), t.deps);
  return { ...t, label };
}

const ok = (output: unknown, modelId = "claude-sonnet-5-5") => ({
  kind: "ok" as const,
  output,
  usage: { inputTokens: 900, cachedTokens: 600, cacheWriteTokens: 0, outputTokens: 120 },
  modelId,
});

Deno.test("label: a valid model answer comes back with the prompt and model version", async () => {
  const t = await registered();
  t.llm.scripted.push(ok(modelOutput()));
  const res = await t.label();
  assertEquals(res.status, 200);
  const body: MomentLabelResponse = await res.json();
  assertEquals(body.model_version, "label-v1/claude-sonnet-5-5");
  assertEquals(body.items[0].sources, ["u2"]);
  assertEquals(t.usage, [{
    endpoint: "moments_label",
    usage: { inputTokens: 900, cachedTokens: 600, cacheWriteTokens: 0, outputTokens: 120 },
    costMicros: 1020,
    refused: false,
  }]);
});

Deno.test("label: the server picks the tier from the purpose", async () => {
  const t = await registered();
  await t.label(labelBody("minutes"));
  await t.label(labelBody("label"));
  assertEquals(t.llm.calls.map((c) => [c.tier, c.timeoutMs]), [["large", 90_000], ["small", 25_000]]);
});

Deno.test("label: the model sees the compact format, not JSON", async () => {
  const t = await registered();
  await t.label();
  const input = t.llm.calls[0].input;
  assert(input.includes("u2|ME|4|I'll send the draft to P1 by Thursday."));
  assert(input.includes("u3|S1?|9|"), "uncertain lines carry ?");
  assertFalse(input.includes('"utterances"'));
});

Deno.test("I9: items citing lines that are not in the request are dropped", async () => {
  const t = await registered();
  const items = [
    { ...modelOutput().items[0] },
    { ...modelOutput().items[0], id: "i2", sources: ["u99"] },
    { ...modelOutput().items[0], id: "i3", sources: ["u1", "u42"], owner: "S7" },
  ];
  t.llm.scripted.push(ok(modelOutput({
    items,
    minutes: { decisions: [], promises: ["i1", "i2", "i3"], open_questions: [], follow_up_draft: null },
  } as Partial<MomentLabelResponse>)));
  const body: MomentLabelResponse = await (await t.label()).json();
  assertEquals(body.items.map((i) => [i.id, i.sources, i.owner]), [["i1", ["u2"], "ME"], ["i3", ["u1"], null]]);
  assertEquals(body.minutes?.promises, ["i1", "i3"]);
  assert(t.logs.at(-1)!.includes('"items_dropped":1'));
});

Deno.test("label: an invalid answer is retried once with the problems, then 502", async () => {
  const t = await registered();
  t.llm.scripted.push(ok({ ...modelOutput(), tone: "angry" }), ok(modelOutput()));
  assertEquals((await t.label()).status, 200);
  assert(t.llm.calls[1].input.includes("/tone (enum)"));

  t.llm.scripted.push(ok({ nope: 1 }), { kind: "invalid", usage: NO_USAGE, modelId: "claude-sonnet-5-5" });
  const res = await t.label();
  assertEquals(res.status, 502);
  assertEquals(await errorCode(res), "model_output_invalid");
});

Deno.test("label: a refusal is 422, counted, and not retried", async () => {
  const t = await registered();
  t.llm.scripted.push({ kind: "refused", category: "general_harms", usage: NO_USAGE, modelId: "claude-haiku-5-5" });
  const res = await t.label(labelBody("label"));
  assertEquals(res.status, 422);
  assertEquals(await errorCode(res), "model_refused");
  assertEquals(t.llm.calls.length, 1);
  assertEquals(t.usage[0].refused, true);
});

Deno.test("label: no provider or the kill switch means 503 analysis_disabled", async () => {
  const t = await registered();
  t.deps.llm = null;
  assertEquals(await errorCode(await t.label()), "analysis_disabled");
  t.deps.llm = t.llm;
  t.deps.config = { ...t.deps.config, analysis_enabled: false };
  const res = await t.label();
  assertEquals(res.status, 503);
});

Deno.test("I11: the label route logs model and token counts, never transcript text", async () => {
  const t = await registered();
  t.llm.scripted.push(ok(modelOutput()));
  await t.label();
  const line = JSON.parse(t.logs.at(-1)!);
  assertEquals([line.model, line.input_tokens, line.output_tokens], ["claude-sonnet-5-5", 1500, 120]);
  for (const l of t.logs) {
    assertFalse(l.includes("draft"));
    assertFalse(l.includes("定案"));
  }
});

Deno.test("renderCompact flattens newlines and pipes inside text", () => {
  const body = labelBody();
  body.utterances[0].text = "a|b\nc";
  assert(renderCompact(body).includes("u1|S1|0|a b c"));
});

Deno.test("checkCitations keeps ME as a valid owner even when ME is not a participant", () => {
  const body = { ...labelBody(), participants: ["S1"] };
  const { response } = checkCitations({ ...modelOutput(), model_version: "x" } as MomentLabelResponse, body);
  assertEquals(response.items[0].owner, "ME");
});
