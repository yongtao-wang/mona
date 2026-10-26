// Request validation against the cloud_contracts schemas (spec §11.4 step 3).
import { Ajv2020, type ErrorObject } from "ajv/dist/2020";
import { schemas } from "../_shared/contracts/schemas.ts";
import { GatewayError, type ValidationIssue } from "./errors.ts";

// Ajv puts instance data into errors when verbose; keep it off so values cannot leak.
const ajv = new Ajv2020({ allErrors: true, strict: true, verbose: false });
ajv.addFormat("uuid", /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i);
for (const s of Object.values(schemas)) ajv.addSchema(s as object);

export type SchemaName = keyof typeof schemas;

export function validate<T>(schema: SchemaName, body: unknown): T {
  const fn = ajv.getSchema(schemas[schema].$id);
  if (!fn) throw new Error(`schema not loaded: ${schema}`);
  if (!fn(body)) {
    const issues: ValidationIssue[] = (fn.errors ?? []).map((e: ErrorObject) => ({
      path: e.instancePath || "/",
      keyword: e.keyword,
    }));
    throw new GatewayError("invalid_request", undefined, issues);
  }
  rejectBinary(body, "");
  return body as T;
}

const DATA_URI = /^data:[^,]{0,100};base64,/i;
const BASE64_RUN = /[A-Za-z0-9+/]{200,}={0,2}/;

/**
 * I3: raw audio never leaves the phone. Text DTOs have no binary fields, so a string
 * that looks like a data URI or a long base64 run is rejected wherever it appears.
 */
export function rejectBinary(value: unknown, path: string): void {
  if (typeof value === "string") {
    if (DATA_URI.test(value) || BASE64_RUN.test(value)) {
      throw new GatewayError("invalid_request", undefined, [{ path: path || "/", keyword: "binary" }]);
    }
  } else if (Array.isArray(value)) {
    value.forEach((v, i) => rejectBinary(v, `${path}/${i}`));
  } else if (value && typeof value === "object") {
    for (const [k, v] of Object.entries(value)) rejectBinary(v, `${path}/${k}`);
  }
}

/** JSON paths and keywords of where [value] fails [schema], or an empty list. */
export function issuesOf(schema: SchemaName, value: unknown): ValidationIssue[] {
  const fn = ajv.getSchema(schemas[schema].$id)!;
  if (fn(value)) return [];
  return (fn.errors ?? []).map((e: ErrorObject) => ({ path: e.instancePath || "/", keyword: e.keyword }));
}

/**
 * [schema] as one self-contained document: cross-file `$ref`s to common.schema.json
 * are inlined, and [omit] top-level properties are removed (fields the gateway adds,
 * such as `model_version`). Used as the model's structured-output schema.
 */
export function selfContained(schema: SchemaName, omit: string[] = []): Record<string, unknown> {
  const defs = (schemas["common.schema.json"] as { $defs: Record<string, unknown> }).$defs;
  const inline = (v: unknown): unknown => {
    if (Array.isArray(v)) return v.map(inline);
    if (v && typeof v === "object") {
      const ref = (v as { $ref?: string }).$ref;
      if (ref?.startsWith("common.schema.json#/$defs/")) return inline(defs[ref.split("/").pop()!]);
      return Object.fromEntries(Object.entries(v).map(([k, x]) => [k, inline(x)]));
    }
    return v;
  };
  const out = inline(schemas[schema]) as {
    properties: Record<string, unknown>;
    required: string[];
  } & Record<string, unknown>;
  for (const key of omit) delete out.properties[key];
  out.required = out.required.filter((k) => !omit.includes(k));
  return out;
}
