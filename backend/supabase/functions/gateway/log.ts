// Structured logging with an allowlist of fields (spec §11.4 step 9, §18). Request and
// response bodies are never logged (I11): the entry type has no place for them, and
// the sink drops any key that is not on the list.
import type { ErrorCode } from "../_shared/contracts/types.ts";
import type { ValidationIssue } from "./errors.ts";

export type LogEntry = {
  request_id: string;
  route: string;
  status: number;
  latency_ms: number;
  code?: ErrorCode;
  validation?: ValidationIssue[];
  /** Model calls: model id and token counts (§11.4 step 9). */
  model?: string;
  input_tokens?: number;
  output_tokens?: number;
  /** Items dropped by the citation check (I9). */
  items_dropped?: number;
};

/** What a route may add to its request's log line. */
export type RouteLog = Pick<LogEntry, "model" | "input_tokens" | "output_tokens" | "items_dropped">;

const ALLOWED = new Set([
  "request_id",
  "route",
  "status",
  "latency_ms",
  "code",
  "validation",
  "model",
  "input_tokens",
  "output_tokens",
  "items_dropped",
]);

export type LogSink = (line: string) => void;

export function makeLogger(sink: LogSink = console.log): (e: LogEntry) => void {
  return (entry) => {
    const out: Record<string, unknown> = {};
    for (const [k, v] of Object.entries(entry)) if (ALLOWED.has(k) && v !== undefined) out[k] = v;
    if (out.validation) {
      out.validation = (out.validation as ValidationIssue[]).map(({ path, keyword }) => ({ path, keyword }));
    }
    sink(JSON.stringify(out));
  };
}
