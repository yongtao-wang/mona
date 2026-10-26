-- Usage per user, day and endpoint (spec §11.4 step 9): tokens, cost and refusals only,
-- never content (I11). Called by the gateway with the service role.
create function public.record_usage(
  p_user_id uuid,
  p_endpoint text,
  p_input_tokens bigint,
  p_cached_tokens bigint,
  p_output_tokens bigint,
  p_cost_micros bigint,
  p_refused boolean
) returns void
language sql security definer set search_path = '' as $$
  insert into public.usage_daily as u
    (user_id, day, endpoint, calls, input_tokens, cached_tokens, output_tokens, refusals, cost_micros)
  values
    (p_user_id, (now() at time zone 'utc')::date, p_endpoint, 1, p_input_tokens, p_cached_tokens,
     p_output_tokens, case when p_refused then 1 else 0 end, p_cost_micros)
  on conflict (user_id, day, endpoint) do update set
    calls         = u.calls + 1,
    input_tokens  = u.input_tokens + excluded.input_tokens,
    cached_tokens = u.cached_tokens + excluded.cached_tokens,
    output_tokens = u.output_tokens + excluded.output_tokens,
    refusals      = u.refusals + excluded.refusals,
    cost_micros   = u.cost_micros + excluded.cost_micros;
$$;

revoke all on function public.record_usage(uuid, text, bigint, bigint, bigint, bigint, boolean)
  from public, anon, authenticated;
