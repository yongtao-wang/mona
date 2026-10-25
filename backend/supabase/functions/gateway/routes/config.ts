// GET /v1/config (spec §12.5): versions, limits and the analysis kill switch.
import type { ConfigResponse } from "../../_shared/contracts/types.ts";
import type { RouteContext } from "../handler.ts";

export function getConfig(ctx: RouteContext<undefined>): ConfigResponse {
  return ctx.deps.config;
}
