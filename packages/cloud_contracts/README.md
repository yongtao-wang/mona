# cloud_contracts

JSON Schemas for the gateway (spec §12) and the code generated from them.

- `schemas/` — the source of truth.
- `dart/` — Dart package used by the app (`lib/src/contracts.dart` is generated).
- `../../backend/supabase/functions/_shared/contracts/` — TypeScript types and the schema bundle the gateway validates with (generated).

Change a schema, then run `deno task gen` here and commit the generated files. CI fails if they differ.
