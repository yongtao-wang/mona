#!/usr/bin/env bash
# Downloads the SQLite WebAssembly module and drift's web worker for the dev web
# preview (D26), at the versions pinned in pubspec.lock.
set -euo pipefail
cd "$(dirname "$0")/.."
version() { awk -v p="  $1:" '$0==p{f=1} f&&/version:/{gsub(/"/,"",$2); print $2; exit}' pubspec.lock; }
sqlite3=$(version sqlite3)
drift=$(version drift)
curl -fsSL -o web/sqlite3.wasm "https://github.com/simolus3/sqlite3.dart/releases/download/sqlite3-${sqlite3}/sqlite3.wasm"
curl -fsSL -o web/drift_worker.js "https://github.com/simolus3/drift/releases/download/drift-${drift}/drift_worker.js"
echo "web assets: sqlite3 ${sqlite3}, drift ${drift}"
