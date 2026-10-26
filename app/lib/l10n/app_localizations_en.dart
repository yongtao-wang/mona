// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'mona';

  @override
  String get tabToday => 'Today';

  @override
  String get tabCalendar => 'Calendar';

  @override
  String get tabRecap => 'Recap';

  @override
  String get tabMe => 'Me';

  @override
  String get startRecording => 'Start recording';

  @override
  String get stopRecording => 'Stop recording';

  @override
  String stateRecording(String elapsed) {
    return 'Recording $elapsed';
  }

  @override
  String statePaused(String reason) {
    return 'Paused · $reason';
  }

  @override
  String statePrivate(String time) {
    return 'Private until $time';
  }

  @override
  String get stateIdle => 'Not recording';

  @override
  String get pauseReasonZone => 'home';

  @override
  String get pauseReasonBattery => 'battery';

  @override
  String get pauseReasonStorage => 'storage';

  @override
  String get pauseReasonThermal => 'too hot';

  @override
  String get pauseReasonInterruption => 'call';

  @override
  String get pauseReasonIndicator => 'indicator lost';

  @override
  String get pauseReasonUser => 'by you';

  @override
  String get statMoments => 'moments';

  @override
  String get statPromises => 'promises';

  @override
  String get statTalk => 'talk';

  @override
  String talkHours(String hours) {
    return '$hours h';
  }

  @override
  String get viewGrid => 'Grid';

  @override
  String get viewItems => 'Promises and items';

  @override
  String get viewMarked => 'Marked moments';

  @override
  String get search => 'Search';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count items', one: '1 item');
    return '$_temp0';
  }

  @override
  String notAnalyzed(String scene) {
    return '$scene · not analyzed';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get sceneMeeting => 'Meeting';

  @override
  String get sceneCall => 'Call';

  @override
  String get sceneSocial => 'Social';

  @override
  String get sceneShow => 'Show';

  @override
  String get sceneCommute => 'Commute';

  @override
  String get sceneSolo => 'Solo note';

  @override
  String get sceneUnknown => 'Moment';

  @override
  String get emptyToday => 'Nothing recorded today. Tap the record button to start.';

  @override
  String get liveActivitiesOff => 'Live Activities are off, so recording can\'t start. Turn them on in Settings.';

  @override
  String get comingSoon => 'Coming in a later build.';

  @override
  String get pause => 'Pause';

  @override
  String get goPrivate => 'Private 30 min';

  @override
  String get resume => 'Resume';

  @override
  String get privacyCenter => 'Privacy center';

  @override
  String get privacyStaysOnPhone =>
      'Your recordings and voice stay on this phone. Only pseudonymized text from flagged moments is sent for analysis.';

  @override
  String get privacyNoMove => 'Data does not move to a new phone. Use Export everything to keep a copy.';

  @override
  String get privacyStorage => 'Stored on this phone';

  @override
  String get privacySessions => 'Sessions';

  @override
  String get privacyMoments => 'Moments';

  @override
  String get privacyAudioFiles => 'Audio files';

  @override
  String get debugFlags => 'Debug flags';

  @override
  String flavorLabel(String flavor) {
    return 'Build: $flavor';
  }

  @override
  String get debugAnalyzeSample => 'Analyze a sample meeting';

  @override
  String get debugNoGateway => 'No gateway in this build. Run with --dart-define=GATEWAY_URL=... and DEV_TOKEN=dev.';

  @override
  String debugAnalysisResult(String status) {
    return 'Analysis: $status';
  }

  @override
  String get you => 'You';

  @override
  String speakerLabel(String label) {
    return 'Speaker $label';
  }
}
