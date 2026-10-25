-- Server schema (spec §11.2). The server holds accounts, devices, quotas, usage and
-- content-free telemetry. Nothing else (I11).

create table public.profile (
  user_id     uuid primary key references auth.users on delete cascade,
  created_at  timestamptz not null default now(),
  locale      text,
  region      text,                 -- market, from the App Store storefront at sign-up (§13.2)
  plan        text not null default 'alpha' check (plan in ('alpha','free','plus'))
);

create table public.device (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references auth.users on delete cascade,
  install_id   uuid not null,       -- random per install, kept in the Keychain; makes registration idempotent
  platform     text not null check (platform in ('ios','android','web')),   -- web: dev preview only (D26)
  app_version  text not null,
  os_version   text not null,
  model        text,
  created_at   timestamptz not null default now(),
  last_seen_at timestamptz not null default now(),
  unique (user_id, install_id)
);

create table public.usage_daily (
  user_id        uuid not null references auth.users on delete cascade,
  day            date not null,
  endpoint       text not null,
  calls          int  not null default 0,
  input_tokens   bigint not null default 0,
  cached_tokens  bigint not null default 0,
  output_tokens  bigint not null default 0,
  refusals       int  not null default 0,
  cost_micros    bigint not null default 0,   -- unit-cost metric (PRD)
  primary key (user_id, day, endpoint)
);

create unlogged table public.rate_window (
  user_id      uuid not null,
  window_start timestamptz not null,          -- truncated to the minute
  calls        int not null default 0,
  primary key (user_id, window_start)
);
-- TODO(hosted): prune hourly with pg_cron:
-- select cron.schedule('prune-rate-window', '0 * * * *',
--   $$delete from public.rate_window where window_start < now() - interval '1 hour'$$);

create table public.apple_credential (
  user_id                 uuid primary key references auth.users on delete cascade,
  refresh_token_secret_id uuid not null       -- Supabase Vault secret; used only to revoke at deletion
);

create table public.telemetry_event (
  id          bigint generated always as identity primary key,
  user_id     uuid references auth.users on delete cascade,
  device_id   uuid,
  name        text not null,
  props       jsonb not null default '{}',   -- whitelisted keys only, validated in the function
  occurred_at timestamptz not null,
  received_at timestamptz not null default now()
);

create table public.deletion_request (
  user_id      uuid primary key,
  requested_at timestamptz not null default now(),
  completed_at timestamptz
);

-- Per-plan daily caps (§11.4 step 2). Proposed starting values; alpha is generous, for measurement.
create table public.plan_quota (
  plan          text primary key check (plan in ('alpha','free','plus')),
  daily_calls   int    not null,
  daily_tokens  bigint not null,
  rate_per_min  int    not null default 30
);
insert into public.plan_quota (plan, daily_calls, daily_tokens) values
  ('alpha', 2000, 5000000),
  ('free',   100,  300000),
  ('plus',   600, 2000000);

-- A profile row for every new auth user.
create function public.handle_new_user() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  insert into public.profile (user_id) values (new.id) on conflict do nothing;
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Row-level security on every table. Users read their own profile, devices and usage;
-- every write goes through the gateway with the service role.
alter table public.profile          enable row level security;
alter table public.device           enable row level security;
alter table public.usage_daily      enable row level security;
alter table public.rate_window      enable row level security;
alter table public.apple_credential enable row level security;
alter table public.telemetry_event  enable row level security;
alter table public.deletion_request enable row level security;
alter table public.plan_quota       enable row level security;

create policy profile_read_own on public.profile
  for select to authenticated using (user_id = (select auth.uid()));
create policy device_read_own on public.device
  for select to authenticated using (user_id = (select auth.uid()));
create policy usage_read_own on public.usage_daily
  for select to authenticated using (user_id = (select auth.uid()));

-- Rate limit and daily caps in one round trip (§11.2). Returns whether the call may
-- proceed, the error code if not, and the seconds to put in Retry-After.
create function public.consume_quota(p_user_id uuid, p_endpoint text)
returns table (allowed boolean, code text, retry_after_s int)
language plpgsql security definer set search_path = '' as $$
declare
  v_now    timestamptz := now();
  v_window timestamptz := date_trunc('minute', v_now);
  v_quota  public.plan_quota;
  v_calls  int;
  v_day_calls  bigint;
  v_day_tokens bigint;
begin
  select q.* into v_quota
    from public.plan_quota q
    join public.profile p on p.plan = q.plan
   where p.user_id = p_user_id;
  if not found then
    select q.* into v_quota from public.plan_quota q where q.plan = 'free';
  end if;

  insert into public.rate_window as w (user_id, window_start, calls)
  values (p_user_id, v_window, 1)
  on conflict (user_id, window_start) do update set calls = w.calls + 1
  returning w.calls into v_calls;

  if v_calls > v_quota.rate_per_min then
    return query select false, 'rate_limited'::text,
      greatest(1, ceil(extract(epoch from (v_window + interval '1 minute' - v_now)))::int);
    return;
  end if;

  select coalesce(sum(u.calls), 0), coalesce(sum(u.input_tokens + u.output_tokens), 0)
    into v_day_calls, v_day_tokens
    from public.usage_daily u
   where u.user_id = p_user_id and u.day = (v_now at time zone 'utc')::date;

  if v_day_calls >= v_quota.daily_calls or v_day_tokens >= v_quota.daily_tokens then
    return query select false, 'quota_exceeded'::text,
      greatest(1, ceil(extract(epoch from
        ((date_trunc('day', v_now at time zone 'utc') + interval '1 day') at time zone 'utc' - v_now)))::int);
    return;
  end if;

  return query select true, null::text, 0;
end;
$$;

revoke all on function public.consume_quota(uuid, text) from public, anon, authenticated;
revoke all on function public.handle_new_user() from public, anon, authenticated;
