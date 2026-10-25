/// Dart facade over the capture engine (spec §5.3, §6). The iOS engine sits behind
/// Pigeon (`packages/engine_api`); [FakeCaptureEngine] stands in on web and in tests.
library;

enum Scene { day, meeting }

enum StartTrigger { inApp, control, actionButton, liveActivity, notification, sceneSwitch }

enum PauseReason { zone, battery, storage, thermal, interruption, indicator, user }

/// Proof that a user action led to this call (I1). Only UI handlers and system-intent
/// handlers create one. This is a Dart-side discipline; the native start gate is the
/// real check (§5.3).
final class UserIntent {
  const UserIntent.fromUserAction(this.trigger);
  final StartTrigger trigger;
}

sealed class CaptureState {
  const CaptureState();
}

final class CaptureIdle extends CaptureState {
  const CaptureIdle();
}

final class CaptureRecording extends CaptureState {
  const CaptureRecording({required this.sessionId, required this.since});
  final String sessionId;
  final DateTime since;
}

final class CapturePrivate extends CaptureState {
  const CapturePrivate({required this.sessionId, required this.since, required this.until});
  final String sessionId;
  final DateTime since;
  final DateTime until;
}

final class CapturePaused extends CaptureState {
  const CapturePaused({required this.sessionId, required this.since, required this.reason});
  final String sessionId;
  final DateTime since;
  final PauseReason reason;
}

enum StartRefusal { notUserInitiated, liveActivitiesOff, micPermissionDenied, lowBattery, alreadyRunning }

sealed class StartResult {
  const StartResult();
}

final class Started extends StartResult {
  const Started(this.sessionId);
  final String sessionId;
}

final class Refused extends StartResult {
  const Refused(this.reason);
  final StartRefusal reason;
}

/// Events carry a monotonically increasing [seq]; Dart acks after committing (§5.3).
sealed class EngineEvent {
  const EngineEvent(this.seq, this.at);
  final int seq;
  final DateTime at;
}

final class SessionStartedEvent extends EngineEvent {
  const SessionStartedEvent(
    super.seq,
    super.at, {
    required this.sessionId,
    required this.runId,
    required this.scene,
    required this.trigger,
    required this.tz,
  });
  final String sessionId;
  final String runId;
  final Scene scene;
  final StartTrigger trigger;
  final String tz;
}

final class CaptureStateEvent extends EngineEvent {
  const CaptureStateEvent(super.seq, super.at, this.state);
  final CaptureState state;
}

abstract interface class CaptureEngine {
  Stream<EngineEvent> get events;
  CaptureState get state;

  /// Live Activities off means capture cannot start (I2, §6.6).
  bool get liveActivitiesEnabled;

  Future<StartResult> start(Scene scene, UserIntent intent);
  Future<void> pause(PauseReason reason);
  Future<void> goPrivate(Duration duration);
  Future<StartResult> resume(UserIntent intent);
  Future<void> stop();
  void ack(int upToSeq);
  List<EngineEvent> replay(int fromSeq);
}
