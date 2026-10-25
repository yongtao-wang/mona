// The single source of the native channel contract (spec §5.3, D3). Generate with
// `dart run pigeon --input pigeons/engine.dart` from packages/engine_api.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/engine_api.g.dart',
    swiftOut: 'ios/Sources/EngineApi/EngineApi.g.swift',
    dartPackageName: 'engine_api',
  ),
)
enum SceneKind { day, meeting }

enum StartTriggerKind { inApp, control, actionButton, liveActivity, notification, sceneSwitch }

enum PauseReasonKind { zone, battery, storage, thermal, interruption, indicator, user }

enum CaptureStateKind { recording, paused, private, stopped }

enum StartRefusalKind { notUserInitiated, liveActivitiesOff, micPermissionDenied, lowBattery, alreadyRunning }

enum MarkSourceKind { button, liveActivity, voice, watch }

enum GapReasonKind { zone, private, battery, storage, thermal, interruption, indicator, playback, crash, user }

/// Proves a user action (I1). Dart-side discipline; native also gates on app state.
class UserIntentToken {
  UserIntentToken({required this.trigger, required this.issuedAtMs});
  StartTriggerKind trigger;
  int issuedAtMs;
}

class StartRequest {
  StartRequest({required this.scene, required this.intent, required this.consentShownAtMs});
  SceneKind scene;
  UserIntentToken intent;

  /// Required for Meeting (I10); null for Day.
  int? consentShownAtMs;
}

class StartResult {
  StartResult({this.sessionId, this.refusal});
  String? sessionId;
  StartRefusalKind? refusal;
}

class SceneSwitchRequest {
  SceneSwitchRequest({required this.scene, this.consentShownAtMs});
  SceneKind scene;
  int? consentShownAtMs;
}

class CloseResult {
  CloseResult({required this.sessionId, required this.endedAtMs});
  String sessionId;
  int endedAtMs;
}

class CaptureStatus {
  CaptureStatus({required this.state, this.sessionId, this.pauseReason, this.privateUntilMs, required this.lastSeq});
  CaptureStateKind state;
  String? sessionId;
  PauseReasonKind? pauseReason;
  int? privateUntilMs;
  int lastSeq;
}

class EvalRequest {
  EvalRequest({required this.audioPath, required this.scene});
  String audioPath;
  SceneKind scene;
}

class SessionStartedEvent {
  SessionStartedEvent({
    required this.seq,
    required this.sessionId,
    required this.runId,
    required this.scene,
    required this.trigger,
    required this.tz,
    required this.startedAtMs,
  });
  int seq;
  String sessionId;
  String runId;
  SceneKind scene;
  StartTriggerKind trigger;
  String tz;
  int startedAtMs;
}

class CaptureStateEvent {
  CaptureStateEvent({required this.seq, required this.status, required this.atMs});
  int seq;
  CaptureStatus status;
  int atMs;
}

class UtteranceEvent {
  UtteranceEvent({
    required this.seq,
    required this.isFinal,
    required this.utteranceId,
    required this.sessionId,
    required this.startMs,
    required this.endMs,
    required this.text,
    this.lang,
    this.speakerId,
    this.speakerConfidence,
    this.asrConfidence,
  });

  /// 0 for volatile results, which skip the journal and may be lost (§5.3).
  int seq;
  bool isFinal;
  String utteranceId;
  String sessionId;
  int startMs;
  int endMs;
  String text;
  String? lang;
  String? speakerId;
  double? speakerConfidence;
  double? asrConfidence;
}

class SpeakerLaneEvent {
  SpeakerLaneEvent({
    required this.seq,
    required this.sessionId,
    required this.speakerId,
    required this.label,
    required this.isSelf,
    required this.retired,
  });
  int seq;
  String sessionId;
  String speakerId;
  String label;
  bool isSelf;
  bool retired;
}

class MarkEvent {
  MarkEvent({required this.seq, required this.sessionId, required this.atMs, required this.source});
  int seq;
  String sessionId;
  int atMs;
  MarkSourceKind source;
}

class GapEvent {
  GapEvent({required this.seq, required this.sessionId, required this.startMs, this.endMs, required this.reason});
  int seq;
  String sessionId;
  int startMs;
  int? endMs;
  GapReasonKind reason;
}

class MediaEvent {
  MediaEvent({
    required this.seq,
    required this.sessionId,
    required this.relPath,
    required this.startMs,
    required this.endMs,
    required this.bytes,
    required this.codec,
  });
  int seq;
  String sessionId;
  String relPath;
  int startMs;
  int endMs;
  int bytes;
  String codec;
}

class HeartbeatEvent {
  HeartbeatEvent({required this.seq, required this.sessionId, required this.atMs});
  int seq;
  String sessionId;
  int atMs;
}

/// One journaled event, for replay after a restart (§6.8). Exactly one field is set.
class JournaledEvent {
  JournaledEvent({
    this.sessionStarted,
    this.captureState,
    this.utterance,
    this.speakerLane,
    this.mark,
    this.gap,
    this.media,
    this.heartbeat,
  });
  SessionStartedEvent? sessionStarted;
  CaptureStateEvent? captureState;
  UtteranceEvent? utterance;
  SpeakerLaneEvent? speakerLane;
  MarkEvent? mark;
  GapEvent? gap;
  MediaEvent? media;
  HeartbeatEvent? heartbeat;
}

class EnrollResult {
  EnrollResult({required this.ok, this.signatureId, this.error});
  bool ok;
  String? signatureId;
  String? error;
}

class ReclusterConstraints {
  ReclusterConstraints({required this.lockedUtteranceIds});

  /// Lines the user reassigned; the re-cluster keeps them (§7.4).
  List<String> lockedUtteranceIds;
}

class ReclusterResult {
  ReclusterResult({required this.speakerCount, required this.durationMs});
  int speakerCount;
  int durationMs;
}

@HostApi()
abstract class CaptureHostApi {
  StartResult start(StartRequest req);
  void switchScene(SceneSwitchRequest req);
  void pause(PauseReasonKind reason, int? minutes);
  StartResult resume(UserIntentToken token);
  void mark(MarkSourceKind source);
  CloseResult stop();
  CaptureStatus status();
  void ack(int upToSeq);
  List<JournaledEvent> replay(int fromSeq);
  void startEval(EvalRequest req);
}

@HostApi()
abstract class SpeechHostApi {
  EnrollResult enrollSelf(String consentRecordId, String audioPath);
  void setSessionHints(String sessionId, int? attendeeCount, List<String> locales, List<String> contextualNames);
  @async
  ReclusterResult recluster(String sessionId, int fromMs, int toMs, int? numSpeakers, ReclusterConstraints c);
  void closeSessionSignatures(String sessionId);
  void splitSpeaker(String sessionId, String speakerId, List<String> utteranceIds);
}

@FlutterApi()
abstract class EngineEvents {
  void onSessionStarted(SessionStartedEvent e);
  void onCaptureState(CaptureStateEvent e);
  void onUtterance(UtteranceEvent e);
  void onSpeakerLane(SpeakerLaneEvent e);
  void onMark(MarkEvent e);
  void onGap(GapEvent e);
  void onMedia(MediaEvent e);
  void onHeartbeat(HeartbeatEvent e);
}
