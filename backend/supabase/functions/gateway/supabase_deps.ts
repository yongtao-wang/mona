// Production wiring: Supabase Auth for JWTs, Postgres through the service role.
import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import type { DeviceRequest } from "../_shared/contracts/types.ts";
import type { AuthVerifier, QuotaResult, Store } from "./deps.ts";

export function supabaseAdmin(): SupabaseClient {
  return createClient(Deno.env.get("SUPABASE_URL")!, Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
}

export class SupabaseAuth implements AuthVerifier {
  constructor(private readonly db: SupabaseClient) {}
  async verify(jwt: string): Promise<string | null> {
    const { data, error } = await this.db.auth.getUser(jwt);
    return error || !data.user ? null : data.user.id;
  }
}

export class SupabaseStore implements Store {
  constructor(private readonly db: SupabaseClient) {}

  async isKnownDevice(userId: string, deviceId: string): Promise<boolean> {
    const { data, error } = await this.db.from("device").select("id")
      .eq("id", deviceId).eq("user_id", userId).maybeSingle();
    if (error) throw new Error(`device lookup failed: ${error.code}`);
    return data !== null;
  }

  async upsertDevice(userId: string, req: DeviceRequest): Promise<string> {
    const { data, error } = await this.db.from("device").upsert({
      user_id: userId,
      install_id: req.install_id,
      platform: req.platform,
      app_version: req.app_version,
      os_version: req.os_version,
      model: req.model ?? null,
      last_seen_at: new Date().toISOString(),
    }, { onConflict: "user_id,install_id" }).select("id").single();
    if (error) throw new Error(`device upsert failed: ${error.code}`);
    return data.id;
  }

  async consumeQuota(userId: string, endpoint: string): Promise<QuotaResult> {
    const { data, error } = await this.db.rpc("consume_quota", { p_user_id: userId, p_endpoint: endpoint });
    if (error) throw new Error(`consume_quota failed: ${error.code}`);
    const row = (data as { allowed: boolean; code: string | null; retry_after_s: number }[])[0];
    if (row.allowed) return { allowed: true };
    return { allowed: false, code: row.code as "rate_limited" | "quota_exceeded", retryAfterS: row.retry_after_s };
  }
}
