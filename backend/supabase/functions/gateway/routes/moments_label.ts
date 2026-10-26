// POST /v1/moments/label (spec §12.1, §11.4 steps 5 to 9): label one pseudonymized
// moment and extract its items.
import type { LabelItem, MomentLabelRequest, MomentLabelResponse } from "../../_shared/contracts/types.ts";
import { GatewayError } from "../errors.ts";
import { type LlmRequest, LlmTimeout, NO_USAGE, type Usage } from "../llm/provider.ts";
import { forStructuredOutput } from "../llm/claude.ts";
import { LABEL_PROMPT_VERSION, LABEL_SYSTEM } from "../prompts/label_v1.ts";
import type { RouteContext } from "../handler.ts";
import { issuesOf, selfContained } from "../validate.ts";

const OUTPUT_SCHEMA = forStructuredOutput(selfContained("moment_label_response.schema.json", ["model_version"]));

/** Tier, effort and limits per purpose; the client cannot pick a more expensive model. */
const PLAN = {
  label: { tier: "small", effort: "low", maxOutputTokens: 4000, timeoutMs: 25_000 },
  minutes: { tier: "large", effort: "medium", maxOutputTokens: 16_000, timeoutMs: 90_000 },
} as const;

export async function labelMoment(ctx: RouteContext<MomentLabelRequest>): Promise<MomentLabelResponse> {
  const { deps, body: req } = ctx;
  const llm = deps.llm;
  if (!llm || !deps.config.analysis_enabled) throw new GatewayError("analysis_disabled");

  const plan = PLAN[req.options.purpose];
  const base: Omit<LlmRequest, "input"> = { ...plan, system: LABEL_SYSTEM, schema: OUTPUT_SCHEMA };
  const rendered = renderCompact(req);
  let usage: Usage = NO_USAGE;
  let modelId = "";
  let input = rendered;

  const record = (refused: boolean) => {
    ctx.log.model = modelId || undefined;
    ctx.log.input_tokens = usage.inputTokens + usage.cachedTokens + usage.cacheWriteTokens;
    ctx.log.output_tokens = usage.outputTokens;
    return deps.store.recordUsage(ctx.userId, "moments_label", {
      usage,
      costMicros: modelId ? llm.costMicros(modelId, usage) : 0,
      refused,
    });
  };

  // One retry with the validation problems appended (§11.4 step 7).
  for (let attempt = 0; attempt < 2; attempt++) {
    let result;
    try {
      result = await llm.complete({ ...base, input });
    } catch (e) {
      await record(false);
      throw e instanceof LlmTimeout ? new GatewayError("upstream_timeout") : e;
    }
    usage = addUsage(usage, result.usage);
    modelId = result.modelId;

    if (result.kind === "refused") {
      await record(true);
      throw new GatewayError("model_refused");
    }
    if (result.kind === "ok") {
      const candidate = { ...(result.output as object), model_version: `${LABEL_PROMPT_VERSION}/${modelId}` };
      const issues = issuesOf("moment_label_response.schema.json", candidate);
      if (issues.length === 0) {
        const { response, dropped } = checkCitations(candidate as MomentLabelResponse, req);
        ctx.log.items_dropped = dropped;
        await record(false);
        return response;
      }
      input = `${rendered}\n\nYour previous answer did not match the schema at: ${
        issues.map((i) => `${i.path} (${i.keyword})`).join(", ")
      }. Answer again with valid JSON.`;
    } else {
      input =
        `${rendered}\n\nYour previous answer was cut off or was not JSON. Answer again with complete, valid JSON.`;
    }
  }
  await record(false);
  throw new GatewayError("model_output_invalid");
}

/**
 * The compact format (§11.5): a short header, then one line per utterance as
 * `id|speaker|seconds|text`, with "?" after the speaker token on uncertain lines.
 */
export function renderCompact(req: MomentLabelRequest): string {
  const m = req.moment;
  const header = [
    `moment: ${m.ref}`,
    `local_date: ${m.local_date}`,
    `local_start: ${m.local_start}`,
    `tz: ${m.tz}`,
    `duration_s: ${m.duration_s}`,
    `languages: ${m.languages.join(", ")}`,
    `scene_hint: ${m.scene_hint ?? "none"}`,
    `participants: ${req.participants.join(", ")}`,
    `mentioned: ${req.mentioned.join(", ") || "none"}`,
    `purpose: ${req.options.purpose}`,
    `want_title: ${req.options.want_title}`,
  ];
  const lines = req.utterances.map((u) =>
    `${u.id}|${u.speaker}${u.uncertain ? "?" : ""}|${u.t}|${u.text.replace(/[\r\n|]+/g, " ")}`
  );
  return [...header, "", ...lines].join("\n");
}

/**
 * I9: every item cites at least one line that is in the request. Unknown sources are
 * removed, items left with none are dropped, unknown owner or counterpart tokens become
 * null, and the minutes only list items that remain.
 */
export function checkCitations(
  res: MomentLabelResponse,
  req: MomentLabelRequest,
): { response: MomentLabelResponse; dropped: number } {
  const lineIds = new Set(req.utterances.map((u) => u.id));
  const tokens = new Set(["ME", ...req.participants, ...req.mentioned]);
  const known = (t: string | null | undefined) => (t && tokens.has(t) ? t : null);
  const items: LabelItem[] = [];
  for (const item of res.items) {
    const sources = item.sources.filter((s) => lineIds.has(s));
    if (sources.length === 0) continue;
    items.push({ ...item, sources, owner: known(item.owner), counterpart: known(item.counterpart) });
  }
  const kept = new Set(items.map((i) => i.id));
  const minutes = res.minutes
    ? {
      ...res.minutes,
      decisions: res.minutes.decisions.filter((i) => kept.has(i)),
      promises: res.minutes.promises.filter((i) => kept.has(i)),
      open_questions: res.minutes.open_questions.filter((i) => kept.has(i)),
    }
    : res.minutes;
  return { response: { ...res, items, minutes }, dropped: res.items.length - items.length };
}

function addUsage(a: Usage, b: Usage): Usage {
  return {
    inputTokens: a.inputTokens + b.inputTokens,
    cachedTokens: a.cachedTokens + b.cachedTokens,
    cacheWriteTokens: a.cacheWriteTokens + b.cacheWriteTokens,
    outputTokens: a.outputTokens + b.outputTokens,
  };
}
