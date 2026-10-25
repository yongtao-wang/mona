# engine_api

The Pigeon contract between the Flutter app and the native engines (spec §5.3, D3).

- `pigeons/engine.dart` — the source of truth.
- `lib/src/engine_api.g.dart`, `ios/Sources/EngineApi/EngineApi.g.swift` — generated; do not edit.

Regenerate after changing the contract:

```sh
dart run pigeon --input pigeons/engine.dart
```

The app does not use this package yet: until the Swift engines exist, `app/lib/engines/` runs on
`FakeCaptureEngine`. The capture and speech plugins (`packages/capture_engine`, `packages/speech_engine`)
implement these host APIs on iOS.
