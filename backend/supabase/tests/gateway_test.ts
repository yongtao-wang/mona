import { assert, assertEquals, assertFalse, assertThrows } from "@std/assert";
import { handle, isBelow, routePath } from "../functions/gateway/handler.ts";
import { GatewayError } from "../functions/gateway/errors.ts";
import { validate } from "../functions/gateway/validate.ts";
import { BASE, deviceBody, errorCode, request, setup } from "./helpers.ts";

Deno.test("route paths are found under the function prefix", () => {
  assertEquals(routePath(BASE + "/v1/device"), "/v1/device");
  assertEquals(routePath("http://localhost/gateway/v1/config/"), "/v1/config");
});

Deno.test("version comparison", () => {
  assert(isBelow("0.0.9", "0.1.0"));
  assert(isBelow("0.9.0", "0.10.0"));
  assertFalse(isBelow("0.1.0", "0.1.0"));
  assertFalse(isBelow("1.0.0", "0.9.9"));
  assert(isBelow("", "0.1.0"));
});

Deno.test("POST /v1/device registers and is idempotent per install", async () => {
  const { deps, devices } = setup();
  const r1 = await handle(request("/v1/device", { method: "POST", body: deviceBody() }), deps);
  assertEquals(r1.status, 200);
  const { device_id } = await r1.json();
  const r2 = await handle(
    request("/v1/device", { method: "POST", body: deviceBody({ app_version: "0.2.0" }) }),
    deps,
  );
  assertEquals((await r2.json()).device_id, device_id);
  assertEquals(devices.size, 1);
  assertEquals(devices.get(device_id)!.req.app_version, "0.2.0");
});

Deno.test("GET /v1/config returns the config for a known device", async () => {
  const { deps } = setup();
  const reg = await handle(request("/v1/device", { method: "POST", body: deviceBody() }), deps);
  const { device_id } = await reg.json();
  const res = await handle(request("/v1/config", { device: device_id }), deps);
  assertEquals(res.status, 200);
  const body = await res.json();
  assertEquals(body.max_body_kb, 256);
  assertEquals(body.analysis_enabled, true);
  assertEquals(res.headers.get("access-control-allow-origin"), "*");
});

Deno.test("error contract: every failure has a code, retryable flag and request id", async () => {
  const cases: [Request, number, string][] = [
    [request("/v1/nope"), 404, "not_found"],
    [request("/v1/device"), 405, "method_not_allowed"],
    [request("/v1/config", { headers: { "x-app-version": "0.0.1" } }), 426, "upgrade_required"],
    [request("/v1/config", { jwt: null }), 401, "unauthorized"],
    [request("/v1/config", { jwt: "bad" }), 401, "unauthorized"],
    [request("/v1/config"), 403, "device_unknown"],
    [request("/v1/config", { device: "99999999-9999-4999-8999-999999999999" }), 403, "device_unknown"],
    [request("/v1/device", { method: "POST", body: "{not json" }), 400, "invalid_request"],
    [request("/v1/device", { method: "POST", body: deviceBody({ extra: 1 }) }), 400, "invalid_request"],
    [request("/v1/device", { method: "POST", body: deviceBody({ platform: "symbian" }) }), 400, "invalid_request"],
  ];
  for (const [req, status, code] of cases) {
    const res = await handle(req, setup().deps);
    assertEquals(res.status, status, `${req.method} ${req.url}`);
    assertEquals(await errorCode(res), code);
    assert(res.headers.get("x-request-id"));
  }
});

Deno.test("quota failures return 429 with Retry-After", async () => {
  const { deps } = setup({ quota: { allowed: false, code: "rate_limited", retryAfterS: 17 } });
  const res = await handle(request("/v1/device", { method: "POST", body: deviceBody() }), deps);
  assertEquals(res.status, 429);
  assertEquals(res.headers.get("retry-after"), "17");
  assertEquals(await errorCode(res), "rate_limited");
});

Deno.test("bodies over 256 KB are rejected with 413", async () => {
  const big = deviceBody({ os_version: "x".repeat(300 * 1024) });
  const res = await handle(request("/v1/device", { method: "POST", body: big }), setup().deps);
  assertEquals(res.status, 413);
  assertEquals(await errorCode(res), "body_too_large");
});

Deno.test("I3: a data URI in any string field is rejected", async () => {
  const model = "data:audio/aac;base64,AAAA";
  const res = await handle(request("/v1/device", { method: "POST", body: deviceBody({ model }) }), setup().deps);
  assertEquals(res.status, 400);
});

Deno.test("I3: a long base64 run inside transcript text is rejected", () => {
  const blob = btoa(String.fromCharCode(...new Uint8Array(300).map((_, i) => i % 256)));
  const label = (text: string) => ({
    schema_version: 1,
    moment: {
      ref: "m1",
      scene_hint: null,
      local_date: "2026-10-27",
      local_start: "10:00",
      tz: "Asia/Taipei",
      duration_s: 60,
      languages: ["zh-TW"],
    },
    participants: ["ME"],
    mentioned: [],
    utterances: [{ id: "u1", speaker: "ME", t: 0, text, uncertain: false }],
    options: { purpose: "label", want_title: true },
  });
  validate("moment_label_request.schema.json", label("I'll send the draft by Thursday."));
  const err = assertThrows(() => validate("moment_label_request.schema.json", label(`see ${blob}`)), GatewayError);
  assertEquals(err.validation, [{ path: "/utterances/0/text", keyword: "binary" }]);
});

Deno.test("I11: logs carry paths and codes, never request values", async () => {
  const secret = "陳怡君-secret-value";
  const { deps, logs } = setup();
  await handle(request("/v1/device", { method: "POST", body: deviceBody({ os_version: 7, model: secret }) }), deps);
  await handle(request("/v1/device", { method: "POST", body: deviceBody({ model: secret }) }), deps);
  assertEquals(logs.length, 2);
  for (const line of logs) assertFalse(line.includes(secret), line);
  const first = JSON.parse(logs[0]);
  assertEquals(first.code, "invalid_request");
  assertEquals(first.validation, [{ path: "/os_version", keyword: "type" }]);
  assertEquals(JSON.parse(logs[1]).status, 200);
});

Deno.test("unexpected failures return 500 internal without details", async () => {
  const { deps, logs } = setup({ throwOnUpsert: true });
  const res = await handle(request("/v1/device", { method: "POST", body: deviceBody() }), deps);
  assertEquals(res.status, 500);
  assertEquals(await res.json(), { error: { code: "internal", retryable: true, request_id: "req-1" } });
  assertFalse(logs[0].includes("db down"));
});

Deno.test("CORS preflight is answered for the web preview", async () => {
  const res = await handle(new Request(BASE + "/v1/config", { method: "OPTIONS" }), setup().deps);
  assertEquals(res.status, 204);
  assert(res.headers.get("access-control-allow-headers")!.includes("x-device-id"));
});
