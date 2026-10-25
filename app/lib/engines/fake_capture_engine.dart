import 'dart:async';

import 'package:clock/clock.dart';

import '../core/ids.dart';
import 'capture_engine.dart';

/// In-memory capture engine with the §6.2 state machine and no audio. Used for the
/// web preview and tests until the Swift engine exists.
class FakeCaptureEngine implements CaptureEngine {
  FakeCaptureEngine({Clock? clock, this.tz = 'Asia/Taipei', bool Function()? liveActivitiesEnabled})
    : _clock = clock ?? const Clock(),
      _liveActivities = liveActivitiesEnabled ?? (() => true);

  final Clock _clock;
  final String tz;
  final bool Function() _liveActivities;
  final _controller = StreamController<EngineEvent>.broadcast();
  final _unacked = <EngineEvent>[];
  CaptureState _state = const CaptureIdle();
  int _seq = 0;
  Timer? _privateTimer;

  @override
  Stream<EngineEvent> get events => _controller.stream;

  @override
  CaptureState get state => _state;

  @override
  bool get liveActivitiesEnabled => _liveActivities();

  @override
  Future<StartResult> start(Scene scene, UserIntent intent) async {
    if (_state is! CaptureIdle) return const Refused(StartRefusal.alreadyRunning);
    if (!liveActivitiesEnabled) return const Refused(StartRefusal.liveActivitiesOff);
    final now = _clock.now();
    final sessionId = newId();
    _emit(
      SessionStartedEvent(
        ++_seq,
        now,
        sessionId: sessionId,
        runId: newId(),
        scene: scene,
        trigger: intent.trigger,
        tz: tz,
      ),
    );
    _setState(CaptureRecording(sessionId: sessionId, since: now));
    return Started(sessionId);
  }

  @override
  Future<void> pause(PauseReason reason) async {
    final id = _sessionId;
    if (id == null || _state is CapturePaused) return;
    _privateTimer?.cancel();
    _setState(CapturePaused(sessionId: id, since: _clock.now(), reason: reason));
  }

  @override
  Future<void> goPrivate(Duration duration) async {
    final s = _state;
    if (s is! CaptureRecording) return;
    final now = _clock.now();
    _setState(CapturePrivate(sessionId: s.sessionId, since: now, until: now.add(duration)));
    // Private keeps the engine running, so it may resume by itself (§6.2, D16).
    _privateTimer = Timer(duration, () {
      if (_state is CapturePrivate) _setState(CaptureRecording(sessionId: s.sessionId, since: _clock.now()));
    });
  }

  @override
  Future<StartResult> resume(UserIntent intent) async {
    final id = _sessionId;
    if (id == null) return const Refused(StartRefusal.notUserInitiated);
    if (_state is CaptureRecording) return Started(id);
    _privateTimer?.cancel();
    _setState(CaptureRecording(sessionId: id, since: _clock.now()));
    return Started(id);
  }

  @override
  Future<void> stop() async {
    if (_state is CaptureIdle) return;
    _privateTimer?.cancel();
    _setState(const CaptureIdle());
  }

  @override
  void ack(int upToSeq) => _unacked.removeWhere((e) => e.seq <= upToSeq);

  @override
  List<EngineEvent> replay(int fromSeq) => _unacked.where((e) => e.seq >= fromSeq).toList();

  String? get _sessionId => switch (_state) {
    CaptureIdle() => null,
    CaptureRecording(:final sessionId) ||
    CapturePrivate(:final sessionId) ||
    CapturePaused(:final sessionId) => sessionId,
  };

  void _setState(CaptureState s) {
    _state = s;
    _emit(CaptureStateEvent(++_seq, _clock.now(), s));
  }

  void _emit(EngineEvent e) {
    _unacked.add(e);
    _controller.add(e);
  }

  Future<void> dispose() async {
    _privateTimer?.cancel();
    await _controller.close();
  }
}
