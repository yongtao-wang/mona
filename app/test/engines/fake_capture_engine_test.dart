import 'package:clock/clock.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/engines/capture_engine.dart';
import 'package:mona/engines/fake_capture_engine.dart';

const tap = UserIntent.fromUserAction(StartTrigger.inApp);

void main() {
  test('start, private, pause, resume, stop follow the §6.2 state machine', () async {
    final engine = FakeCaptureEngine();
    final started = await engine.start(Scene.day, tap);
    expect(started, isA<Started>());
    expect(engine.state, isA<CaptureRecording>());

    await engine.goPrivate(const Duration(minutes: 30));
    expect(engine.state, isA<CapturePrivate>());

    await engine.pause(PauseReason.zone);
    expect((engine.state as CapturePaused).reason, PauseReason.zone);

    await engine.resume(tap);
    expect(engine.state, isA<CaptureRecording>());

    await engine.stop();
    expect(engine.state, isA<CaptureIdle>());
    await engine.dispose();
  });

  test('a second start while running is refused', () async {
    final engine = FakeCaptureEngine();
    await engine.start(Scene.day, tap);
    expect(await engine.start(Scene.day, tap), isA<Refused>());
    await engine.dispose();
  });

  test('I2: capture cannot start with Live Activities off', () async {
    final engine = FakeCaptureEngine(liveActivitiesEnabled: () => false);
    final result = await engine.start(Scene.day, tap);
    expect((result as Refused).reason, StartRefusal.liveActivitiesOff);
    expect(engine.state, isA<CaptureIdle>());
    await engine.dispose();
  });

  test('private resumes by itself when its time ends', () {
    fakeAsync((async) {
      final engine = FakeCaptureEngine(clock: async.getClock(DateTime(2026, 10, 27, 14)));
      engine.start(Scene.day, tap);
      engine.goPrivate(const Duration(minutes: 30));
      async.flushMicrotasks();
      expect((engine.state as CapturePrivate).until, DateTime(2026, 10, 27, 14, 30));
      async.elapse(const Duration(minutes: 30));
      expect(engine.state, isA<CaptureRecording>());
      engine.dispose();
    });
  });

  test('a paused session never resumes by itself (I1, D13)', () {
    fakeAsync((async) {
      final engine = FakeCaptureEngine(clock: async.getClock(DateTime(2026, 10, 27)));
      engine
        ..start(Scene.day, tap)
        ..pause(PauseReason.zone);
      async.elapse(const Duration(hours: 5));
      expect(engine.state, isA<CapturePaused>());
      engine.dispose();
    });
  });

  test('events keep increasing seq numbers and replay returns only unacked ones', () async {
    final engine = FakeCaptureEngine(clock: Clock.fixed(DateTime(2026, 10, 27)));
    await engine.start(Scene.day, tap);
    await engine.stop();
    final all = engine.replay(0);
    expect(all.map((e) => e.seq), [1, 2, 3]);
    engine.ack(2);
    expect(engine.replay(0).map((e) => e.seq), [3]);
    await engine.dispose();
  });
}
