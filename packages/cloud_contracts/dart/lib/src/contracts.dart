// GENERATED from packages/cloud_contracts/schemas. Do not edit.
// Run `deno task gen` in packages/cloud_contracts.

// To parse this JSON data, do
//
//     final configResponse = configResponseFromJson(jsonString);
//     final deviceRequest = deviceRequestFromJson(jsonString);
//     final deviceResponse = deviceResponseFromJson(jsonString);
//     final errorResponse = errorResponseFromJson(jsonString);
//     final momentLabelRequest = momentLabelRequestFromJson(jsonString);
//     final momentLabelResponse = momentLabelResponseFromJson(jsonString);
//     final recapRequest = recapRequestFromJson(jsonString);
//     final recapResponse = recapResponseFromJson(jsonString);
//     final telemetryRequest = telemetryRequestFromJson(jsonString);

import 'dart:convert';

ConfigResponse configResponseFromJson(String str) => ConfigResponse.fromJson(json.decode(str));

String configResponseToJson(ConfigResponse data) => json.encode(data.toJson());

DeviceRequest deviceRequestFromJson(String str) => DeviceRequest.fromJson(json.decode(str));

String deviceRequestToJson(DeviceRequest data) => json.encode(data.toJson());

DeviceResponse deviceResponseFromJson(String str) => DeviceResponse.fromJson(json.decode(str));

String deviceResponseToJson(DeviceResponse data) => json.encode(data.toJson());

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

MomentLabelRequest momentLabelRequestFromJson(String str) => MomentLabelRequest.fromJson(json.decode(str));

String momentLabelRequestToJson(MomentLabelRequest data) => json.encode(data.toJson());

MomentLabelResponse momentLabelResponseFromJson(String str) => MomentLabelResponse.fromJson(json.decode(str));

String momentLabelResponseToJson(MomentLabelResponse data) => json.encode(data.toJson());

RecapRequest recapRequestFromJson(String str) => RecapRequest.fromJson(json.decode(str));

String recapRequestToJson(RecapRequest data) => json.encode(data.toJson());

RecapResponse recapResponseFromJson(String str) => RecapResponse.fromJson(json.decode(str));

String recapResponseToJson(RecapResponse data) => json.encode(data.toJson());

TelemetryRequest telemetryRequestFromJson(String str) => TelemetryRequest.fromJson(json.decode(str));

String telemetryRequestToJson(TelemetryRequest data) => json.encode(data.toJson());


///GET /v1/config (spec §12.5). analysis_enabled is the kill switch.
class ConfigResponse {
    final bool analysisEnabled;
    final int maxBodyKb;
    final String minAppVersion;
    final PromptVersions promptVersions;
    final bool recapEnabled;

    ConfigResponse({
        required this.analysisEnabled,
        required this.maxBodyKb,
        required this.minAppVersion,
        required this.promptVersions,
        required this.recapEnabled,
    });

    factory ConfigResponse.fromJson(Map<String, dynamic> json) => ConfigResponse(
        analysisEnabled: json["analysis_enabled"],
        maxBodyKb: json["max_body_kb"],
        minAppVersion: json["min_app_version"],
        promptVersions: PromptVersions.fromJson(json["prompt_versions"]),
        recapEnabled: json["recap_enabled"],
    );

    Map<String, dynamic> toJson() => {
        "analysis_enabled": analysisEnabled,
        "max_body_kb": maxBodyKb,
        "min_app_version": minAppVersion,
        "prompt_versions": promptVersions.toJson(),
        "recap_enabled": recapEnabled,
    };
}

class PromptVersions {
    final String label;
    final String recap;

    PromptVersions({
        required this.label,
        required this.recap,
    });

    factory PromptVersions.fromJson(Map<String, dynamic> json) => PromptVersions(
        label: json["label"],
        recap: json["recap"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "recap": recap,
    };
}


///POST /v1/device (spec §12.4). Idempotent per (user, install_id).
class DeviceRequest {
    final String appVersion;
    final String installId;
    final String? model;
    final String osVersion;
    final Platform platform;
    final int schemaVersion;

    DeviceRequest({
        required this.appVersion,
        required this.installId,
        this.model,
        required this.osVersion,
        required this.platform,
        required this.schemaVersion,
    });

    factory DeviceRequest.fromJson(Map<String, dynamic> json) => DeviceRequest(
        appVersion: json["app_version"],
        installId: json["install_id"],
        model: json["model"],
        osVersion: json["os_version"],
        platform: platformValues.map[json["platform"]]!,
        schemaVersion: json["schema_version"],
    );

    Map<String, dynamic> toJson() => {
        "app_version": appVersion,
        "install_id": installId,
        "model": model,
        "os_version": osVersion,
        "platform": platformValues.reverse[platform],
        "schema_version": schemaVersion,
    };
}

enum Platform {
    ANDROID,
    IOS,
    WEB
}

final platformValues = EnumValues({
    "android": Platform.ANDROID,
    "ios": Platform.IOS,
    "web": Platform.WEB
});

class DeviceResponse {
    final String deviceId;

    DeviceResponse({
        required this.deviceId,
    });

    factory DeviceResponse.fromJson(Map<String, dynamic> json) => DeviceResponse(
        deviceId: json["device_id"],
    );

    Map<String, dynamic> toJson() => {
        "device_id": deviceId,
    };
}


///Every gateway error (spec §12.7). Never contains request content.
class ErrorResponse {
    final ErrorBody error;

    ErrorResponse({
        required this.error,
    });

    factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        error: ErrorBody.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error.toJson(),
    };
}

class ErrorBody {
    final ErrorCode code;
    final String requestId;
    final bool retryable;

    ErrorBody({
        required this.code,
        required this.requestId,
        required this.retryable,
    });

    factory ErrorBody.fromJson(Map<String, dynamic> json) => ErrorBody(
        code: errorCodeValues.map[json["code"]]!,
        requestId: json["request_id"],
        retryable: json["retryable"],
    );

    Map<String, dynamic> toJson() => {
        "code": errorCodeValues.reverse[code],
        "request_id": requestId,
        "retryable": retryable,
    };
}

enum ErrorCode {
    ANALYSIS_DISABLED,
    BODY_TOO_LARGE,
    DEVICE_UNKNOWN,
    INTERNAL,
    INVALID_REQUEST,
    METHOD_NOT_ALLOWED,
    MODEL_OUTPUT_INVALID,
    MODEL_REFUSED,
    NOT_FOUND,
    QUOTA_EXCEEDED,
    RATE_LIMITED,
    UNAUTHORIZED,
    UPGRADE_REQUIRED,
    UPSTREAM_TIMEOUT
}

final errorCodeValues = EnumValues({
    "analysis_disabled": ErrorCode.ANALYSIS_DISABLED,
    "body_too_large": ErrorCode.BODY_TOO_LARGE,
    "device_unknown": ErrorCode.DEVICE_UNKNOWN,
    "internal": ErrorCode.INTERNAL,
    "invalid_request": ErrorCode.INVALID_REQUEST,
    "method_not_allowed": ErrorCode.METHOD_NOT_ALLOWED,
    "model_output_invalid": ErrorCode.MODEL_OUTPUT_INVALID,
    "model_refused": ErrorCode.MODEL_REFUSED,
    "not_found": ErrorCode.NOT_FOUND,
    "quota_exceeded": ErrorCode.QUOTA_EXCEEDED,
    "rate_limited": ErrorCode.RATE_LIMITED,
    "unauthorized": ErrorCode.UNAUTHORIZED,
    "upgrade_required": ErrorCode.UPGRADE_REQUIRED,
    "upstream_timeout": ErrorCode.UPSTREAM_TIMEOUT
});


///POST /v1/moments/label (spec §12.1). Pseudonymized; ids are per-request aliases.
class MomentLabelRequest {
    final List<String> mentioned;
    final LabelMoment moment;
    final LabelOptions options;
    final List<String> participants;
    final int schemaVersion;
    final List<LabelUtterance> utterances;

    MomentLabelRequest({
        required this.mentioned,
        required this.moment,
        required this.options,
        required this.participants,
        required this.schemaVersion,
        required this.utterances,
    });

    factory MomentLabelRequest.fromJson(Map<String, dynamic> json) => MomentLabelRequest(
        mentioned: List<String>.from(json["mentioned"].map((x) => x)),
        moment: LabelMoment.fromJson(json["moment"]),
        options: LabelOptions.fromJson(json["options"]),
        participants: List<String>.from(json["participants"].map((x) => x)),
        schemaVersion: json["schema_version"],
        utterances: List<LabelUtterance>.from(json["utterances"].map((x) => LabelUtterance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mentioned": List<dynamic>.from(mentioned.map((x) => x)),
        "moment": moment.toJson(),
        "options": options.toJson(),
        "participants": List<dynamic>.from(participants.map((x) => x)),
        "schema_version": schemaVersion,
        "utterances": List<dynamic>.from(utterances.map((x) => x.toJson())),
    };
}

class LabelMoment {
    final int durationS;
    final List<String> languages;
    final String localDate;
    final String localStart;
    final String ref;
    final SceneHint? sceneHint;
    final String tz;

    LabelMoment({
        required this.durationS,
        required this.languages,
        required this.localDate,
        required this.localStart,
        required this.ref,
        required this.sceneHint,
        required this.tz,
    });

    factory LabelMoment.fromJson(Map<String, dynamic> json) => LabelMoment(
        durationS: json["duration_s"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        localDate: json["local_date"],
        localStart: json["local_start"],
        ref: json["ref"],
        sceneHint: sceneHintValues.map[json["scene_hint"]]!,
        tz: json["tz"],
    );

    Map<String, dynamic> toJson() => {
        "duration_s": durationS,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "local_date": localDate,
        "local_start": localStart,
        "ref": ref,
        "scene_hint": sceneHintValues.reverse[sceneHint],
        "tz": tz,
    };
}

enum SceneHint {
    COMMUTE,
    MEETING,
    SOLO
}

final sceneHintValues = EnumValues({
    "commute": SceneHint.COMMUTE,
    "meeting": SceneHint.MEETING,
    "solo": SceneHint.SOLO
});

class LabelOptions {
    final LabelPurpose purpose;
    final bool wantTitle;

    LabelOptions({
        required this.purpose,
        required this.wantTitle,
    });

    factory LabelOptions.fromJson(Map<String, dynamic> json) => LabelOptions(
        purpose: labelPurposeValues.map[json["purpose"]]!,
        wantTitle: json["want_title"],
    );

    Map<String, dynamic> toJson() => {
        "purpose": labelPurposeValues.reverse[purpose],
        "want_title": wantTitle,
    };
}

enum LabelPurpose {
    LABEL,
    MINUTES
}

final labelPurposeValues = EnumValues({
    "label": LabelPurpose.LABEL,
    "minutes": LabelPurpose.MINUTES
});

class LabelUtterance {
    final String id;
    final String speaker;
    
    ///Seconds from the moment's start
    final int t;
    final String text;
    final bool uncertain;

    LabelUtterance({
        required this.id,
        required this.speaker,
        required this.t,
        required this.text,
        required this.uncertain,
    });

    factory LabelUtterance.fromJson(Map<String, dynamic> json) => LabelUtterance(
        id: json["id"],
        speaker: json["speaker"],
        t: json["t"],
        text: json["text"],
        uncertain: json["uncertain"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "speaker": speaker,
        "t": t,
        "text": text,
        "uncertain": uncertain,
    };
}

class MomentLabelResponse {
    final List<LabelItem> items;
    final Minutes? minutes;
    final String modelVersion;
    final SceneLabel scene;
    final String summary;
    final String? title;
    final Tone tone;

    MomentLabelResponse({
        required this.items,
        required this.minutes,
        required this.modelVersion,
        required this.scene,
        required this.summary,
        required this.title,
        required this.tone,
    });

    factory MomentLabelResponse.fromJson(Map<String, dynamic> json) => MomentLabelResponse(
        items: List<LabelItem>.from(json["items"].map((x) => LabelItem.fromJson(x))),
        minutes: json["minutes"] == null ? null : Minutes.fromJson(json["minutes"]),
        modelVersion: json["model_version"],
        scene: SceneLabel.fromJson(json["scene"]),
        summary: json["summary"],
        title: json["title"],
        tone: toneValues.map[json["tone"]]!,
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "minutes": minutes?.toJson(),
        "model_version": modelVersion,
        "scene": scene.toJson(),
        "summary": summary,
        "title": title,
        "tone": toneValues.reverse[tone],
    };
}

class LabelItem {
    final double confidence;
    final String? counterpart;
    final Due? due;
    final String id;
    final String? owner;
    final List<String> sources;
    final String text;
    final ItemType type;

    LabelItem({
        required this.confidence,
        required this.counterpart,
        required this.due,
        required this.id,
        required this.owner,
        required this.sources,
        required this.text,
        required this.type,
    });

    factory LabelItem.fromJson(Map<String, dynamic> json) => LabelItem(
        confidence: json["confidence"]?.toDouble(),
        counterpart: json["counterpart"],
        due: json["due"] == null ? null : Due.fromJson(json["due"]),
        id: json["id"],
        owner: json["owner"],
        sources: List<String>.from(json["sources"].map((x) => x)),
        text: json["text"],
        type: itemTypeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "confidence": confidence,
        "counterpart": counterpart,
        "due": due?.toJson(),
        "id": id,
        "owner": owner,
        "sources": List<dynamic>.from(sources.map((x) => x)),
        "text": text,
        "type": itemTypeValues.reverse[type],
    };
}

class Due {
    final String? date;
    final String phrase;

    Due({
        required this.date,
        required this.phrase,
    });

    factory Due.fromJson(Map<String, dynamic> json) => Due(
        date: json["date"],
        phrase: json["phrase"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "phrase": phrase,
    };
}

enum ItemType {
    DECISION,
    FACT,
    PROMISE,
    QUESTION
}

final itemTypeValues = EnumValues({
    "decision": ItemType.DECISION,
    "fact": ItemType.FACT,
    "promise": ItemType.PROMISE,
    "question": ItemType.QUESTION
});

class Minutes {
    final List<String> decisions;
    final String? followUpDraft;
    final List<String> openQuestions;
    final List<String> promises;

    Minutes({
        required this.decisions,
        required this.followUpDraft,
        required this.openQuestions,
        required this.promises,
    });

    factory Minutes.fromJson(Map<String, dynamic> json) => Minutes(
        decisions: List<String>.from(json["decisions"].map((x) => x)),
        followUpDraft: json["follow_up_draft"],
        openQuestions: List<String>.from(json["open_questions"].map((x) => x)),
        promises: List<String>.from(json["promises"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "decisions": List<dynamic>.from(decisions.map((x) => x)),
        "follow_up_draft": followUpDraft,
        "open_questions": List<dynamic>.from(openQuestions.map((x) => x)),
        "promises": List<dynamic>.from(promises.map((x) => x)),
    };
}

class SceneLabel {
    final double confidence;
    final String label;

    SceneLabel({
        required this.confidence,
        required this.label,
    });

    factory SceneLabel.fromJson(Map<String, dynamic> json) => SceneLabel(
        confidence: json["confidence"]?.toDouble(),
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "confidence": confidence,
        "label": label,
    };
}

enum Tone {
    CONFLICT,
    NEGATIVE,
    NEUTRAL,
    POSITIVE
}

final toneValues = EnumValues({
    "conflict": Tone.CONFLICT,
    "negative": Tone.NEGATIVE,
    "neutral": Tone.NEUTRAL,
    "positive": Tone.POSITIVE
});


///POST /v1/recap (spec §12.2). Tokens are day-scoped for this request.
class RecapRequest {
    final String day;
    final List<RecapItem> items;
    final List<RecapMark> marks;
    final int maxEntries;
    final List<RecapMoment> moments;
    final RecapPreferences preferences;
    final int schemaVersion;
    final RecapStats stats;
    final String tz;

    RecapRequest({
        required this.day,
        required this.items,
        required this.marks,
        required this.maxEntries,
        required this.moments,
        required this.preferences,
        required this.schemaVersion,
        required this.stats,
        required this.tz,
    });

    factory RecapRequest.fromJson(Map<String, dynamic> json) => RecapRequest(
        day: json["day"],
        items: List<RecapItem>.from(json["items"].map((x) => RecapItem.fromJson(x))),
        marks: List<RecapMark>.from(json["marks"].map((x) => RecapMark.fromJson(x))),
        maxEntries: json["max_entries"],
        moments: List<RecapMoment>.from(json["moments"].map((x) => RecapMoment.fromJson(x))),
        preferences: RecapPreferences.fromJson(json["preferences"]),
        schemaVersion: json["schema_version"],
        stats: RecapStats.fromJson(json["stats"]),
        tz: json["tz"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "marks": List<dynamic>.from(marks.map((x) => x.toJson())),
        "max_entries": maxEntries,
        "moments": List<dynamic>.from(moments.map((x) => x.toJson())),
        "preferences": preferences.toJson(),
        "schema_version": schemaVersion,
        "stats": stats.toJson(),
        "tz": tz,
    };
}

class RecapItem {
    final double confidence;
    final Direction direction;
    final String? dueDate;
    final String moment;
    final String ref;
    final String text;
    final ItemType type;

    RecapItem({
        required this.confidence,
        required this.direction,
        required this.dueDate,
        required this.moment,
        required this.ref,
        required this.text,
        required this.type,
    });

    factory RecapItem.fromJson(Map<String, dynamic> json) => RecapItem(
        confidence: json["confidence"]?.toDouble(),
        direction: directionValues.map[json["direction"]]!,
        dueDate: json["due_date"],
        moment: json["moment"],
        ref: json["ref"],
        text: json["text"],
        type: itemTypeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "confidence": confidence,
        "direction": directionValues.reverse[direction],
        "due_date": dueDate,
        "moment": moment,
        "ref": ref,
        "text": text,
        "type": itemTypeValues.reverse[type],
    };
}

enum Direction {
    BY_USER,
    OTHER,
    TO_USER
}

final directionValues = EnumValues({
    "by_user": Direction.BY_USER,
    "other": Direction.OTHER,
    "to_user": Direction.TO_USER
});

class RecapMark {
    final String localTime;
    final String moment;

    RecapMark({
        required this.localTime,
        required this.moment,
    });

    factory RecapMark.fromJson(Map<String, dynamic> json) => RecapMark(
        localTime: json["local_time"],
        moment: json["moment"],
    );

    Map<String, dynamic> toJson() => {
        "local_time": localTime,
        "moment": moment,
    };
}

class RecapMoment {
    final int durationS;
    final String localStart;
    final String ref;
    final String? scene;
    final String? summary;
    final String? title;

    RecapMoment({
        required this.durationS,
        required this.localStart,
        required this.ref,
        required this.scene,
        required this.summary,
        required this.title,
    });

    factory RecapMoment.fromJson(Map<String, dynamic> json) => RecapMoment(
        durationS: json["duration_s"],
        localStart: json["local_start"],
        ref: json["ref"],
        scene: json["scene"],
        summary: json["summary"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "duration_s": durationS,
        "local_start": localStart,
        "ref": ref,
        "scene": scene,
        "summary": summary,
        "title": title,
    };
}

class RecapPreferences {
    final Map<String, int> counterpartRight;
    final Map<String, int> notImportant;
    final Map<String, int> right;

    RecapPreferences({
        required this.counterpartRight,
        required this.notImportant,
        required this.right,
    });

    factory RecapPreferences.fromJson(Map<String, dynamic> json) => RecapPreferences(
        counterpartRight: Map.from(json["counterpart_right"]).map((k, v) => MapEntry<String, int>(k, v)),
        notImportant: Map.from(json["not_important"]).map((k, v) => MapEntry<String, int>(k, v)),
        right: Map.from(json["right"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "counterpart_right": Map.from(counterpartRight).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "not_important": Map.from(notImportant).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "right": Map.from(right).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class RecapStats {
    final int longestMomentS;
    final int meetingS;
    final int moments;

    RecapStats({
        required this.longestMomentS,
        required this.meetingS,
        required this.moments,
    });

    factory RecapStats.fromJson(Map<String, dynamic> json) => RecapStats(
        longestMomentS: json["longest_moment_s"],
        meetingS: json["meeting_s"],
        moments: json["moments"],
    );

    Map<String, dynamic> toJson() => {
        "longest_moment_s": longestMomentS,
        "meeting_s": meetingS,
        "moments": moments,
    };
}

class RecapResponse {
    final String? funLine;
    final String? highlight;
    final String modelVersion;
    final bool quietDay;
    final List<String> ranked;

    RecapResponse({
        required this.funLine,
        required this.highlight,
        required this.modelVersion,
        required this.quietDay,
        required this.ranked,
    });

    factory RecapResponse.fromJson(Map<String, dynamic> json) => RecapResponse(
        funLine: json["fun_line"],
        highlight: json["highlight"],
        modelVersion: json["model_version"],
        quietDay: json["quiet_day"],
        ranked: List<String>.from(json["ranked"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "fun_line": funLine,
        "highlight": highlight,
        "model_version": modelVersion,
        "quiet_day": quietDay,
        "ranked": List<dynamic>.from(ranked.map((x) => x)),
    };
}


///POST /v1/telemetry (spec §12.3, §15). Content-free; property keys are whitelisted per
///event name by the gateway.
class TelemetryRequest {
    final List<TelemetryEvent> events;
    final int schemaVersion;

    TelemetryRequest({
        required this.events,
        required this.schemaVersion,
    });

    factory TelemetryRequest.fromJson(Map<String, dynamic> json) => TelemetryRequest(
        events: List<TelemetryEvent>.from(json["events"].map((x) => TelemetryEvent.fromJson(x))),
        schemaVersion: json["schema_version"],
    );

    Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "schema_version": schemaVersion,
    };
}

class TelemetryEvent {
    final String name;
    
    ///UTC epoch milliseconds
    final int occurredAt;
    final Map<String, dynamic> props;

    TelemetryEvent({
        required this.name,
        required this.occurredAt,
        required this.props,
    });

    factory TelemetryEvent.fromJson(Map<String, dynamic> json) => TelemetryEvent(
        name: json["name"],
        occurredAt: json["occurred_at"],
        props: Map.from(json["props"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "occurred_at": occurredAt,
        "props": Map.from(props).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

