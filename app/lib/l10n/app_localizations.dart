import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW', scriptCode: 'Hant'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'mona'**
  String get appTitle;

  /// No description provided for @tabToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get tabToday;

  /// No description provided for @tabCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get tabCalendar;

  /// No description provided for @tabRecap.
  ///
  /// In en, this message translates to:
  /// **'Recap'**
  String get tabRecap;

  /// No description provided for @tabMe.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get tabMe;

  /// No description provided for @startRecording.
  ///
  /// In en, this message translates to:
  /// **'Start recording'**
  String get startRecording;

  /// No description provided for @stopRecording.
  ///
  /// In en, this message translates to:
  /// **'Stop recording'**
  String get stopRecording;

  /// No description provided for @stateRecording.
  ///
  /// In en, this message translates to:
  /// **'Recording {elapsed}'**
  String stateRecording(String elapsed);

  /// No description provided for @statePaused.
  ///
  /// In en, this message translates to:
  /// **'Paused · {reason}'**
  String statePaused(String reason);

  /// No description provided for @statePrivate.
  ///
  /// In en, this message translates to:
  /// **'Private until {time}'**
  String statePrivate(String time);

  /// No description provided for @stateIdle.
  ///
  /// In en, this message translates to:
  /// **'Not recording'**
  String get stateIdle;

  /// No description provided for @pauseReasonZone.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get pauseReasonZone;

  /// No description provided for @pauseReasonBattery.
  ///
  /// In en, this message translates to:
  /// **'battery'**
  String get pauseReasonBattery;

  /// No description provided for @pauseReasonStorage.
  ///
  /// In en, this message translates to:
  /// **'storage'**
  String get pauseReasonStorage;

  /// No description provided for @pauseReasonThermal.
  ///
  /// In en, this message translates to:
  /// **'too hot'**
  String get pauseReasonThermal;

  /// No description provided for @pauseReasonInterruption.
  ///
  /// In en, this message translates to:
  /// **'call'**
  String get pauseReasonInterruption;

  /// No description provided for @pauseReasonIndicator.
  ///
  /// In en, this message translates to:
  /// **'indicator lost'**
  String get pauseReasonIndicator;

  /// No description provided for @pauseReasonUser.
  ///
  /// In en, this message translates to:
  /// **'by you'**
  String get pauseReasonUser;

  /// No description provided for @statMoments.
  ///
  /// In en, this message translates to:
  /// **'moments'**
  String get statMoments;

  /// No description provided for @statPromises.
  ///
  /// In en, this message translates to:
  /// **'promises'**
  String get statPromises;

  /// No description provided for @statTalk.
  ///
  /// In en, this message translates to:
  /// **'talk'**
  String get statTalk;

  /// No description provided for @talkHours.
  ///
  /// In en, this message translates to:
  /// **'{hours} h'**
  String talkHours(String hours);

  /// No description provided for @viewGrid.
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get viewGrid;

  /// No description provided for @viewItems.
  ///
  /// In en, this message translates to:
  /// **'Promises and items'**
  String get viewItems;

  /// No description provided for @viewMarked.
  ///
  /// In en, this message translates to:
  /// **'Marked moments'**
  String get viewMarked;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String itemCount(int count);

  /// No description provided for @notAnalyzed.
  ///
  /// In en, this message translates to:
  /// **'{scene} · not analyzed'**
  String notAnalyzed(String scene);

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String durationMinutes(int minutes);

  /// No description provided for @sceneMeeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get sceneMeeting;

  /// No description provided for @sceneCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get sceneCall;

  /// No description provided for @sceneSocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get sceneSocial;

  /// No description provided for @sceneShow.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get sceneShow;

  /// No description provided for @sceneCommute.
  ///
  /// In en, this message translates to:
  /// **'Commute'**
  String get sceneCommute;

  /// No description provided for @sceneSolo.
  ///
  /// In en, this message translates to:
  /// **'Solo note'**
  String get sceneSolo;

  /// No description provided for @sceneUnknown.
  ///
  /// In en, this message translates to:
  /// **'Moment'**
  String get sceneUnknown;

  /// No description provided for @emptyToday.
  ///
  /// In en, this message translates to:
  /// **'Nothing recorded today. Tap the record button to start.'**
  String get emptyToday;

  /// No description provided for @liveActivitiesOff.
  ///
  /// In en, this message translates to:
  /// **'Live Activities are off, so recording can\'t start. Turn them on in Settings.'**
  String get liveActivitiesOff;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming in a later build.'**
  String get comingSoon;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @goPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private 30 min'**
  String get goPrivate;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @privacyCenter.
  ///
  /// In en, this message translates to:
  /// **'Privacy center'**
  String get privacyCenter;

  /// No description provided for @privacyStaysOnPhone.
  ///
  /// In en, this message translates to:
  /// **'Your recordings and voice stay on this phone. Only pseudonymized text from flagged moments is sent for analysis.'**
  String get privacyStaysOnPhone;

  /// No description provided for @privacyNoMove.
  ///
  /// In en, this message translates to:
  /// **'Data does not move to a new phone. Use Export everything to keep a copy.'**
  String get privacyNoMove;

  /// No description provided for @privacyStorage.
  ///
  /// In en, this message translates to:
  /// **'Stored on this phone'**
  String get privacyStorage;

  /// No description provided for @privacySessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get privacySessions;

  /// No description provided for @privacyMoments.
  ///
  /// In en, this message translates to:
  /// **'Moments'**
  String get privacyMoments;

  /// No description provided for @privacyAudioFiles.
  ///
  /// In en, this message translates to:
  /// **'Audio files'**
  String get privacyAudioFiles;

  /// No description provided for @debugFlags.
  ///
  /// In en, this message translates to:
  /// **'Debug flags'**
  String get debugFlags;

  /// No description provided for @flavorLabel.
  ///
  /// In en, this message translates to:
  /// **'Build: {flavor}'**
  String flavorLabel(String flavor);

  /// No description provided for @debugAnalyzeSample.
  ///
  /// In en, this message translates to:
  /// **'Analyze a sample meeting'**
  String get debugAnalyzeSample;

  /// No description provided for @debugNoGateway.
  ///
  /// In en, this message translates to:
  /// **'No gateway in this build. Run with --dart-define=GATEWAY_URL=... and DEV_TOKEN=dev.'**
  String get debugNoGateway;

  /// No description provided for @debugAnalysisResult.
  ///
  /// In en, this message translates to:
  /// **'Analysis: {status}'**
  String debugAnalysisResult(String status);

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @speakerLabel.
  ///
  /// In en, this message translates to:
  /// **'Speaker {label}'**
  String speakerLabel(String label);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script+country codes are specified.
  switch (locale.toString()) {
    case 'zh_Hant_TW':
      return AppLocalizationsZhHantTw();
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
