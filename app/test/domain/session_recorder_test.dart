import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/domain/session_recorder.dart';
import 'package:mona/engines/capture_engine.dart';
import 'package:mona/engines/fake_capture_engine.dart';

import '../helpers.dart';

const tap = UserIntent.fromUserAction(StartTrigger.inApp);

void main() {
  test('engine events become session and capture_gap rows, then get acked', () async {
    var now = DateTime(2026, 10, 27, 10);
    final clock = Clock(() => now);
    final db = openTestDb();
    final engine = FakeCaptureEngine(clock: clock);
    final recorder = SessionRecorder(db, engine)..start();
    addTearDown(() async {
      await recorder.dispose();
      await engine.dispose();
      await db.close();
    });

    await engine.start(Scene.day, tap);
    now = now.add(const Duration(minutes: 10));
    await engine.pause(PauseReason.zone);
    await recorder.idle;
    var session = await db.select(db.session).getSingle();
    expect(session.status, 'paused');
    expect(session.startTrigger, 'in_app');

    now = now.add(const Duration(minutes: 5));
    await engine.resume(tap);
    now = now.add(const Duration(minutes: 1));
    await engine.stop();
    await recorder.idle;

    session = await db.select(db.session).getSingle();
    expect(session.status, 'closed');
    expect(session.endReason, 'user');
    expect(session.endedAt, DateTime(2026, 10, 27, 10, 16).millisecondsSinceEpoch);

    final gap = await db.select(db.captureGap).getSingle();
    expect((gap.reason, gap.startMs, gap.endMs), ('zone', 10 * 60000, 15 * 60000));
    expect(engine.replay(0), isEmpty);
  });

  test('unacknowledged events from before a restart are replayed once', () async {
    final db = openTestDb();
    final engine = FakeCaptureEngine(clock: Clock.fixed(DateTime(2026, 10, 27)));
    addTearDown(() async {
      await engine.dispose();
      await db.close();
    });
    await engine.start(Scene.day, tap); // no recorder yet: events wait in the journal
    final recorder = SessionRecorder(db, engine)..start();
    await recorder.idle;
    expect(await db.select(db.session).get(), hasLength(1));
    await recorder.dispose();
  });
}
