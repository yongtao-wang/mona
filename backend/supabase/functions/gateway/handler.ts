// The gateway (spec §11.4, D6): one function, internal routing. Every request passes
// the same checks in order: route, app version, body size, JWT, device, quota, schema.
import type { DeviceRequest } from "../_shared/contracts/types.ts";
import type { Deps } from "./deps.ts";
import { MAX_BODY_BYTES } from "./deps.ts";
import { errorBody, GatewayError, statusOf } from "./errors.ts";
import { getConfig } from "./routes/config.ts";
import { registerDevice } from "./routes/device.ts";
import { type SchemaName, validate } from "./validate.ts";

export type RouteContext<B> = { deps: Deps; userId: string; deviceId: string | null; body: B };

type Route = {
  method: "GET" | "POST" | "DELETE";
  /** Endpoint name for quotas and usage. */
  endpoint: string;
  requestSchema?: SchemaName;
  /** Only /v1/device may be called before the device is registered. */
  needsDevice: boolean;
  // deno-lint-ignore no-explicit-any
  handle: (ctx: RouteContext<any>) => unknown | Promise<unknown>;
};

const ROUTES: Record<string, Route> = {
  "/v1/device": {
    method: "POST",
    endpoint: "device",
    requestSchema: "device_request.schema.json",
    needsDevice: false,
    handle: (ctx: RouteContext<DeviceRequest>) => registerDevice(ctx),
  },
  "/v1/config": { method: "GET", endpoint: "config", needsDevice: true, handle: getConfig },
};

const CORS: Record<string, string> = {
  "access-control-allow-origin": "*",
  "access-control-allow-methods": "GET, POST, DELETE, OPTIONS",
  "access-control-allow-headers": "authorization, apikey, content-type, x-client-info, x-device-id, x-app-version",
};

const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
const SEMVER = /^(\d+)\.(\d+)\.(\d+)$/;

/** Supabase serves the function under /gateway (or /functions/v1/gateway); routes start at /v1/. */
export function routePath(url: string): string {
  const path = new URL(url).pathname.replace(/\/+$/, "");
  const i = path.indexOf("/gateway/");
  return i < 0 ? path : path.slice(i + "/gateway".length);
}

export function isBelow(version: string, min: string): boolean {
  const a = SEMVER.exec(version), b = SEMVER.exec(min);
  if (!a || !b) return true;
  for (let i = 1; i <= 3; i++) {
    if (Number(a[i]) !== Number(b[i])) return Number(a[i]) < Number(b[i]);
  }
  return false;
}

function json(status: number, body: unknown, extra: Record<string, string> = {}): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { "content-type": "application/json", ...CORS, ...extra },
  });
}

async function readBody(req: Request): Promise<unknown> {
  const declared = Number(req.headers.get("content-length") ?? "0");
  if (declared > MAX_BODY_BYTES) throw new GatewayError("body_too_large");
  const bytes = new Uint8Array(await req.arrayBuffer());
  if (bytes.length > MAX_BODY_BYTES) throw new GatewayError("body_too_large");
  try {
    return JSON.parse(new TextDecoder("utf-8", { fatal: true }).decode(bytes));
  } catch {
    throw new GatewayError("invalid_request", undefined, [{ path: "/", keyword: "json" }]);
  }
}

export async function handle(req: Request, deps: Deps): Promise<Response> {
  if (req.method === "OPTIONS") return new Response(null, { status: 204, headers: CORS });

  const started = deps.now();
  const requestId = deps.requestId();
  const path = routePath(req.url);
  const route = ROUTES[path];
  const routeName = route ? path : "unknown";

  try {
    if (!route) throw new GatewayError("not_found");
    if (req.method !== route.method) throw new GatewayError("method_not_allowed");

    const appVersion = req.headers.get("x-app-version") ?? "";
    if (isBelow(appVersion, deps.config.min_app_version)) throw new GatewayError("upgrade_required");

    const auth = req.headers.get("authorization") ?? "";
    const jwt = auth.startsWith("Bearer ") ? auth.slice(7) : "";
    const userId = jwt ? await deps.auth.verify(jwt) : null;
    if (!userId) throw new GatewayError("unauthorized");

    let deviceId: string | null = null;
    if (route.needsDevice) {
      deviceId = req.headers.get("x-device-id");
      if (!deviceId || !UUID.test(deviceId) || !(await deps.store.isKnownDevice(userId, deviceId))) {
        throw new GatewayError("device_unknown");
      }
    }

    const quota = await deps.store.consumeQuota(userId, route.endpoint);
    if (!quota.allowed) throw new GatewayError(quota.code, quota.retryAfterS);

    const body = route.requestSchema ? validate(route.requestSchema, await readBody(req)) : undefined;
    const result = await route.handle({ deps, userId, deviceId, body });

    deps.log({ request_id: requestId, route: routeName, status: 200, latency_ms: deps.now() - started });
    return json(200, result, { "x-request-id": requestId });
  } catch (e) {
    const err = e instanceof GatewayError ? e : new GatewayError("internal");
    const status = statusOf(err.code);
    deps.log({
      request_id: requestId,
      route: routeName,
      status,
      latency_ms: deps.now() - started,
      code: err.code,
      validation: err.validation,
    });
    const extra: Record<string, string> = { "x-request-id": requestId };
    if (err.retryAfterS !== undefined) extra["retry-after"] = String(err.retryAfterS);
    return json(status, errorBody(err.code, requestId), extra);
  }
}
