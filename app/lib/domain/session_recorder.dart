import 'dart:async';

import 'package:drift/drift.dart';

import '../core/ids.dart';
import '../data/database.dart';
import '../engines/capture_engine.dart';

/// Turns capture engine events into `session` and `capture_gap` rows, then acks them
/// so the engine's journal can drop them (spec §5.3, §6.2: every transition writes a gap).
class SessionRecorder {
  SessionRecorder(this._db, this._engine);

  final AppDatabase _db;
  final CaptureEngine _engine;
  StreamSubscription<EngineEvent>? _sub;
  Future<void> _tail = Future.value();

  /// Replays anything unacknowledged, then follows new events in order.
  void start() {
    for (final e in _engine.replay(0)) {
      _enqueue(e);
    }
    _sub = _engine.events.listen(_enqueue);
  }

  /// Completes when every event emitted so far has been received and committed.
  Future<void> get idle async {
    Future<void> seen;
    do {
      seen = _tail;
      await seen;
      // Stream events arrive in a later microtask; let them land before checking again.
      await Future<void>.microtask(() {});
    } while (!identical(seen, _tail));
  }

  Future<void> dispose() async {
    // Not awaited: a broadcast subscription's cancel future belongs to the root zone.
    unawaited(_sub?.cancel());
    await _tail;
  }

  void _enqueue(EngineEvent e) {
    _tail = _tail.then((_) => _commit(e)).then((_) => _engine.ack(e.seq));
  }

  Future<void> _commit(EngineEvent e) => _db.transaction(() async {
    switch (e) {
      case SessionStartedEvent():
        await _db
            .into(_db.session)
            .insert(
              SessionCompanion.insert(
                id: e.sessionId,
                runId: e.runId,
                scene: e.scene.name,
                startTrigger: _trigger(e.trigger),
                startedAt: e.at.millisecondsSinceEpoch,
                tz: e.tz,
                status: 'recording',
                // I10 is enforced by the schema; the consent card flow sets this (§13.1).
                consentShownAt: Value(e.scene == Scene.meeting ? e.at.millisecondsSinceEpoch : null),
              ),
              mode: InsertMode.insertOrIgnore,
            );
      case CaptureStateEvent(:final state):
        await _onState(state, e.at);
    }
  });

  Future<void> _onState(CaptureState state, DateTime at) async {
    final open = await (_db.select(_db.session)..where((s) => s.endedAt.isNull())).get();
    for (final s in open) {
      final ms = at.millisecondsSinceEpoch - s.startedAt;
      await (_db.update(
        _db.captureGap,
      )..where((g) => g.sessionId.equals(s.id) & g.endMs.isNull())).write(CaptureGapCompanion(endMs: Value(ms)));
      final (status, gapReason) = switch (state) {
        CaptureRecording() => ('recording', null),
        CapturePrivate() => ('recording', 'private'),
        CapturePaused(:final reason) => ('paused', reason.name),
        CaptureIdle() => ('closed', null),
      };
      if (gapReason != null) {
        await _db
            .into(_db.captureGap)
            .insert(CaptureGapCompanion.insert(id: newId(), sessionId: s.id, startMs: ms, reason: gapReason));
      }
      await (_db.update(_db.session)..where((r) => r.id.equals(s.id))).write(
        SessionCompanion(
          status: Value(status),
          endedAt: state is CaptureIdle ? Value(at.millisecondsSinceEpoch) : const Value.absent(),
          endReason: state is CaptureIdle ? const Value('user') : const Value.absent(),
        ),
      );
    }
  }

  static String _trigger(StartTrigger t) => switch (t) {
    StartTrigger.inApp => 'in_app',
    StartTrigger.control => 'control',
    StartTrigger.actionButton => 'action_button',
    StartTrigger.liveActivity => 'live_activity',
    StartTrigger.notification => 'notification',
    StartTrigger.sceneSwitch => 'scene_switch',
  };
}
