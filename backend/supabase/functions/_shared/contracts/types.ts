// GENERATED from packages/cloud_contracts/schemas. Do not edit.
// Run `deno task gen` in packages/cloud_contracts.

/**
 * GET /v1/config (spec §12.5). analysis_enabled is the kill switch.
 */
export type ConfigResponse = {
    analysis_enabled: boolean;
    max_body_kb:      number;
    min_app_version:  string;
    prompt_versions:  PromptVersions;
    recap_enabled:    boolean;
}

export type PromptVersions = {
    label: string;
    recap: string;
}

/**
 * POST /v1/device (spec §12.4). Idempotent per (user, install_id).
 */
export type DeviceRequest = {
    app_version:    string;
    install_id:     string;
    model?:         null | string;
    os_version:     string;
    platform:       Platform;
    schema_version: number;
}

export type Platform = "ios" | "android" | "web";

export type DeviceResponse = {
    device_id: string;
}

/**
 * Every gateway error (spec §12.7). Never contains request content.
 */
export type ErrorResponse = {
    error: ErrorBody;
}

export type ErrorBody = {
    code:       ErrorCode;
    request_id: string;
    retryable:  boolean;
}

export type ErrorCode = "invalid_request" | "unauthorized" | "device_unknown" | "not_found" | "method_not_allowed" | "body_too_large" | "model_refused" | "upgrade_required" | "rate_limited" | "quota_exceeded" | "internal" | "model_output_invalid" | "analysis_disabled" | "upstream_timeout";

/**
 * POST /v1/moments/label (spec §12.1). Pseudonymized; ids are per-request aliases.
 */
export type MomentLabelRequest = {
    mentioned:      string[];
    moment:         LabelMoment;
    options:        LabelOptions;
    participants:   string[];
    schema_version: number;
    utterances:     LabelUtterance[];
}

export type LabelMoment = {
    duration_s:  number;
    languages:   string[];
    local_date:  string;
    local_start: string;
    ref:         string;
    scene_hint:  SceneHint | null;
    tz:          string;
}

export type SceneHint = "meeting" | "commute" | "solo";

export type LabelOptions = {
    purpose:    LabelPurpose;
    want_title: boolean;
}

export type LabelPurpose = "label" | "minutes";

export type LabelUtterance = {
    id:      string;
    speaker: string;
    /**
     * Seconds from the moment's start
     */
    t:         number;
    text:      string;
    uncertain: boolean;
}

export type MomentLabelResponse = {
    items:         LabelItem[];
    minutes:       Minutes | null;
    model_version: string;
    scene:         SceneLabel;
    summary:       string;
    title:         null | string;
    tone:          Tone;
}

export type LabelItem = {
    confidence:  number;
    counterpart: null | string;
    due:         Due | null;
    id:          string;
    owner:       null | string;
    sources:     string[];
    text:        string;
    type:        ItemType;
}

export type Due = {
    date:   null | string;
    phrase: string;
}

export type ItemType = "promise" | "decision" | "fact" | "question";

export type Minutes = {
    decisions:       string[];
    follow_up_draft: null | string;
    open_questions:  string[];
    promises:        string[];
}

export type SceneLabel = {
    confidence: number;
    label:      string;
}

export type Tone = "neutral" | "positive" | "negative" | "conflict";

/**
 * POST /v1/recap (spec §12.2). Tokens are day-scoped for this request.
 */
export type RecapRequest = {
    day:            string;
    items:          RecapItem[];
    marks:          RecapMark[];
    max_entries:    number;
    moments:        RecapMoment[];
    preferences:    RecapPreferences;
    schema_version: number;
    stats:          RecapStats;
    tz:             string;
}

export type RecapItem = {
    confidence: number;
    direction:  Direction;
    due_date:   null | string;
    moment:     string;
    ref:        string;
    text:       string;
    type:       ItemType;
}

export type Direction = "by_user" | "to_user" | "other";

export type RecapMark = {
    local_time: string;
    moment:     string;
}

export type RecapMoment = {
    duration_s:  number;
    local_start: string;
    ref:         string;
    scene:       null | string;
    summary:     null | string;
    title:       null | string;
}

export type RecapPreferences = {
    counterpart_right: { [key: string]: number };
    not_important:     { [key: string]: number };
    right:             { [key: string]: number };
}

export type RecapStats = {
    longest_moment_s: number;
    meeting_s:        number;
    moments:          number;
}

export type RecapResponse = {
    fun_line:      null | string;
    highlight:     null | string;
    model_version: string;
    quiet_day:     boolean;
    ranked:        string[];
}

/**
 * POST /v1/telemetry (spec §12.3, §15). Content-free; property keys are whitelisted per
 * event name by the gateway.
 */
export type TelemetryRequest = {
    events:         TelemetryEvent[];
    schema_version: number;
}

export type TelemetryEvent = {
    name: string;
    /**
     * UTC epoch milliseconds
     */
    occurred_at: number;
    props:       { [key: string]: boolean | number | string };
}

