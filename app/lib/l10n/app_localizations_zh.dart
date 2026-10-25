// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'mona';

  @override
  String get tabToday => '今天';

  @override
  String get tabCalendar => '日曆';

  @override
  String get tabRecap => '回顧';

  @override
  String get tabMe => '我';

  @override
  String get startRecording => '開始錄音';

  @override
  String get stopRecording => '停止錄音';

  @override
  String stateRecording(String elapsed) {
    return '錄音中 $elapsed';
  }

  @override
  String statePaused(String reason) {
    return '已暫停 · $reason';
  }

  @override
  String statePrivate(String time) {
    return '私密至 $time';
  }

  @override
  String get stateIdle => '未錄音';

  @override
  String get pauseReasonZone => '家';

  @override
  String get pauseReasonBattery => '電量';

  @override
  String get pauseReasonStorage => '空間';

  @override
  String get pauseReasonThermal => '過熱';

  @override
  String get pauseReasonInterruption => '通話';

  @override
  String get pauseReasonIndicator => '指示消失';

  @override
  String get pauseReasonUser => '手動';

  @override
  String get statMoments => '段時刻';

  @override
  String get statPromises => '個承諾';

  @override
  String get statTalk => '對話';

  @override
  String talkHours(String hours) {
    return '$hours h';
  }

  @override
  String get viewGrid => '格狀';

  @override
  String get viewItems => '承諾與事項';

  @override
  String get viewMarked => '標記的時刻';

  @override
  String get search => '搜尋';

  @override
  String itemCount(int count) {
    return '$count 項';
  }

  @override
  String notAnalyzed(String scene) {
    return '$scene · 未分析';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes 分';
  }

  @override
  String get sceneMeeting => '會議';

  @override
  String get sceneCall => '通話';

  @override
  String get sceneSocial => '聊天';

  @override
  String get sceneShow => '演出';

  @override
  String get sceneCommute => '通勤';

  @override
  String get sceneSolo => '自言自語';

  @override
  String get sceneUnknown => '時刻';

  @override
  String get emptyToday => '今天還沒有錄音。點錄音鍵開始。';

  @override
  String get liveActivitiesOff => '即時動態已關閉，無法開始錄音。請到設定開啟。';

  @override
  String get comingSoon => '之後的版本會有。';

  @override
  String get pause => '暫停';

  @override
  String get goPrivate => '私密 30 分';

  @override
  String get resume => '繼續';

  @override
  String get privacyCenter => '隱私中心';

  @override
  String get privacyStaysOnPhone => '錄音和聲紋只存在這支手機。只有標記時刻的去識別化文字會送去分析。';

  @override
  String get privacyNoMove => '資料不會搬到新手機。要留一份，請用「匯出全部」。';

  @override
  String get privacyStorage => '存在這支手機';

  @override
  String get privacySessions => '錄音段';

  @override
  String get privacyMoments => '時刻';

  @override
  String get privacyAudioFiles => '音檔';

  @override
  String get debugFlags => '除錯旗標';

  @override
  String flavorLabel(String flavor) {
    return '版本：$flavor';
  }
}

/// The translations for Chinese, as used in Taiwan, using the Han script (`zh_Hant_TW`).
class AppLocalizationsZhHantTw extends AppLocalizationsZh {
  AppLocalizationsZhHantTw() : super('zh_Hant_TW');
}
