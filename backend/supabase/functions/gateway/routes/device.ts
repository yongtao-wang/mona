// POST /v1/device (spec §12.4): register or refresh this install.
import type { DeviceRequest, DeviceResponse } from "../../_shared/contracts/types.ts";
import type { RouteContext } from "../handler.ts";

export async function registerDevice(ctx: RouteContext<DeviceRequest>): Promise<DeviceResponse> {
  const deviceId = await ctx.deps.store.upsertDevice(ctx.userId, ctx.body);
  return { device_id: deviceId };
}
