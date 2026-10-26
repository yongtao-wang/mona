import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/app.dart';
import 'package:mona/bootstrap.dart';
import 'package:mona/core/flavor.dart';
import 'package:mona/data/database.dart';
import 'package:mona/domain/session_recorder.dart';
import 'package:mona/engines/capture_engine.dart';
import 'package:mona/engines/fake_capture_engine.dart';
import 'package:mona/providers.dart';

import '../helpers.dart';

const tap = UserIntent.fromUserAction(StartTrigger.inApp);
final now = DateTime(2026, 10, 27, 21, 30);

class Harness {
  Harness(this.db, this.engine, this.recorder);
  final AppDatabase db;
  final FakeCaptureEngine engine;
  final SessionRecorder recorder;

  /// Lets the recorder commit, then settles the UI.
  Future<void> settle(WidgetTester tester) async {
    await tester.pumpAndSettle();
    await recorder.idle;
    await tester.pumpAndSettle();
  }
}

Future<Harness> pumpApp(
  WidgetTester tester,
  List<Harness> harness, {
  Locale locale = const Locale('en'),
  bool sampleDay = true,
  bool liveActivities = true,
  double textScale = 1,
}) async {
  tester.view.physicalSize = const Size(390, 844) * 3;
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  final db = openTestDb();
  final engine = FakeCaptureEngine(clock: Clock.fixed(now), liveActivitiesEnabled: () => liveActivities);
  final app = await bootstrap(
    env: const AppEnv(flavor: Flavor.dev),
    database: db,
    engine: engine,
    clock: Clock.fixed(now),
    sampleDay: sampleDay,
    language: locale.languageCode,
  );
  await tester.pumpWidget(
    ProviderScope(
      overrides: [...app.overrides, tickerProvider.overrideWith((ref) => Stream.value(now))],
      child: MediaQuery(
        data: MediaQueryData(size: const Size(390, 844), textScaler: TextScaler.linear(textScale)),
        child: MonaApp(locale: locale),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return Harness(db, engine, app.recorder)..let(harness.add);
}

/// A widget test whose app is torn down inside the test body, so drift's stream timers
/// have fired before the binding checks for pending timers.
void appTest(String description, Future<void> Function(WidgetTester tester, List<Harness> harness) body) {
  testWidgets(description, (tester) async {
    final harness = <Harness>[];
    await body(tester, harness);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 1));
    for (final h in harness) {
      await h.recorder.dispose();
      await h.engine.dispose();
      await h.db.close();
    }
    await tester.pump(const Duration(seconds: 1));
  });
}

void main() {
  appTest('Today shows the sample day: stats, tiles and the idle pill', (tester, harness) async {
    await pumpApp(tester, harness);
    expect(find.text('moments'), findsOneWidget);
    expect(find.text('8'), findsOneWidget); // moments
    expect(find.text('3'), findsOneWidget); // promises
    expect(find.text('API stays on v2 for now'), findsOneWidget);
    expect(find.text('Commute · not analyzed'), findsNWidgets(2));
    expect(find.text('Not recording'), findsOneWidget);
    expect(find.text('Tue 10/27'), findsOneWidget);
    expect(find.text('1 item'), findsNWidgets(2));
    expect(find.text('3 items'), findsOneWidget);
    expect(find.bySemanticsLabel('10:00 API stays on v2 for now'), findsOneWidget);
  });

  appTest('a Traditional Chinese device gets the Chinese UI and sample day', (tester, harness) async {
    await pumpApp(tester, harness, locale: const Locale('zh'));
    expect(find.text('段時刻'), findsOneWidget);
    expect(find.text('API 先照 v2 走'), findsOneWidget);
    expect(find.text('10/27 週二'), findsOneWidget);
    expect(find.text('未錄音'), findsOneWidget);
  });

  appTest('the record button starts and stops a Day session; the pill says so', (tester, harness) async {
    final h = await pumpApp(tester, harness, sampleDay: false);
    expect(find.text('Nothing recorded today. Tap the record button to start.'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Start recording'));
    await tester.pumpAndSettle();
    expect(find.text('Recording 0:00'), findsOneWidget);
    expect(h.engine.state, isA<CaptureRecording>());

    await tester.tap(find.bySemanticsLabel('Stop recording'));
    await h.settle(tester);
    expect(find.text('Not recording'), findsOneWidget);
    final session = await h.db.select(h.db.session).getSingle();
    expect((session.scene, session.status), ('day', 'closed'));
  });

  appTest('every capture state has its own label, not just a color', (tester, harness) async {
    final h = await pumpApp(tester, harness, sampleDay: false);
    await h.engine.start(Scene.day, tap);
    await tester.pumpAndSettle();
    expect(find.text('Recording 0:00'), findsOneWidget);

    await h.engine.goPrivate(const Duration(minutes: 30));
    await tester.pumpAndSettle();
    expect(find.text('Private until 22:00'), findsOneWidget);

    await h.engine.pause(PauseReason.zone);
    await tester.pumpAndSettle();
    expect(find.text('Paused · home'), findsOneWidget);

    await h.engine.stop();
    await tester.pumpAndSettle();
  });

  appTest('pause, private and resume are reachable from the pill', (tester, harness) async {
    final h = await pumpApp(tester, harness, sampleDay: false);
    await h.engine.start(Scene.day, tap);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Recording 0:00'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pause'));
    await tester.pumpAndSettle();
    expect(find.text('Paused · by you'), findsOneWidget);
    await tester.tap(find.text('Paused · by you'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Resume'));
    await tester.pumpAndSettle();
    expect(h.engine.state, isA<CaptureRecording>());
    await h.engine.stop();
    await tester.pumpAndSettle();
  });

  appTest('with Live Activities off, Today says why and capture does not start', (tester, harness) async {
    final h = await pumpApp(tester, harness, sampleDay: false, liveActivities: false);
    expect(find.textContaining('Live Activities are off'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Start recording'));
    await tester.pumpAndSettle();
    expect(h.engine.state, isA<CaptureIdle>());
  });

  appTest('the privacy center is two taps from Today, with the pill still visible', (tester, harness) async {
    final h = await pumpApp(tester, harness);
    await h.engine.start(Scene.day, tap);
    await tester.pumpAndSettle();
    await tester.tap(find.bySemanticsLabel('Me'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Privacy center'));
    await h.settle(tester);
    expect(find.text('Stored on this phone'), findsOneWidget);
    expect(find.text('Recording 0:00'), findsOneWidget); // I2
    expect(find.text('8'), findsOneWidget); // moments stored
    await h.engine.stop();
    await tester.pumpAndSettle();
  });

  appTest('Today lays out at the largest accessibility text size', (tester, harness) async {
    await pumpApp(tester, harness, textScale: 2);
    expect(tester.takeException(), isNull);
  });
}

extension<T> on T {
  T let(void Function(T) f) {
    f(this);
    return this;
  }
}
