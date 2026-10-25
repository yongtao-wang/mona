// The error contract (spec §12.7). Error bodies never carry request content.
import type { ErrorCode, ErrorResponse } from "../_shared/contracts/types.ts";

const STATUS: Record<ErrorCode, number> = {
  invalid_request: 400,
  unauthorized: 401,
  device_unknown: 403,
  not_found: 404,
  method_not_allowed: 405,
  body_too_large: 413,
  model_refused: 422,
  upgrade_required: 426,
  rate_limited: 429,
  quota_exceeded: 429,
  internal: 500,
  model_output_invalid: 502,
  analysis_disabled: 503,
  upstream_timeout: 504,
};

const RETRYABLE: ReadonlySet<ErrorCode> = new Set<ErrorCode>([
  "unauthorized",
  "device_unknown",
  "rate_limited",
  "quota_exceeded",
  "internal",
  "model_output_invalid",
  "analysis_disabled",
  "upstream_timeout",
]);

export class GatewayError extends Error {
  constructor(
    readonly code: ErrorCode,
    readonly retryAfterS?: number,
    readonly validation?: ValidationIssue[],
  ) {
    super(code);
  }
}

/** Where and how a body failed validation: JSON path and keyword, never the value. */
export type ValidationIssue = { path: string; keyword: string };

export function statusOf(code: ErrorCode): number {
  return STATUS[code];
}

export function errorBody(code: ErrorCode, requestId: string): ErrorResponse {
  return { error: { code, retryable: RETRYABLE.has(code), request_id: requestId } };
}
