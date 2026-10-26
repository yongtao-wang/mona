import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/misc.dart';

import 'cloud/cloud_services.dart';
import 'core/flags.dart';
import 'core/flavor.dart';
import 'core/log.dart';
import 'data/connection/connection.dart';
import 'data/database.dart';
import 'data/key_store.dart';
import 'domain/sample_day.dart';
import 'domain/session_recorder.dart';
import 'engines/capture_engine.dart';
import 'engines/fake_capture_engine.dart';
import 'providers.dart';

/// What [bootstrap] sets up: the provider overrides the app runs with, and the recorder
/// that commits engine events (tests wait on [SessionRecorder.idle]).
class Bootstrapped {
  const Bootstrapped(this.overrides, this.recorder);
  final List<Override> overrides;
  final SessionRecorder recorder;
}

/// Opens the database, seeds flags and starts the engine-to-DB recorder. The retention
/// job runs first here once media exists (I8, spec §10.5).
Future<Bootstrapped> bootstrap({
  required AppEnv env,
  AppDatabase? database,
  CaptureEngine? engine,
  Clock clock = const Clock(),
  bool? sampleDay,
  String language = 'en',
}) async {
  final log = Log();
  final db = database ?? AppDatabase(openConnection(keys: InMemoryKeyStore()));
  final flags = Flags(db, env.flavor);
  await flags.seed();

  // The iOS engine replaces the fake once packages/capture_engine exists.
  final capture = engine ?? FakeCaptureEngine(clock: clock);
  final recorder = SessionRecorder(db, capture)..start();

  if (env.flavor == Flavor.dev && (sampleDay ?? await flags.boolFlag('dev.sample_day'))) {
    await SampleDay(db, clock, languageCode: language).seedIfEmpty();
  }
  log.event('app_started', {'flavor': env.flavor.name, 'count': kIsWeb ? 1 : 0});

  final cloud = await CloudServices.create(
    env: env,
    db: db,
    clock: clock,
    log: log,
    uncertainBelow: await flags.doubleFlag('tau_uncertain'),
  );
  // Never blocks the UI; failures are queued and retried (§8.8).
  if (cloud != null) unawaited(cloud.start().catchError((Object e, StackTrace st) => log.error('cloud_start', e, st)));

  return Bootstrapped([
    envProvider.overrideWithValue(env),
    databaseProvider.overrideWithValue(db),
    captureEngineProvider.overrideWithValue(capture),
    clockProvider.overrideWithValue(clock),
    logProvider.overrideWithValue(log),
    cloudProvider.overrideWithValue(cloud),
  ], recorder);
}
