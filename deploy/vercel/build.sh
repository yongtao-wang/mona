#!/usr/bin/env bash
# Builds the hosted dev preview (spec D33) in Vercel's build step, from the repo root:
# the Flutter web app (fake capture engine, sample day) and the gateway with the fake
# model, written in Vercel's Build Output API v3 format (.vercel/output).
# Locally: FLUTTER_BIN=/path/to/flutter bash deploy/vercel/build.sh
set -euo pipefail
root="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$root"

flutter_version=$(python3 -c 'import json;print(json.load(open(".fvmrc"))["flutter"])' 2>/dev/null \
  || sed -E 's/.*"flutter": *"([^"]+)".*/\1/' .fvmrc)
if [[ -z "${FLUTTER_BIN:-}" ]]; then
  sdk="${TMPDIR:-/tmp}/flutter-$flutter_version"
  if [[ ! -x "$sdk/flutter/bin/flutter" ]]; then
    mkdir -p "$sdk"
    curl -fsSL "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${flutter_version}-stable.tar.xz" \
      | tar -xJ -C "$sdk"
    git config --global --add safe.directory "$sdk/flutter"
  fi
  FLUTTER_BIN="$sdk/flutter/bin/flutter"
fi
DENO_BIN="${DENO_BIN:-npx --yes deno@2.9.6}"

# Gateway: the real handler, fake model, in-memory store (vercel_entry.ts).
(cd backend/supabase && $DENO_BIN task bundle:vercel)

# Web app, calling the gateway on its own origin with the dev token.
(cd app \
  && ./tool/fetch_web_assets.sh \
  && "$FLUTTER_BIN" --disable-analytics >/dev/null 2>&1 || true)
(cd app && "$FLUTTER_BIN" build web --release \
  --dart-define=GATEWAY_URL=/api/gateway --dart-define=DEV_TOKEN=dev)

out=.vercel/output
rm -rf "$out"
mkdir -p "$out/static" "$out/functions/api/gateway.func"
cp -r app/build/web/. "$out/static/"
# CanvasKit comes from Google's CDN in this build; the local copies are unused.
rm -rf "$out/static/canvaskit"
cp backend/supabase/build/vercel/gateway.mjs "$out/functions/api/gateway.func/gateway.mjs"
cp deploy/vercel/function.mjs "$out/functions/api/gateway.func/index.mjs"
cat > "$out/functions/api/gateway.func/.vc-config.json" <<'JSON'
{ "runtime": "nodejs22.x", "handler": "index.mjs", "launcherType": "Nodejs", "maxDuration": 30 }
JSON
echo '{ "type": "module" }' > "$out/functions/api/gateway.func/package.json"
cat > "$out/config.json" <<'JSON'
{
  "version": 3,
  "routes": [
    { "src": "^/api/gateway/(.*)$", "dest": "/api/gateway?__path=$1" },
    { "handle": "filesystem" },
    { "src": "/.*", "dest": "/index.html" }
  ]
}
JSON
echo "built $out"
