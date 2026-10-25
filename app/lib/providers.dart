import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/flags.dart';
import 'core/flavor.dart';
import 'core/log.dart';
import 'data/database.dart';
import 'domain/today.dart';
import 'engines/capture_engine.dart';

/// Overridden in [bootstrap] and in tests.
final envProvider = Provider<AppEnv>((ref) => throw UnimplementedError('envProvider'));
final databaseProvider = Provider<AppDatabase>((ref) => throw UnimplementedError('databaseProvider'));
final captureEngineProvider = Provider<CaptureEngine>((ref) => throw UnimplementedError('captureEngineProvider'));

/// Every time-dependent rule reads the clock from here, so tests can fix it (spec §5.2).
final clockProvider = Provider<Clock>((ref) => const Clock());
final logProvider = Provider<Log>((ref) => Log());

final flagsProvider = Provider<Flags>((ref) => Flags(ref.watch(databaseProvider), ref.watch(envProvider).flavor));
final flagValuesProvider = StreamProvider<Map<String, String>>((ref) => ref.watch(flagsProvider).watchAll());

final captureStateProvider = StreamProvider<CaptureState>((ref) async* {
  final engine = ref.watch(captureEngineProvider);
  yield engine.state;
  await for (final e in engine.events) {
    if (e is CaptureStateEvent) yield e.state;
  }
});

final todayProvider = StreamProvider<TodaySummary>(
  (ref) => TodayQuery(ref.watch(databaseProvider), ref.watch(clockProvider)).watch(),
);

/// Ticks once a second while something on screen shows elapsed time.
final tickerProvider = StreamProvider<DateTime>((ref) {
  final clock = ref.watch(clockProvider);
  return Stream.periodic(const Duration(seconds: 1), (_) => clock.now());
});
