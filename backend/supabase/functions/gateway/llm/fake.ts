// A deterministic stand-in for the model, for tests and for running the pipeline end to
// end without an API key (LLM_PROVIDER=fake). It reads the compact input and makes one
// item per line that sounds like a promise or a question.
import type { LlmProvider, LlmRequest, LlmResult, Usage } from "./provider.ts";

export class FakeProvider implements LlmProvider {
  /** Next results to return instead of the heuristic, for tests (consumed in order). */
  readonly scripted: LlmResult[] = [];
  readonly calls: LlmRequest[] = [];

  complete(req: LlmRequest): Promise<LlmResult> {
    this.calls.push(req);
    const next = this.scripted.shift();
    if (next) return Promise.resolve(next);
    return Promise.resolve({ kind: "ok", output: heuristic(req.input), usage: usageFor(req), modelId: "fake-1" });
  }

  costMicros(_modelId: string, u: Usage): number {
    return u.inputTokens + u.outputTokens;
  }
}

function usageFor(req: LlmRequest): Usage {
  return { inputTokens: Math.ceil(req.input.length / 4), cachedTokens: 0, cacheWriteTokens: 0, outputTokens: 50 };
}

const PROMISE = /\b(I'll|I will|will send|let me)\b|我會|我來|會寄/i;

function heuristic(input: string) {
  const header = Object.fromEntries(
    input.split("\n").filter((l) => l.includes(": ") && !l.includes("|")).map((l) => l.split(": ", 2)),
  );
  const lines = input.split("\n").filter((l) => /^u\d+\|/.test(l)).map((l) => {
    const [id, speaker, , ...text] = l.split("|");
    return { id, speaker: speaker.replace("?", ""), text: text.join("|") };
  });
  const items = lines.flatMap((l) => {
    const type = PROMISE.test(l.text) ? "promise" : /[?？]\s*$/.test(l.text) ? "question" : null;
    return type ? [{ type, text: l.text.slice(0, 200), owner: l.speaker, sources: [l.id] }] : [];
  }).map((it, i) => ({
    id: `i${i + 1}`,
    type: it.type,
    text: it.text,
    owner: it.owner,
    counterpart: null,
    due: null,
    sources: it.sources,
    confidence: 0.7,
  }));
  const minutes = header.purpose === "minutes"
    ? {
      decisions: [],
      promises: items.filter((i) => i.type === "promise").map((i) => i.id),
      open_questions: items.filter((i) => i.type === "question").map((i) => i.id),
      follow_up_draft: null,
    }
    : null;
  return {
    scene: { label: header.scene_hint === "meeting" ? "meeting" : "other", confidence: 0.5 },
    tone: "neutral",
    title: header.want_title === "true" ? (lines[0]?.text.slice(0, 40) ?? null) : null,
    summary: `${lines.length} lines; ${items.length} items.`,
    items,
    minutes,
  };
}
