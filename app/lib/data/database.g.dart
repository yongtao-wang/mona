// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Session extends Table with TableInfo<Session, SessionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Session(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _runIdMeta = const VerificationMeta('runId');
  late final GeneratedColumn<String> runId = GeneratedColumn<String>(
    'run_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _sceneMeta = const VerificationMeta('scene');
  late final GeneratedColumn<String> scene = GeneratedColumn<String>(
    'scene',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK (scene IN (\'day\', \'meeting\', \'trip\', \'show\', \'lecture\', \'appointment\'))',
  );
  static const VerificationMeta _startTriggerMeta = const VerificationMeta('startTrigger');
  late final GeneratedColumn<String> startTrigger = GeneratedColumn<String>(
    'start_trigger',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta('startedAt');
  late final GeneratedColumn<int> startedAt = GeneratedColumn<int>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta('endedAt');
  late final GeneratedColumn<int> endedAt = GeneratedColumn<int>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _endReasonMeta = const VerificationMeta('endReason');
  late final GeneratedColumn<String> endReason = GeneratedColumn<String>(
    'end_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'CHECK (end_reason IN (\'user\', \'scene_switch\', \'paused_timeout\', \'crash\', \'account_deleted\'))',
  );
  static const VerificationMeta _tzMeta = const VerificationMeta('tz');
  late final GeneratedColumn<String> tz = GeneratedColumn<String>(
    'tz',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (status IN (\'recording\', \'paused\', \'closing\', \'closed\', \'failed\'))',
  );
  static const VerificationMeta _lastHeartbeatAtMeta = const VerificationMeta('lastHeartbeatAt');
  late final GeneratedColumn<int> lastHeartbeatAt = GeneratedColumn<int>(
    'last_heartbeat_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _placeLabelMeta = const VerificationMeta('placeLabel');
  late final GeneratedColumn<String> placeLabel = GeneratedColumn<String>(
    'place_label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _latCoarseMeta = const VerificationMeta('latCoarse');
  late final GeneratedColumn<double> latCoarse = GeneratedColumn<double>(
    'lat_coarse',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _lngCoarseMeta = const VerificationMeta('lngCoarse');
  late final GeneratedColumn<double> lngCoarse = GeneratedColumn<double>(
    'lng_coarse',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _calendarEventIdMeta = const VerificationMeta('calendarEventId');
  late final GeneratedColumn<String> calendarEventId = GeneratedColumn<String>(
    'calendar_event_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _attendeeCountHintMeta = const VerificationMeta('attendeeCountHint');
  late final GeneratedColumn<int> attendeeCountHint = GeneratedColumn<int>(
    'attendee_count_hint',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _consentShownAtMeta = const VerificationMeta('consentShownAt');
  late final GeneratedColumn<int> consentShownAt = GeneratedColumn<int>(
    'consent_shown_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _consentModeMeta = const VerificationMeta('consentMode');
  late final GeneratedColumn<String> consentMode = GeneratedColumn<String>(
    'consent_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'CHECK (consent_mode IN (\'card\', \'card_and_chime\'))',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    runId,
    scene,
    startTrigger,
    startedAt,
    endedAt,
    endReason,
    tz,
    status,
    lastHeartbeatAt,
    placeLabel,
    latCoarse,
    lngCoarse,
    calendarEventId,
    attendeeCountHint,
    consentShownAt,
    consentMode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session';
  @override
  VerificationContext validateIntegrity(Insertable<SessionData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('run_id')) {
      context.handle(_runIdMeta, runId.isAcceptableOrUnknown(data['run_id']!, _runIdMeta));
    } else if (isInserting) {
      context.missing(_runIdMeta);
    }
    if (data.containsKey('scene')) {
      context.handle(_sceneMeta, scene.isAcceptableOrUnknown(data['scene']!, _sceneMeta));
    } else if (isInserting) {
      context.missing(_sceneMeta);
    }
    if (data.containsKey('start_trigger')) {
      context.handle(_startTriggerMeta, startTrigger.isAcceptableOrUnknown(data['start_trigger']!, _startTriggerMeta));
    } else if (isInserting) {
      context.missing(_startTriggerMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta, startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(_endedAtMeta, endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta));
    }
    if (data.containsKey('end_reason')) {
      context.handle(_endReasonMeta, endReason.isAcceptableOrUnknown(data['end_reason']!, _endReasonMeta));
    }
    if (data.containsKey('tz')) {
      context.handle(_tzMeta, tz.isAcceptableOrUnknown(data['tz']!, _tzMeta));
    } else if (isInserting) {
      context.missing(_tzMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta, status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('last_heartbeat_at')) {
      context.handle(
        _lastHeartbeatAtMeta,
        lastHeartbeatAt.isAcceptableOrUnknown(data['last_heartbeat_at']!, _lastHeartbeatAtMeta),
      );
    }
    if (data.containsKey('place_label')) {
      context.handle(_placeLabelMeta, placeLabel.isAcceptableOrUnknown(data['place_label']!, _placeLabelMeta));
    }
    if (data.containsKey('lat_coarse')) {
      context.handle(_latCoarseMeta, latCoarse.isAcceptableOrUnknown(data['lat_coarse']!, _latCoarseMeta));
    }
    if (data.containsKey('lng_coarse')) {
      context.handle(_lngCoarseMeta, lngCoarse.isAcceptableOrUnknown(data['lng_coarse']!, _lngCoarseMeta));
    }
    if (data.containsKey('calendar_event_id')) {
      context.handle(
        _calendarEventIdMeta,
        calendarEventId.isAcceptableOrUnknown(data['calendar_event_id']!, _calendarEventIdMeta),
      );
    }
    if (data.containsKey('attendee_count_hint')) {
      context.handle(
        _attendeeCountHintMeta,
        attendeeCountHint.isAcceptableOrUnknown(data['attendee_count_hint']!, _attendeeCountHintMeta),
      );
    }
    if (data.containsKey('consent_shown_at')) {
      context.handle(
        _consentShownAtMeta,
        consentShownAt.isAcceptableOrUnknown(data['consent_shown_at']!, _consentShownAtMeta),
      );
    }
    if (data.containsKey('consent_mode')) {
      context.handle(_consentModeMeta, consentMode.isAcceptableOrUnknown(data['consent_mode']!, _consentModeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      runId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}run_id'])!,
      scene: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}scene'])!,
      startTrigger: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}start_trigger'])!,
      startedAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}started_at'])!,
      endedAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}ended_at']),
      endReason: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}end_reason']),
      tz: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}tz'])!,
      status: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      lastHeartbeatAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}last_heartbeat_at']),
      placeLabel: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}place_label']),
      latCoarse: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}lat_coarse']),
      lngCoarse: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}lng_coarse']),
      calendarEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calendar_event_id'],
      ),
      attendeeCountHint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attendee_count_hint'],
      ),
      consentShownAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}consent_shown_at']),
      consentMode: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}consent_mode']),
    );
  }

  @override
  Session createAlias(String alias) {
    return Session(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(scene NOT IN (\'meeting\', \'appointment\') OR consent_shown_at IS NOT NULL)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class SessionData extends DataClass implements Insertable<SessionData> {
  final String id;
  final String runId;

  /// capture run (§6.9); sessions of one run are back to back
  final String scene;
  final String startTrigger;

  /// in_app | control | action_button | live_activity | notification | scene_switch | watch
  final int startedAt;
  final int? endedAt;
  final String? endReason;
  final String tz;

  /// IANA zone at start
  final String status;
  final int? lastHeartbeatAt;
  final String? placeLabel;
  final double? latCoarse;

  /// rounded to about 100 m; null without permission
  final double? lngCoarse;
  final String? calendarEventId;
  final int? attendeeCountHint;
  final int? consentShownAt;
  final String? consentMode;
  const SessionData({
    required this.id,
    required this.runId,
    required this.scene,
    required this.startTrigger,
    required this.startedAt,
    this.endedAt,
    this.endReason,
    required this.tz,
    required this.status,
    this.lastHeartbeatAt,
    this.placeLabel,
    this.latCoarse,
    this.lngCoarse,
    this.calendarEventId,
    this.attendeeCountHint,
    this.consentShownAt,
    this.consentMode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['run_id'] = Variable<String>(runId);
    map['scene'] = Variable<String>(scene);
    map['start_trigger'] = Variable<String>(startTrigger);
    map['started_at'] = Variable<int>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<int>(endedAt);
    }
    if (!nullToAbsent || endReason != null) {
      map['end_reason'] = Variable<String>(endReason);
    }
    map['tz'] = Variable<String>(tz);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || lastHeartbeatAt != null) {
      map['last_heartbeat_at'] = Variable<int>(lastHeartbeatAt);
    }
    if (!nullToAbsent || placeLabel != null) {
      map['place_label'] = Variable<String>(placeLabel);
    }
    if (!nullToAbsent || latCoarse != null) {
      map['lat_coarse'] = Variable<double>(latCoarse);
    }
    if (!nullToAbsent || lngCoarse != null) {
      map['lng_coarse'] = Variable<double>(lngCoarse);
    }
    if (!nullToAbsent || calendarEventId != null) {
      map['calendar_event_id'] = Variable<String>(calendarEventId);
    }
    if (!nullToAbsent || attendeeCountHint != null) {
      map['attendee_count_hint'] = Variable<int>(attendeeCountHint);
    }
    if (!nullToAbsent || consentShownAt != null) {
      map['consent_shown_at'] = Variable<int>(consentShownAt);
    }
    if (!nullToAbsent || consentMode != null) {
      map['consent_mode'] = Variable<String>(consentMode);
    }
    return map;
  }

  SessionCompanion toCompanion(bool nullToAbsent) {
    return SessionCompanion(
      id: Value(id),
      runId: Value(runId),
      scene: Value(scene),
      startTrigger: Value(startTrigger),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent ? const Value.absent() : Value(endedAt),
      endReason: endReason == null && nullToAbsent ? const Value.absent() : Value(endReason),
      tz: Value(tz),
      status: Value(status),
      lastHeartbeatAt: lastHeartbeatAt == null && nullToAbsent ? const Value.absent() : Value(lastHeartbeatAt),
      placeLabel: placeLabel == null && nullToAbsent ? const Value.absent() : Value(placeLabel),
      latCoarse: latCoarse == null && nullToAbsent ? const Value.absent() : Value(latCoarse),
      lngCoarse: lngCoarse == null && nullToAbsent ? const Value.absent() : Value(lngCoarse),
      calendarEventId: calendarEventId == null && nullToAbsent ? const Value.absent() : Value(calendarEventId),
      attendeeCountHint: attendeeCountHint == null && nullToAbsent ? const Value.absent() : Value(attendeeCountHint),
      consentShownAt: consentShownAt == null && nullToAbsent ? const Value.absent() : Value(consentShownAt),
      consentMode: consentMode == null && nullToAbsent ? const Value.absent() : Value(consentMode),
    );
  }

  factory SessionData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionData(
      id: serializer.fromJson<String>(json['id']),
      runId: serializer.fromJson<String>(json['run_id']),
      scene: serializer.fromJson<String>(json['scene']),
      startTrigger: serializer.fromJson<String>(json['start_trigger']),
      startedAt: serializer.fromJson<int>(json['started_at']),
      endedAt: serializer.fromJson<int?>(json['ended_at']),
      endReason: serializer.fromJson<String?>(json['end_reason']),
      tz: serializer.fromJson<String>(json['tz']),
      status: serializer.fromJson<String>(json['status']),
      lastHeartbeatAt: serializer.fromJson<int?>(json['last_heartbeat_at']),
      placeLabel: serializer.fromJson<String?>(json['place_label']),
      latCoarse: serializer.fromJson<double?>(json['lat_coarse']),
      lngCoarse: serializer.fromJson<double?>(json['lng_coarse']),
      calendarEventId: serializer.fromJson<String?>(json['calendar_event_id']),
      attendeeCountHint: serializer.fromJson<int?>(json['attendee_count_hint']),
      consentShownAt: serializer.fromJson<int?>(json['consent_shown_at']),
      consentMode: serializer.fromJson<String?>(json['consent_mode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'run_id': serializer.toJson<String>(runId),
      'scene': serializer.toJson<String>(scene),
      'start_trigger': serializer.toJson<String>(startTrigger),
      'started_at': serializer.toJson<int>(startedAt),
      'ended_at': serializer.toJson<int?>(endedAt),
      'end_reason': serializer.toJson<String?>(endReason),
      'tz': serializer.toJson<String>(tz),
      'status': serializer.toJson<String>(status),
      'last_heartbeat_at': serializer.toJson<int?>(lastHeartbeatAt),
      'place_label': serializer.toJson<String?>(placeLabel),
      'lat_coarse': serializer.toJson<double?>(latCoarse),
      'lng_coarse': serializer.toJson<double?>(lngCoarse),
      'calendar_event_id': serializer.toJson<String?>(calendarEventId),
      'attendee_count_hint': serializer.toJson<int?>(attendeeCountHint),
      'consent_shown_at': serializer.toJson<int?>(consentShownAt),
      'consent_mode': serializer.toJson<String?>(consentMode),
    };
  }

  SessionData copyWith({
    String? id,
    String? runId,
    String? scene,
    String? startTrigger,
    int? startedAt,
    Value<int?> endedAt = const Value.absent(),
    Value<String?> endReason = const Value.absent(),
    String? tz,
    String? status,
    Value<int?> lastHeartbeatAt = const Value.absent(),
    Value<String?> placeLabel = const Value.absent(),
    Value<double?> latCoarse = const Value.absent(),
    Value<double?> lngCoarse = const Value.absent(),
    Value<String?> calendarEventId = const Value.absent(),
    Value<int?> attendeeCountHint = const Value.absent(),
    Value<int?> consentShownAt = const Value.absent(),
    Value<String?> consentMode = const Value.absent(),
  }) => SessionData(
    id: id ?? this.id,
    runId: runId ?? this.runId,
    scene: scene ?? this.scene,
    startTrigger: startTrigger ?? this.startTrigger,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    endReason: endReason.present ? endReason.value : this.endReason,
    tz: tz ?? this.tz,
    status: status ?? this.status,
    lastHeartbeatAt: lastHeartbeatAt.present ? lastHeartbeatAt.value : this.lastHeartbeatAt,
    placeLabel: placeLabel.present ? placeLabel.value : this.placeLabel,
    latCoarse: latCoarse.present ? latCoarse.value : this.latCoarse,
    lngCoarse: lngCoarse.present ? lngCoarse.value : this.lngCoarse,
    calendarEventId: calendarEventId.present ? calendarEventId.value : this.calendarEventId,
    attendeeCountHint: attendeeCountHint.present ? attendeeCountHint.value : this.attendeeCountHint,
    consentShownAt: consentShownAt.present ? consentShownAt.value : this.consentShownAt,
    consentMode: consentMode.present ? consentMode.value : this.consentMode,
  );
  SessionData copyWithCompanion(SessionCompanion data) {
    return SessionData(
      id: data.id.present ? data.id.value : this.id,
      runId: data.runId.present ? data.runId.value : this.runId,
      scene: data.scene.present ? data.scene.value : this.scene,
      startTrigger: data.startTrigger.present ? data.startTrigger.value : this.startTrigger,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      endReason: data.endReason.present ? data.endReason.value : this.endReason,
      tz: data.tz.present ? data.tz.value : this.tz,
      status: data.status.present ? data.status.value : this.status,
      lastHeartbeatAt: data.lastHeartbeatAt.present ? data.lastHeartbeatAt.value : this.lastHeartbeatAt,
      placeLabel: data.placeLabel.present ? data.placeLabel.value : this.placeLabel,
      latCoarse: data.latCoarse.present ? data.latCoarse.value : this.latCoarse,
      lngCoarse: data.lngCoarse.present ? data.lngCoarse.value : this.lngCoarse,
      calendarEventId: data.calendarEventId.present ? data.calendarEventId.value : this.calendarEventId,
      attendeeCountHint: data.attendeeCountHint.present ? data.attendeeCountHint.value : this.attendeeCountHint,
      consentShownAt: data.consentShownAt.present ? data.consentShownAt.value : this.consentShownAt,
      consentMode: data.consentMode.present ? data.consentMode.value : this.consentMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionData(')
          ..write('id: $id, ')
          ..write('runId: $runId, ')
          ..write('scene: $scene, ')
          ..write('startTrigger: $startTrigger, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('endReason: $endReason, ')
          ..write('tz: $tz, ')
          ..write('status: $status, ')
          ..write('lastHeartbeatAt: $lastHeartbeatAt, ')
          ..write('placeLabel: $placeLabel, ')
          ..write('latCoarse: $latCoarse, ')
          ..write('lngCoarse: $lngCoarse, ')
          ..write('calendarEventId: $calendarEventId, ')
          ..write('attendeeCountHint: $attendeeCountHint, ')
          ..write('consentShownAt: $consentShownAt, ')
          ..write('consentMode: $consentMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    runId,
    scene,
    startTrigger,
    startedAt,
    endedAt,
    endReason,
    tz,
    status,
    lastHeartbeatAt,
    placeLabel,
    latCoarse,
    lngCoarse,
    calendarEventId,
    attendeeCountHint,
    consentShownAt,
    consentMode,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionData &&
          other.id == this.id &&
          other.runId == this.runId &&
          other.scene == this.scene &&
          other.startTrigger == this.startTrigger &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.endReason == this.endReason &&
          other.tz == this.tz &&
          other.status == this.status &&
          other.lastHeartbeatAt == this.lastHeartbeatAt &&
          other.placeLabel == this.placeLabel &&
          other.latCoarse == this.latCoarse &&
          other.lngCoarse == this.lngCoarse &&
          other.calendarEventId == this.calendarEventId &&
          other.attendeeCountHint == this.attendeeCountHint &&
          other.consentShownAt == this.consentShownAt &&
          other.consentMode == this.consentMode);
}

class SessionCompanion extends UpdateCompanion<SessionData> {
  final Value<String> id;
  final Value<String> runId;
  final Value<String> scene;
  final Value<String> startTrigger;
  final Value<int> startedAt;
  final Value<int?> endedAt;
  final Value<String?> endReason;
  final Value<String> tz;
  final Value<String> status;
  final Value<int?> lastHeartbeatAt;
  final Value<String?> placeLabel;
  final Value<double?> latCoarse;
  final Value<double?> lngCoarse;
  final Value<String?> calendarEventId;
  final Value<int?> attendeeCountHint;
  final Value<int?> consentShownAt;
  final Value<String?> consentMode;
  final Value<int> rowid;
  const SessionCompanion({
    this.id = const Value.absent(),
    this.runId = const Value.absent(),
    this.scene = const Value.absent(),
    this.startTrigger = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.endReason = const Value.absent(),
    this.tz = const Value.absent(),
    this.status = const Value.absent(),
    this.lastHeartbeatAt = const Value.absent(),
    this.placeLabel = const Value.absent(),
    this.latCoarse = const Value.absent(),
    this.lngCoarse = const Value.absent(),
    this.calendarEventId = const Value.absent(),
    this.attendeeCountHint = const Value.absent(),
    this.consentShownAt = const Value.absent(),
    this.consentMode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionCompanion.insert({
    required String id,
    required String runId,
    required String scene,
    required String startTrigger,
    required int startedAt,
    this.endedAt = const Value.absent(),
    this.endReason = const Value.absent(),
    required String tz,
    required String status,
    this.lastHeartbeatAt = const Value.absent(),
    this.placeLabel = const Value.absent(),
    this.latCoarse = const Value.absent(),
    this.lngCoarse = const Value.absent(),
    this.calendarEventId = const Value.absent(),
    this.attendeeCountHint = const Value.absent(),
    this.consentShownAt = const Value.absent(),
    this.consentMode = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       runId = Value(runId),
       scene = Value(scene),
       startTrigger = Value(startTrigger),
       startedAt = Value(startedAt),
       tz = Value(tz),
       status = Value(status);
  static Insertable<SessionData> custom({
    Expression<String>? id,
    Expression<String>? runId,
    Expression<String>? scene,
    Expression<String>? startTrigger,
    Expression<int>? startedAt,
    Expression<int>? endedAt,
    Expression<String>? endReason,
    Expression<String>? tz,
    Expression<String>? status,
    Expression<int>? lastHeartbeatAt,
    Expression<String>? placeLabel,
    Expression<double>? latCoarse,
    Expression<double>? lngCoarse,
    Expression<String>? calendarEventId,
    Expression<int>? attendeeCountHint,
    Expression<int>? consentShownAt,
    Expression<String>? consentMode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (runId != null) 'run_id': runId,
      if (scene != null) 'scene': scene,
      if (startTrigger != null) 'start_trigger': startTrigger,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (endReason != null) 'end_reason': endReason,
      if (tz != null) 'tz': tz,
      if (status != null) 'status': status,
      if (lastHeartbeatAt != null) 'last_heartbeat_at': lastHeartbeatAt,
      if (placeLabel != null) 'place_label': placeLabel,
      if (latCoarse != null) 'lat_coarse': latCoarse,
      if (lngCoarse != null) 'lng_coarse': lngCoarse,
      if (calendarEventId != null) 'calendar_event_id': calendarEventId,
      if (attendeeCountHint != null) 'attendee_count_hint': attendeeCountHint,
      if (consentShownAt != null) 'consent_shown_at': consentShownAt,
      if (consentMode != null) 'consent_mode': consentMode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionCompanion copyWith({
    Value<String>? id,
    Value<String>? runId,
    Value<String>? scene,
    Value<String>? startTrigger,
    Value<int>? startedAt,
    Value<int?>? endedAt,
    Value<String?>? endReason,
    Value<String>? tz,
    Value<String>? status,
    Value<int?>? lastHeartbeatAt,
    Value<String?>? placeLabel,
    Value<double?>? latCoarse,
    Value<double?>? lngCoarse,
    Value<String?>? calendarEventId,
    Value<int?>? attendeeCountHint,
    Value<int?>? consentShownAt,
    Value<String?>? consentMode,
    Value<int>? rowid,
  }) {
    return SessionCompanion(
      id: id ?? this.id,
      runId: runId ?? this.runId,
      scene: scene ?? this.scene,
      startTrigger: startTrigger ?? this.startTrigger,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      endReason: endReason ?? this.endReason,
      tz: tz ?? this.tz,
      status: status ?? this.status,
      lastHeartbeatAt: lastHeartbeatAt ?? this.lastHeartbeatAt,
      placeLabel: placeLabel ?? this.placeLabel,
      latCoarse: latCoarse ?? this.latCoarse,
      lngCoarse: lngCoarse ?? this.lngCoarse,
      calendarEventId: calendarEventId ?? this.calendarEventId,
      attendeeCountHint: attendeeCountHint ?? this.attendeeCountHint,
      consentShownAt: consentShownAt ?? this.consentShownAt,
      consentMode: consentMode ?? this.consentMode,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (runId.present) {
      map['run_id'] = Variable<String>(runId.value);
    }
    if (scene.present) {
      map['scene'] = Variable<String>(scene.value);
    }
    if (startTrigger.present) {
      map['start_trigger'] = Variable<String>(startTrigger.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<int>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<int>(endedAt.value);
    }
    if (endReason.present) {
      map['end_reason'] = Variable<String>(endReason.value);
    }
    if (tz.present) {
      map['tz'] = Variable<String>(tz.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (lastHeartbeatAt.present) {
      map['last_heartbeat_at'] = Variable<int>(lastHeartbeatAt.value);
    }
    if (placeLabel.present) {
      map['place_label'] = Variable<String>(placeLabel.value);
    }
    if (latCoarse.present) {
      map['lat_coarse'] = Variable<double>(latCoarse.value);
    }
    if (lngCoarse.present) {
      map['lng_coarse'] = Variable<double>(lngCoarse.value);
    }
    if (calendarEventId.present) {
      map['calendar_event_id'] = Variable<String>(calendarEventId.value);
    }
    if (attendeeCountHint.present) {
      map['attendee_count_hint'] = Variable<int>(attendeeCountHint.value);
    }
    if (consentShownAt.present) {
      map['consent_shown_at'] = Variable<int>(consentShownAt.value);
    }
    if (consentMode.present) {
      map['consent_mode'] = Variable<String>(consentMode.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionCompanion(')
          ..write('id: $id, ')
          ..write('runId: $runId, ')
          ..write('scene: $scene, ')
          ..write('startTrigger: $startTrigger, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('endReason: $endReason, ')
          ..write('tz: $tz, ')
          ..write('status: $status, ')
          ..write('lastHeartbeatAt: $lastHeartbeatAt, ')
          ..write('placeLabel: $placeLabel, ')
          ..write('latCoarse: $latCoarse, ')
          ..write('lngCoarse: $lngCoarse, ')
          ..write('calendarEventId: $calendarEventId, ')
          ..write('attendeeCountHint: $attendeeCountHint, ')
          ..write('consentShownAt: $consentShownAt, ')
          ..write('consentMode: $consentMode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CaptureGap extends Table with TableInfo<CaptureGap, CaptureGapData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CaptureGap(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES session(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _startMsMeta = const VerificationMeta('startMs');
  late final GeneratedColumn<int> startMs = GeneratedColumn<int>(
    'start_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _endMsMeta = const VerificationMeta('endMs');
  late final GeneratedColumn<int> endMs = GeneratedColumn<int>(
    'end_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (reason IN (\'zone\', \'private\', \'battery\', \'storage\', \'thermal\', \'interruption\', \'indicator\', \'playback\', \'crash\', \'user\'))',
  );
  @override
  List<GeneratedColumn> get $columns => [id, sessionId, startMs, endMs, reason];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'capture_gap';
  @override
  VerificationContext validateIntegrity(Insertable<CaptureGapData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta, sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('start_ms')) {
      context.handle(_startMsMeta, startMs.isAcceptableOrUnknown(data['start_ms']!, _startMsMeta));
    } else if (isInserting) {
      context.missing(_startMsMeta);
    }
    if (data.containsKey('end_ms')) {
      context.handle(_endMsMeta, endMs.isAcceptableOrUnknown(data['end_ms']!, _endMsMeta));
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta, reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaptureGapData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaptureGapData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      startMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}start_ms'])!,
      endMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}end_ms']),
      reason: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
    );
  }

  @override
  CaptureGap createAlias(String alias) {
    return CaptureGap(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CaptureGapData extends DataClass implements Insertable<CaptureGapData> {
  final String id;
  final String sessionId;
  final int startMs;
  final int? endMs;
  final String reason;
  const CaptureGapData({
    required this.id,
    required this.sessionId,
    required this.startMs,
    this.endMs,
    required this.reason,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['start_ms'] = Variable<int>(startMs);
    if (!nullToAbsent || endMs != null) {
      map['end_ms'] = Variable<int>(endMs);
    }
    map['reason'] = Variable<String>(reason);
    return map;
  }

  CaptureGapCompanion toCompanion(bool nullToAbsent) {
    return CaptureGapCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      startMs: Value(startMs),
      endMs: endMs == null && nullToAbsent ? const Value.absent() : Value(endMs),
      reason: Value(reason),
    );
  }

  factory CaptureGapData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaptureGapData(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['session_id']),
      startMs: serializer.fromJson<int>(json['start_ms']),
      endMs: serializer.fromJson<int?>(json['end_ms']),
      reason: serializer.fromJson<String>(json['reason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'session_id': serializer.toJson<String>(sessionId),
      'start_ms': serializer.toJson<int>(startMs),
      'end_ms': serializer.toJson<int?>(endMs),
      'reason': serializer.toJson<String>(reason),
    };
  }

  CaptureGapData copyWith({
    String? id,
    String? sessionId,
    int? startMs,
    Value<int?> endMs = const Value.absent(),
    String? reason,
  }) => CaptureGapData(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    startMs: startMs ?? this.startMs,
    endMs: endMs.present ? endMs.value : this.endMs,
    reason: reason ?? this.reason,
  );
  CaptureGapData copyWithCompanion(CaptureGapCompanion data) {
    return CaptureGapData(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      startMs: data.startMs.present ? data.startMs.value : this.startMs,
      endMs: data.endMs.present ? data.endMs.value : this.endMs,
      reason: data.reason.present ? data.reason.value : this.reason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaptureGapData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, startMs, endMs, reason);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaptureGapData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.startMs == this.startMs &&
          other.endMs == this.endMs &&
          other.reason == this.reason);
}

class CaptureGapCompanion extends UpdateCompanion<CaptureGapData> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<int> startMs;
  final Value<int?> endMs;
  final Value<String> reason;
  final Value<int> rowid;
  const CaptureGapCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.startMs = const Value.absent(),
    this.endMs = const Value.absent(),
    this.reason = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CaptureGapCompanion.insert({
    required String id,
    required String sessionId,
    required int startMs,
    this.endMs = const Value.absent(),
    required String reason,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       startMs = Value(startMs),
       reason = Value(reason);
  static Insertable<CaptureGapData> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<int>? startMs,
    Expression<int>? endMs,
    Expression<String>? reason,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (startMs != null) 'start_ms': startMs,
      if (endMs != null) 'end_ms': endMs,
      if (reason != null) 'reason': reason,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CaptureGapCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<int>? startMs,
    Value<int?>? endMs,
    Value<String>? reason,
    Value<int>? rowid,
  }) {
    return CaptureGapCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      startMs: startMs ?? this.startMs,
      endMs: endMs ?? this.endMs,
      reason: reason ?? this.reason,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (startMs.present) {
      map['start_ms'] = Variable<int>(startMs.value);
    }
    if (endMs.present) {
      map['end_ms'] = Variable<int>(endMs.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaptureGapCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('reason: $reason, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Person extends Table with TableInfo<Person, PersonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Person(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta('displayName');
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _aliasesMeta = const VerificationMeta('aliases');
  late final GeneratedColumn<String> aliases = GeneratedColumn<String>(
    'aliases',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _isSelfMeta = const VerificationMeta('isSelf');
  late final GeneratedColumn<int> isSelf = GeneratedColumn<int>(
    'is_self',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _contactRefMeta = const VerificationMeta('contactRef');
  late final GeneratedColumn<String> contactRef = GeneratedColumn<String>(
    'contact_ref',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, displayName, aliases, isSelf, contactRef, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person';
  @override
  VerificationContext validateIntegrity(Insertable<PersonData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(_displayNameMeta, displayName.isAcceptableOrUnknown(data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('aliases')) {
      context.handle(_aliasesMeta, aliases.isAcceptableOrUnknown(data['aliases']!, _aliasesMeta));
    }
    if (data.containsKey('is_self')) {
      context.handle(_isSelfMeta, isSelf.isAcceptableOrUnknown(data['is_self']!, _isSelfMeta));
    }
    if (data.containsKey('contact_ref')) {
      context.handle(_contactRefMeta, contactRef.isAcceptableOrUnknown(data['contact_ref']!, _contactRefMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      displayName: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      aliases: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}aliases']),
      isSelf: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}is_self'])!,
      contactRef: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}contact_ref']),
      createdAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  Person createAlias(String alias) {
    return Person(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PersonData extends DataClass implements Insertable<PersonData> {
  final String id;
  final String displayName;
  final String? aliases;

  /// JSON array: given name, English name, nicknames (§8.4)
  final int isSelf;

  /// the user's own row, so the pseudonymizer knows their name
  final String? contactRef;

  /// identifier from the system contact picker
  final int createdAt;
  const PersonData({
    required this.id,
    required this.displayName,
    this.aliases,
    required this.isSelf,
    this.contactRef,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || aliases != null) {
      map['aliases'] = Variable<String>(aliases);
    }
    map['is_self'] = Variable<int>(isSelf);
    if (!nullToAbsent || contactRef != null) {
      map['contact_ref'] = Variable<String>(contactRef);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  PersonCompanion toCompanion(bool nullToAbsent) {
    return PersonCompanion(
      id: Value(id),
      displayName: Value(displayName),
      aliases: aliases == null && nullToAbsent ? const Value.absent() : Value(aliases),
      isSelf: Value(isSelf),
      contactRef: contactRef == null && nullToAbsent ? const Value.absent() : Value(contactRef),
      createdAt: Value(createdAt),
    );
  }

  factory PersonData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonData(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['display_name']),
      aliases: serializer.fromJson<String?>(json['aliases']),
      isSelf: serializer.fromJson<int>(json['is_self']),
      contactRef: serializer.fromJson<String?>(json['contact_ref']),
      createdAt: serializer.fromJson<int>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'display_name': serializer.toJson<String>(displayName),
      'aliases': serializer.toJson<String?>(aliases),
      'is_self': serializer.toJson<int>(isSelf),
      'contact_ref': serializer.toJson<String?>(contactRef),
      'created_at': serializer.toJson<int>(createdAt),
    };
  }

  PersonData copyWith({
    String? id,
    String? displayName,
    Value<String?> aliases = const Value.absent(),
    int? isSelf,
    Value<String?> contactRef = const Value.absent(),
    int? createdAt,
  }) => PersonData(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    aliases: aliases.present ? aliases.value : this.aliases,
    isSelf: isSelf ?? this.isSelf,
    contactRef: contactRef.present ? contactRef.value : this.contactRef,
    createdAt: createdAt ?? this.createdAt,
  );
  PersonData copyWithCompanion(PersonCompanion data) {
    return PersonData(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present ? data.displayName.value : this.displayName,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      isSelf: data.isSelf.present ? data.isSelf.value : this.isSelf,
      contactRef: data.contactRef.present ? data.contactRef.value : this.contactRef,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonData(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('aliases: $aliases, ')
          ..write('isSelf: $isSelf, ')
          ..write('contactRef: $contactRef, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, displayName, aliases, isSelf, contactRef, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonData &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.aliases == this.aliases &&
          other.isSelf == this.isSelf &&
          other.contactRef == this.contactRef &&
          other.createdAt == this.createdAt);
}

class PersonCompanion extends UpdateCompanion<PersonData> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<String?> aliases;
  final Value<int> isSelf;
  final Value<String?> contactRef;
  final Value<int> createdAt;
  final Value<int> rowid;
  const PersonCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.aliases = const Value.absent(),
    this.isSelf = const Value.absent(),
    this.contactRef = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonCompanion.insert({
    required String id,
    required String displayName,
    this.aliases = const Value.absent(),
    this.isSelf = const Value.absent(),
    this.contactRef = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayName = Value(displayName),
       createdAt = Value(createdAt);
  static Insertable<PersonData> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? aliases,
    Expression<int>? isSelf,
    Expression<String>? contactRef,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (aliases != null) 'aliases': aliases,
      if (isSelf != null) 'is_self': isSelf,
      if (contactRef != null) 'contact_ref': contactRef,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<String?>? aliases,
    Value<int>? isSelf,
    Value<String?>? contactRef,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return PersonCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      aliases: aliases ?? this.aliases,
      isSelf: isSelf ?? this.isSelf,
      contactRef: contactRef ?? this.contactRef,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (isSelf.present) {
      map['is_self'] = Variable<int>(isSelf.value);
    }
    if (contactRef.present) {
      map['contact_ref'] = Variable<String>(contactRef.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('aliases: $aliases, ')
          ..write('isSelf: $isSelf, ')
          ..write('contactRef: $contactRef, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Speaker extends Table with TableInfo<Speaker, SpeakerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Speaker(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES session(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _isSelfMeta = const VerificationMeta('isSelf');
  late final GeneratedColumn<int> isSelf = GeneratedColumn<int>(
    'is_self',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta('personId');
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES person(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _mergedIntoMeta = const VerificationMeta('mergedInto');
  late final GeneratedColumn<String> mergedInto = GeneratedColumn<String>(
    'merged_into',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES speaker(id)',
  );
  static const VerificationMeta _colorIndexMeta = const VerificationMeta('colorIndex');
  late final GeneratedColumn<int> colorIndex = GeneratedColumn<int>(
    'color_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, sessionId, label, isSelf, personId, mergedInto, colorIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'speaker';
  @override
  VerificationContext validateIntegrity(Insertable<SpeakerData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta, sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(_labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('is_self')) {
      context.handle(_isSelfMeta, isSelf.isAcceptableOrUnknown(data['is_self']!, _isSelfMeta));
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta, personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    }
    if (data.containsKey('merged_into')) {
      context.handle(_mergedIntoMeta, mergedInto.isAcceptableOrUnknown(data['merged_into']!, _mergedIntoMeta));
    }
    if (data.containsKey('color_index')) {
      context.handle(_colorIndexMeta, colorIndex.isAcceptableOrUnknown(data['color_index']!, _colorIndexMeta));
    } else if (isInserting) {
      context.missing(_colorIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpeakerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpeakerData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      label: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      isSelf: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}is_self'])!,
      personId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}person_id']),
      mergedInto: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}merged_into']),
      colorIndex: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}color_index'])!,
    );
  }

  @override
  Speaker createAlias(String alias) {
    return Speaker(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SpeakerData extends DataClass implements Insertable<SpeakerData> {
  final String id;
  final String sessionId;
  final String label;

  /// 'You', 'B', 'C' ...
  final int isSelf;
  final String? personId;
  final String? mergedInto;

  /// set by "merge"; placeholders resolve through it (§8.7)
  final int colorIndex;
  const SpeakerData({
    required this.id,
    required this.sessionId,
    required this.label,
    required this.isSelf,
    this.personId,
    this.mergedInto,
    required this.colorIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['label'] = Variable<String>(label);
    map['is_self'] = Variable<int>(isSelf);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || mergedInto != null) {
      map['merged_into'] = Variable<String>(mergedInto);
    }
    map['color_index'] = Variable<int>(colorIndex);
    return map;
  }

  SpeakerCompanion toCompanion(bool nullToAbsent) {
    return SpeakerCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      label: Value(label),
      isSelf: Value(isSelf),
      personId: personId == null && nullToAbsent ? const Value.absent() : Value(personId),
      mergedInto: mergedInto == null && nullToAbsent ? const Value.absent() : Value(mergedInto),
      colorIndex: Value(colorIndex),
    );
  }

  factory SpeakerData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpeakerData(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['session_id']),
      label: serializer.fromJson<String>(json['label']),
      isSelf: serializer.fromJson<int>(json['is_self']),
      personId: serializer.fromJson<String?>(json['person_id']),
      mergedInto: serializer.fromJson<String?>(json['merged_into']),
      colorIndex: serializer.fromJson<int>(json['color_index']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'session_id': serializer.toJson<String>(sessionId),
      'label': serializer.toJson<String>(label),
      'is_self': serializer.toJson<int>(isSelf),
      'person_id': serializer.toJson<String?>(personId),
      'merged_into': serializer.toJson<String?>(mergedInto),
      'color_index': serializer.toJson<int>(colorIndex),
    };
  }

  SpeakerData copyWith({
    String? id,
    String? sessionId,
    String? label,
    int? isSelf,
    Value<String?> personId = const Value.absent(),
    Value<String?> mergedInto = const Value.absent(),
    int? colorIndex,
  }) => SpeakerData(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    label: label ?? this.label,
    isSelf: isSelf ?? this.isSelf,
    personId: personId.present ? personId.value : this.personId,
    mergedInto: mergedInto.present ? mergedInto.value : this.mergedInto,
    colorIndex: colorIndex ?? this.colorIndex,
  );
  SpeakerData copyWithCompanion(SpeakerCompanion data) {
    return SpeakerData(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      label: data.label.present ? data.label.value : this.label,
      isSelf: data.isSelf.present ? data.isSelf.value : this.isSelf,
      personId: data.personId.present ? data.personId.value : this.personId,
      mergedInto: data.mergedInto.present ? data.mergedInto.value : this.mergedInto,
      colorIndex: data.colorIndex.present ? data.colorIndex.value : this.colorIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpeakerData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('label: $label, ')
          ..write('isSelf: $isSelf, ')
          ..write('personId: $personId, ')
          ..write('mergedInto: $mergedInto, ')
          ..write('colorIndex: $colorIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, label, isSelf, personId, mergedInto, colorIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpeakerData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.label == this.label &&
          other.isSelf == this.isSelf &&
          other.personId == this.personId &&
          other.mergedInto == this.mergedInto &&
          other.colorIndex == this.colorIndex);
}

class SpeakerCompanion extends UpdateCompanion<SpeakerData> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> label;
  final Value<int> isSelf;
  final Value<String?> personId;
  final Value<String?> mergedInto;
  final Value<int> colorIndex;
  final Value<int> rowid;
  const SpeakerCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.label = const Value.absent(),
    this.isSelf = const Value.absent(),
    this.personId = const Value.absent(),
    this.mergedInto = const Value.absent(),
    this.colorIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpeakerCompanion.insert({
    required String id,
    required String sessionId,
    required String label,
    this.isSelf = const Value.absent(),
    this.personId = const Value.absent(),
    this.mergedInto = const Value.absent(),
    required int colorIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       label = Value(label),
       colorIndex = Value(colorIndex);
  static Insertable<SpeakerData> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? label,
    Expression<int>? isSelf,
    Expression<String>? personId,
    Expression<String>? mergedInto,
    Expression<int>? colorIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (label != null) 'label': label,
      if (isSelf != null) 'is_self': isSelf,
      if (personId != null) 'person_id': personId,
      if (mergedInto != null) 'merged_into': mergedInto,
      if (colorIndex != null) 'color_index': colorIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpeakerCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String>? label,
    Value<int>? isSelf,
    Value<String?>? personId,
    Value<String?>? mergedInto,
    Value<int>? colorIndex,
    Value<int>? rowid,
  }) {
    return SpeakerCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      label: label ?? this.label,
      isSelf: isSelf ?? this.isSelf,
      personId: personId ?? this.personId,
      mergedInto: mergedInto ?? this.mergedInto,
      colorIndex: colorIndex ?? this.colorIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (isSelf.present) {
      map['is_self'] = Variable<int>(isSelf.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (mergedInto.present) {
      map['merged_into'] = Variable<String>(mergedInto.value);
    }
    if (colorIndex.present) {
      map['color_index'] = Variable<int>(colorIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpeakerCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('label: $label, ')
          ..write('isSelf: $isSelf, ')
          ..write('personId: $personId, ')
          ..write('mergedInto: $mergedInto, ')
          ..write('colorIndex: $colorIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ConsentRecord extends Table with TableInfo<ConsentRecord, ConsentRecordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ConsentRecord(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (kind IN (\'self_voice\', \'remembered_voice\', \'analytics\'))',
  );
  static const VerificationMeta _subjectPersonMeta = const VerificationMeta('subjectPerson');
  late final GeneratedColumn<String> subjectPerson = GeneratedColumn<String>(
    'subject_person',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES person(id)',
  );
  static const VerificationMeta _textVersionMeta = const VerificationMeta('textVersion');
  late final GeneratedColumn<String> textVersion = GeneratedColumn<String>(
    'text_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _grantedAtMeta = const VerificationMeta('grantedAt');
  late final GeneratedColumn<int> grantedAt = GeneratedColumn<int>(
    'granted_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _withdrawnAtMeta = const VerificationMeta('withdrawnAt');
  late final GeneratedColumn<int> withdrawnAt = GeneratedColumn<int>(
    'withdrawn_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [id, kind, subjectPerson, textVersion, grantedAt, withdrawnAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'consent_record';
  @override
  VerificationContext validateIntegrity(Insertable<ConsentRecordData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(_kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('subject_person')) {
      context.handle(
        _subjectPersonMeta,
        subjectPerson.isAcceptableOrUnknown(data['subject_person']!, _subjectPersonMeta),
      );
    }
    if (data.containsKey('text_version')) {
      context.handle(_textVersionMeta, textVersion.isAcceptableOrUnknown(data['text_version']!, _textVersionMeta));
    } else if (isInserting) {
      context.missing(_textVersionMeta);
    }
    if (data.containsKey('granted_at')) {
      context.handle(_grantedAtMeta, grantedAt.isAcceptableOrUnknown(data['granted_at']!, _grantedAtMeta));
    } else if (isInserting) {
      context.missing(_grantedAtMeta);
    }
    if (data.containsKey('withdrawn_at')) {
      context.handle(_withdrawnAtMeta, withdrawnAt.isAcceptableOrUnknown(data['withdrawn_at']!, _withdrawnAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConsentRecordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConsentRecordData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      kind: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      subjectPerson: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}subject_person']),
      textVersion: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}text_version'])!,
      grantedAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}granted_at'])!,
      withdrawnAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}withdrawn_at']),
    );
  }

  @override
  ConsentRecord createAlias(String alias) {
    return ConsentRecord(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ConsentRecordData extends DataClass implements Insertable<ConsentRecordData> {
  final String id;
  final String kind;
  final String? subjectPerson;
  final String textVersion;

  /// which consent wording was shown
  final int grantedAt;
  final int? withdrawnAt;
  const ConsentRecordData({
    required this.id,
    required this.kind,
    this.subjectPerson,
    required this.textVersion,
    required this.grantedAt,
    this.withdrawnAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    if (!nullToAbsent || subjectPerson != null) {
      map['subject_person'] = Variable<String>(subjectPerson);
    }
    map['text_version'] = Variable<String>(textVersion);
    map['granted_at'] = Variable<int>(grantedAt);
    if (!nullToAbsent || withdrawnAt != null) {
      map['withdrawn_at'] = Variable<int>(withdrawnAt);
    }
    return map;
  }

  ConsentRecordCompanion toCompanion(bool nullToAbsent) {
    return ConsentRecordCompanion(
      id: Value(id),
      kind: Value(kind),
      subjectPerson: subjectPerson == null && nullToAbsent ? const Value.absent() : Value(subjectPerson),
      textVersion: Value(textVersion),
      grantedAt: Value(grantedAt),
      withdrawnAt: withdrawnAt == null && nullToAbsent ? const Value.absent() : Value(withdrawnAt),
    );
  }

  factory ConsentRecordData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConsentRecordData(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      subjectPerson: serializer.fromJson<String?>(json['subject_person']),
      textVersion: serializer.fromJson<String>(json['text_version']),
      grantedAt: serializer.fromJson<int>(json['granted_at']),
      withdrawnAt: serializer.fromJson<int?>(json['withdrawn_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'subject_person': serializer.toJson<String?>(subjectPerson),
      'text_version': serializer.toJson<String>(textVersion),
      'granted_at': serializer.toJson<int>(grantedAt),
      'withdrawn_at': serializer.toJson<int?>(withdrawnAt),
    };
  }

  ConsentRecordData copyWith({
    String? id,
    String? kind,
    Value<String?> subjectPerson = const Value.absent(),
    String? textVersion,
    int? grantedAt,
    Value<int?> withdrawnAt = const Value.absent(),
  }) => ConsentRecordData(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    subjectPerson: subjectPerson.present ? subjectPerson.value : this.subjectPerson,
    textVersion: textVersion ?? this.textVersion,
    grantedAt: grantedAt ?? this.grantedAt,
    withdrawnAt: withdrawnAt.present ? withdrawnAt.value : this.withdrawnAt,
  );
  ConsentRecordData copyWithCompanion(ConsentRecordCompanion data) {
    return ConsentRecordData(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      subjectPerson: data.subjectPerson.present ? data.subjectPerson.value : this.subjectPerson,
      textVersion: data.textVersion.present ? data.textVersion.value : this.textVersion,
      grantedAt: data.grantedAt.present ? data.grantedAt.value : this.grantedAt,
      withdrawnAt: data.withdrawnAt.present ? data.withdrawnAt.value : this.withdrawnAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConsentRecordData(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('subjectPerson: $subjectPerson, ')
          ..write('textVersion: $textVersion, ')
          ..write('grantedAt: $grantedAt, ')
          ..write('withdrawnAt: $withdrawnAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, kind, subjectPerson, textVersion, grantedAt, withdrawnAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConsentRecordData &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.subjectPerson == this.subjectPerson &&
          other.textVersion == this.textVersion &&
          other.grantedAt == this.grantedAt &&
          other.withdrawnAt == this.withdrawnAt);
}

class ConsentRecordCompanion extends UpdateCompanion<ConsentRecordData> {
  final Value<String> id;
  final Value<String> kind;
  final Value<String?> subjectPerson;
  final Value<String> textVersion;
  final Value<int> grantedAt;
  final Value<int?> withdrawnAt;
  final Value<int> rowid;
  const ConsentRecordCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.subjectPerson = const Value.absent(),
    this.textVersion = const Value.absent(),
    this.grantedAt = const Value.absent(),
    this.withdrawnAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConsentRecordCompanion.insert({
    required String id,
    required String kind,
    this.subjectPerson = const Value.absent(),
    required String textVersion,
    required int grantedAt,
    this.withdrawnAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       textVersion = Value(textVersion),
       grantedAt = Value(grantedAt);
  static Insertable<ConsentRecordData> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<String>? subjectPerson,
    Expression<String>? textVersion,
    Expression<int>? grantedAt,
    Expression<int>? withdrawnAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (subjectPerson != null) 'subject_person': subjectPerson,
      if (textVersion != null) 'text_version': textVersion,
      if (grantedAt != null) 'granted_at': grantedAt,
      if (withdrawnAt != null) 'withdrawn_at': withdrawnAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConsentRecordCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<String?>? subjectPerson,
    Value<String>? textVersion,
    Value<int>? grantedAt,
    Value<int?>? withdrawnAt,
    Value<int>? rowid,
  }) {
    return ConsentRecordCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      subjectPerson: subjectPerson ?? this.subjectPerson,
      textVersion: textVersion ?? this.textVersion,
      grantedAt: grantedAt ?? this.grantedAt,
      withdrawnAt: withdrawnAt ?? this.withdrawnAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (subjectPerson.present) {
      map['subject_person'] = Variable<String>(subjectPerson.value);
    }
    if (textVersion.present) {
      map['text_version'] = Variable<String>(textVersion.value);
    }
    if (grantedAt.present) {
      map['granted_at'] = Variable<int>(grantedAt.value);
    }
    if (withdrawnAt.present) {
      map['withdrawn_at'] = Variable<int>(withdrawnAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsentRecordCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('subjectPerson: $subjectPerson, ')
          ..write('textVersion: $textVersion, ')
          ..write('grantedAt: $grantedAt, ')
          ..write('withdrawnAt: $withdrawnAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class VoiceSignature extends Table with TableInfo<VoiceSignature, VoiceSignatureData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VoiceSignature(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _isSelfMeta = const VerificationMeta('isSelf');
  late final GeneratedColumn<int> isSelf = GeneratedColumn<int>(
    'is_self',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta('personId');
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES person(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _modelIdMeta = const VerificationMeta('modelId');
  late final GeneratedColumn<String> modelId = GeneratedColumn<String>(
    'model_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _embeddingMeta = const VerificationMeta('embedding');
  late final GeneratedColumn<Uint8List> embedding = GeneratedColumn<Uint8List>(
    'embedding',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _consentRecordIdMeta = const VerificationMeta('consentRecordId');
  late final GeneratedColumn<String> consentRecordId = GeneratedColumn<String>(
    'consent_record_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES consent_record(id)',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, isSelf, personId, modelId, embedding, consentRecordId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'voice_signature';
  @override
  VerificationContext validateIntegrity(Insertable<VoiceSignatureData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('is_self')) {
      context.handle(_isSelfMeta, isSelf.isAcceptableOrUnknown(data['is_self']!, _isSelfMeta));
    } else if (isInserting) {
      context.missing(_isSelfMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(_personIdMeta, personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta));
    }
    if (data.containsKey('model_id')) {
      context.handle(_modelIdMeta, modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta));
    } else if (isInserting) {
      context.missing(_modelIdMeta);
    }
    if (data.containsKey('embedding')) {
      context.handle(_embeddingMeta, embedding.isAcceptableOrUnknown(data['embedding']!, _embeddingMeta));
    } else if (isInserting) {
      context.missing(_embeddingMeta);
    }
    if (data.containsKey('consent_record_id')) {
      context.handle(
        _consentRecordIdMeta,
        consentRecordId.isAcceptableOrUnknown(data['consent_record_id']!, _consentRecordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_consentRecordIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VoiceSignatureData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VoiceSignatureData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      isSelf: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}is_self'])!,
      personId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}person_id']),
      modelId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}model_id'])!,
      embedding: attachedDatabase.typeMapping.read(DriftSqlType.blob, data['${effectivePrefix}embedding'])!,
      consentRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}consent_record_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  VoiceSignature createAlias(String alias) {
    return VoiceSignature(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class VoiceSignatureData extends DataClass implements Insertable<VoiceSignatureData> {
  final String id;
  final int isSelf;
  final String? personId;
  final String modelId;

  /// embedding model and version
  final Uint8List embedding;
  final String consentRecordId;

  /// I6
  final int createdAt;
  const VoiceSignatureData({
    required this.id,
    required this.isSelf,
    this.personId,
    required this.modelId,
    required this.embedding,
    required this.consentRecordId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['is_self'] = Variable<int>(isSelf);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    map['model_id'] = Variable<String>(modelId);
    map['embedding'] = Variable<Uint8List>(embedding);
    map['consent_record_id'] = Variable<String>(consentRecordId);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  VoiceSignatureCompanion toCompanion(bool nullToAbsent) {
    return VoiceSignatureCompanion(
      id: Value(id),
      isSelf: Value(isSelf),
      personId: personId == null && nullToAbsent ? const Value.absent() : Value(personId),
      modelId: Value(modelId),
      embedding: Value(embedding),
      consentRecordId: Value(consentRecordId),
      createdAt: Value(createdAt),
    );
  }

  factory VoiceSignatureData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VoiceSignatureData(
      id: serializer.fromJson<String>(json['id']),
      isSelf: serializer.fromJson<int>(json['is_self']),
      personId: serializer.fromJson<String?>(json['person_id']),
      modelId: serializer.fromJson<String>(json['model_id']),
      embedding: serializer.fromJson<Uint8List>(json['embedding']),
      consentRecordId: serializer.fromJson<String>(json['consent_record_id']),
      createdAt: serializer.fromJson<int>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'is_self': serializer.toJson<int>(isSelf),
      'person_id': serializer.toJson<String?>(personId),
      'model_id': serializer.toJson<String>(modelId),
      'embedding': serializer.toJson<Uint8List>(embedding),
      'consent_record_id': serializer.toJson<String>(consentRecordId),
      'created_at': serializer.toJson<int>(createdAt),
    };
  }

  VoiceSignatureData copyWith({
    String? id,
    int? isSelf,
    Value<String?> personId = const Value.absent(),
    String? modelId,
    Uint8List? embedding,
    String? consentRecordId,
    int? createdAt,
  }) => VoiceSignatureData(
    id: id ?? this.id,
    isSelf: isSelf ?? this.isSelf,
    personId: personId.present ? personId.value : this.personId,
    modelId: modelId ?? this.modelId,
    embedding: embedding ?? this.embedding,
    consentRecordId: consentRecordId ?? this.consentRecordId,
    createdAt: createdAt ?? this.createdAt,
  );
  VoiceSignatureData copyWithCompanion(VoiceSignatureCompanion data) {
    return VoiceSignatureData(
      id: data.id.present ? data.id.value : this.id,
      isSelf: data.isSelf.present ? data.isSelf.value : this.isSelf,
      personId: data.personId.present ? data.personId.value : this.personId,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
      embedding: data.embedding.present ? data.embedding.value : this.embedding,
      consentRecordId: data.consentRecordId.present ? data.consentRecordId.value : this.consentRecordId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VoiceSignatureData(')
          ..write('id: $id, ')
          ..write('isSelf: $isSelf, ')
          ..write('personId: $personId, ')
          ..write('modelId: $modelId, ')
          ..write('embedding: $embedding, ')
          ..write('consentRecordId: $consentRecordId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, isSelf, personId, modelId, $driftBlobEquality.hash(embedding), consentRecordId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VoiceSignatureData &&
          other.id == this.id &&
          other.isSelf == this.isSelf &&
          other.personId == this.personId &&
          other.modelId == this.modelId &&
          $driftBlobEquality.equals(other.embedding, this.embedding) &&
          other.consentRecordId == this.consentRecordId &&
          other.createdAt == this.createdAt);
}

class VoiceSignatureCompanion extends UpdateCompanion<VoiceSignatureData> {
  final Value<String> id;
  final Value<int> isSelf;
  final Value<String?> personId;
  final Value<String> modelId;
  final Value<Uint8List> embedding;
  final Value<String> consentRecordId;
  final Value<int> createdAt;
  final Value<int> rowid;
  const VoiceSignatureCompanion({
    this.id = const Value.absent(),
    this.isSelf = const Value.absent(),
    this.personId = const Value.absent(),
    this.modelId = const Value.absent(),
    this.embedding = const Value.absent(),
    this.consentRecordId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VoiceSignatureCompanion.insert({
    required String id,
    required int isSelf,
    this.personId = const Value.absent(),
    required String modelId,
    required Uint8List embedding,
    required String consentRecordId,
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       isSelf = Value(isSelf),
       modelId = Value(modelId),
       embedding = Value(embedding),
       consentRecordId = Value(consentRecordId),
       createdAt = Value(createdAt);
  static Insertable<VoiceSignatureData> custom({
    Expression<String>? id,
    Expression<int>? isSelf,
    Expression<String>? personId,
    Expression<String>? modelId,
    Expression<Uint8List>? embedding,
    Expression<String>? consentRecordId,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isSelf != null) 'is_self': isSelf,
      if (personId != null) 'person_id': personId,
      if (modelId != null) 'model_id': modelId,
      if (embedding != null) 'embedding': embedding,
      if (consentRecordId != null) 'consent_record_id': consentRecordId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VoiceSignatureCompanion copyWith({
    Value<String>? id,
    Value<int>? isSelf,
    Value<String?>? personId,
    Value<String>? modelId,
    Value<Uint8List>? embedding,
    Value<String>? consentRecordId,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return VoiceSignatureCompanion(
      id: id ?? this.id,
      isSelf: isSelf ?? this.isSelf,
      personId: personId ?? this.personId,
      modelId: modelId ?? this.modelId,
      embedding: embedding ?? this.embedding,
      consentRecordId: consentRecordId ?? this.consentRecordId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (isSelf.present) {
      map['is_self'] = Variable<int>(isSelf.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<String>(modelId.value);
    }
    if (embedding.present) {
      map['embedding'] = Variable<Uint8List>(embedding.value);
    }
    if (consentRecordId.present) {
      map['consent_record_id'] = Variable<String>(consentRecordId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VoiceSignatureCompanion(')
          ..write('id: $id, ')
          ..write('isSelf: $isSelf, ')
          ..write('personId: $personId, ')
          ..write('modelId: $modelId, ')
          ..write('embedding: $embedding, ')
          ..write('consentRecordId: $consentRecordId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Moment extends Table with TableInfo<Moment, MomentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Moment(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES session(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'open\' CHECK (state IN (\'open\', \'closed\'))',
    defaultValue: const CustomExpression('\'open\''),
  );
  static const VerificationMeta _startMsMeta = const VerificationMeta('startMs');
  late final GeneratedColumn<int> startMs = GeneratedColumn<int>(
    'start_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _endMsMeta = const VerificationMeta('endMs');
  late final GeneratedColumn<int> endMs = GeneratedColumn<int>(
    'end_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _tzMeta = const VerificationMeta('tz');
  late final GeneratedColumn<String> tz = GeneratedColumn<String>(
    'tz',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _sceneHintMeta = const VerificationMeta('sceneHint');
  late final GeneratedColumn<String> sceneHint = GeneratedColumn<String>(
    'scene_hint',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'CHECK (scene_hint IN (\'meeting\', \'commute\', \'solo\'))',
  );
  static const VerificationMeta _sceneLabelMeta = const VerificationMeta('sceneLabel');
  late final GeneratedColumn<String> sceneLabel = GeneratedColumn<String>(
    'scene_label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _labelConfidenceMeta = const VerificationMeta('labelConfidence');
  late final GeneratedColumn<double> labelConfidence = GeneratedColumn<double>(
    'label_confidence',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _labelByUserMeta = const VerificationMeta('labelByUser');
  late final GeneratedColumn<int> labelByUser = GeneratedColumn<int>(
    'label_by_user',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta('summary');
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _toneMeta = const VerificationMeta('tone');
  late final GeneratedColumn<String> tone = GeneratedColumn<String>(
    'tone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'CHECK (tone IN (\'neutral\', \'positive\', \'negative\', \'conflict\'))',
  );
  static const VerificationMeta _flaggedMeta = const VerificationMeta('flagged');
  late final GeneratedColumn<int> flagged = GeneratedColumn<int>(
    'flagged',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _excludedReasonMeta = const VerificationMeta('excludedReason');
  late final GeneratedColumn<String> excludedReason = GeneratedColumn<String>(
    'excluded_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _retentionModeMeta = const VerificationMeta('retentionMode');
  late final GeneratedColumn<String> retentionMode = GeneratedColumn<String>(
    'retention_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'full\' CHECK (retention_mode IN (\'full\', \'summary_only\'))',
    defaultValue: const CustomExpression('\'full\''),
  );
  static const VerificationMeta _analysisStatusMeta = const VerificationMeta('analysisStatus');
  late final GeneratedColumn<String> analysisStatus = GeneratedColumn<String>(
    'analysis_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'pending\' CHECK (analysis_status IN (\'pending\', \'running\', \'done\', \'failed\', \'skipped\'))',
    defaultValue: const CustomExpression('\'pending\''),
  );
  static const VerificationMeta _analyzerVersionMeta = const VerificationMeta('analyzerVersion');
  late final GeneratedColumn<String> analyzerVersion = GeneratedColumn<String>(
    'analyzer_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    state,
    startMs,
    endMs,
    tz,
    sceneHint,
    sceneLabel,
    labelConfidence,
    labelByUser,
    title,
    summary,
    tone,
    flagged,
    excludedReason,
    retentionMode,
    analysisStatus,
    analyzerVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment';
  @override
  VerificationContext validateIntegrity(Insertable<MomentData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta, sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('state')) {
      context.handle(_stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('start_ms')) {
      context.handle(_startMsMeta, startMs.isAcceptableOrUnknown(data['start_ms']!, _startMsMeta));
    } else if (isInserting) {
      context.missing(_startMsMeta);
    }
    if (data.containsKey('end_ms')) {
      context.handle(_endMsMeta, endMs.isAcceptableOrUnknown(data['end_ms']!, _endMsMeta));
    }
    if (data.containsKey('tz')) {
      context.handle(_tzMeta, tz.isAcceptableOrUnknown(data['tz']!, _tzMeta));
    } else if (isInserting) {
      context.missing(_tzMeta);
    }
    if (data.containsKey('scene_hint')) {
      context.handle(_sceneHintMeta, sceneHint.isAcceptableOrUnknown(data['scene_hint']!, _sceneHintMeta));
    }
    if (data.containsKey('scene_label')) {
      context.handle(_sceneLabelMeta, sceneLabel.isAcceptableOrUnknown(data['scene_label']!, _sceneLabelMeta));
    }
    if (data.containsKey('label_confidence')) {
      context.handle(
        _labelConfidenceMeta,
        labelConfidence.isAcceptableOrUnknown(data['label_confidence']!, _labelConfidenceMeta),
      );
    }
    if (data.containsKey('label_by_user')) {
      context.handle(_labelByUserMeta, labelByUser.isAcceptableOrUnknown(data['label_by_user']!, _labelByUserMeta));
    }
    if (data.containsKey('title')) {
      context.handle(_titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta, summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    }
    if (data.containsKey('tone')) {
      context.handle(_toneMeta, tone.isAcceptableOrUnknown(data['tone']!, _toneMeta));
    }
    if (data.containsKey('flagged')) {
      context.handle(_flaggedMeta, flagged.isAcceptableOrUnknown(data['flagged']!, _flaggedMeta));
    }
    if (data.containsKey('excluded_reason')) {
      context.handle(
        _excludedReasonMeta,
        excludedReason.isAcceptableOrUnknown(data['excluded_reason']!, _excludedReasonMeta),
      );
    }
    if (data.containsKey('retention_mode')) {
      context.handle(
        _retentionModeMeta,
        retentionMode.isAcceptableOrUnknown(data['retention_mode']!, _retentionModeMeta),
      );
    }
    if (data.containsKey('analysis_status')) {
      context.handle(
        _analysisStatusMeta,
        analysisStatus.isAcceptableOrUnknown(data['analysis_status']!, _analysisStatusMeta),
      );
    }
    if (data.containsKey('analyzer_version')) {
      context.handle(
        _analyzerVersionMeta,
        analyzerVersion.isAcceptableOrUnknown(data['analyzer_version']!, _analyzerVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MomentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      state: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      startMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}start_ms'])!,
      endMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}end_ms']),
      tz: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}tz'])!,
      sceneHint: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}scene_hint']),
      sceneLabel: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}scene_label']),
      labelConfidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}label_confidence'],
      ),
      labelByUser: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}label_by_user'])!,
      title: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}title']),
      summary: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}summary']),
      tone: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}tone']),
      flagged: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}flagged'])!,
      excludedReason: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}excluded_reason']),
      retentionMode: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}retention_mode'])!,
      analysisStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}analysis_status'],
      )!,
      analyzerVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}analyzer_version'],
      ),
    );
  }

  @override
  Moment createAlias(String alias) {
    return Moment(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MomentData extends DataClass implements Insertable<MomentData> {
  final String id;
  final String sessionId;
  final String state;
  final int startMs;
  final int? endMs;

  /// null while open
  final String tz;

  /// zone at the moment's start (Trip crosses zones in Phase 2)
  final String? sceneHint;

  /// on-device (§8.2)
  final String? sceneLabel;
  final double? labelConfidence;
  final int labelByUser;
  final String? title;
  final String? summary;

  /// with {{spk:id}} / {{per:id}} placeholders
  final String? tone;
  final int flagged;
  final String? excludedReason;

  /// too_short | scene_excluded | analysis_disabled
  final String retentionMode;
  final String analysisStatus;
  final String? analyzerVersion;
  const MomentData({
    required this.id,
    required this.sessionId,
    required this.state,
    required this.startMs,
    this.endMs,
    required this.tz,
    this.sceneHint,
    this.sceneLabel,
    this.labelConfidence,
    required this.labelByUser,
    this.title,
    this.summary,
    this.tone,
    required this.flagged,
    this.excludedReason,
    required this.retentionMode,
    required this.analysisStatus,
    this.analyzerVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['state'] = Variable<String>(state);
    map['start_ms'] = Variable<int>(startMs);
    if (!nullToAbsent || endMs != null) {
      map['end_ms'] = Variable<int>(endMs);
    }
    map['tz'] = Variable<String>(tz);
    if (!nullToAbsent || sceneHint != null) {
      map['scene_hint'] = Variable<String>(sceneHint);
    }
    if (!nullToAbsent || sceneLabel != null) {
      map['scene_label'] = Variable<String>(sceneLabel);
    }
    if (!nullToAbsent || labelConfidence != null) {
      map['label_confidence'] = Variable<double>(labelConfidence);
    }
    map['label_by_user'] = Variable<int>(labelByUser);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || tone != null) {
      map['tone'] = Variable<String>(tone);
    }
    map['flagged'] = Variable<int>(flagged);
    if (!nullToAbsent || excludedReason != null) {
      map['excluded_reason'] = Variable<String>(excludedReason);
    }
    map['retention_mode'] = Variable<String>(retentionMode);
    map['analysis_status'] = Variable<String>(analysisStatus);
    if (!nullToAbsent || analyzerVersion != null) {
      map['analyzer_version'] = Variable<String>(analyzerVersion);
    }
    return map;
  }

  MomentCompanion toCompanion(bool nullToAbsent) {
    return MomentCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      state: Value(state),
      startMs: Value(startMs),
      endMs: endMs == null && nullToAbsent ? const Value.absent() : Value(endMs),
      tz: Value(tz),
      sceneHint: sceneHint == null && nullToAbsent ? const Value.absent() : Value(sceneHint),
      sceneLabel: sceneLabel == null && nullToAbsent ? const Value.absent() : Value(sceneLabel),
      labelConfidence: labelConfidence == null && nullToAbsent ? const Value.absent() : Value(labelConfidence),
      labelByUser: Value(labelByUser),
      title: title == null && nullToAbsent ? const Value.absent() : Value(title),
      summary: summary == null && nullToAbsent ? const Value.absent() : Value(summary),
      tone: tone == null && nullToAbsent ? const Value.absent() : Value(tone),
      flagged: Value(flagged),
      excludedReason: excludedReason == null && nullToAbsent ? const Value.absent() : Value(excludedReason),
      retentionMode: Value(retentionMode),
      analysisStatus: Value(analysisStatus),
      analyzerVersion: analyzerVersion == null && nullToAbsent ? const Value.absent() : Value(analyzerVersion),
    );
  }

  factory MomentData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentData(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['session_id']),
      state: serializer.fromJson<String>(json['state']),
      startMs: serializer.fromJson<int>(json['start_ms']),
      endMs: serializer.fromJson<int?>(json['end_ms']),
      tz: serializer.fromJson<String>(json['tz']),
      sceneHint: serializer.fromJson<String?>(json['scene_hint']),
      sceneLabel: serializer.fromJson<String?>(json['scene_label']),
      labelConfidence: serializer.fromJson<double?>(json['label_confidence']),
      labelByUser: serializer.fromJson<int>(json['label_by_user']),
      title: serializer.fromJson<String?>(json['title']),
      summary: serializer.fromJson<String?>(json['summary']),
      tone: serializer.fromJson<String?>(json['tone']),
      flagged: serializer.fromJson<int>(json['flagged']),
      excludedReason: serializer.fromJson<String?>(json['excluded_reason']),
      retentionMode: serializer.fromJson<String>(json['retention_mode']),
      analysisStatus: serializer.fromJson<String>(json['analysis_status']),
      analyzerVersion: serializer.fromJson<String?>(json['analyzer_version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'session_id': serializer.toJson<String>(sessionId),
      'state': serializer.toJson<String>(state),
      'start_ms': serializer.toJson<int>(startMs),
      'end_ms': serializer.toJson<int?>(endMs),
      'tz': serializer.toJson<String>(tz),
      'scene_hint': serializer.toJson<String?>(sceneHint),
      'scene_label': serializer.toJson<String?>(sceneLabel),
      'label_confidence': serializer.toJson<double?>(labelConfidence),
      'label_by_user': serializer.toJson<int>(labelByUser),
      'title': serializer.toJson<String?>(title),
      'summary': serializer.toJson<String?>(summary),
      'tone': serializer.toJson<String?>(tone),
      'flagged': serializer.toJson<int>(flagged),
      'excluded_reason': serializer.toJson<String?>(excludedReason),
      'retention_mode': serializer.toJson<String>(retentionMode),
      'analysis_status': serializer.toJson<String>(analysisStatus),
      'analyzer_version': serializer.toJson<String?>(analyzerVersion),
    };
  }

  MomentData copyWith({
    String? id,
    String? sessionId,
    String? state,
    int? startMs,
    Value<int?> endMs = const Value.absent(),
    String? tz,
    Value<String?> sceneHint = const Value.absent(),
    Value<String?> sceneLabel = const Value.absent(),
    Value<double?> labelConfidence = const Value.absent(),
    int? labelByUser,
    Value<String?> title = const Value.absent(),
    Value<String?> summary = const Value.absent(),
    Value<String?> tone = const Value.absent(),
    int? flagged,
    Value<String?> excludedReason = const Value.absent(),
    String? retentionMode,
    String? analysisStatus,
    Value<String?> analyzerVersion = const Value.absent(),
  }) => MomentData(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    state: state ?? this.state,
    startMs: startMs ?? this.startMs,
    endMs: endMs.present ? endMs.value : this.endMs,
    tz: tz ?? this.tz,
    sceneHint: sceneHint.present ? sceneHint.value : this.sceneHint,
    sceneLabel: sceneLabel.present ? sceneLabel.value : this.sceneLabel,
    labelConfidence: labelConfidence.present ? labelConfidence.value : this.labelConfidence,
    labelByUser: labelByUser ?? this.labelByUser,
    title: title.present ? title.value : this.title,
    summary: summary.present ? summary.value : this.summary,
    tone: tone.present ? tone.value : this.tone,
    flagged: flagged ?? this.flagged,
    excludedReason: excludedReason.present ? excludedReason.value : this.excludedReason,
    retentionMode: retentionMode ?? this.retentionMode,
    analysisStatus: analysisStatus ?? this.analysisStatus,
    analyzerVersion: analyzerVersion.present ? analyzerVersion.value : this.analyzerVersion,
  );
  MomentData copyWithCompanion(MomentCompanion data) {
    return MomentData(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      state: data.state.present ? data.state.value : this.state,
      startMs: data.startMs.present ? data.startMs.value : this.startMs,
      endMs: data.endMs.present ? data.endMs.value : this.endMs,
      tz: data.tz.present ? data.tz.value : this.tz,
      sceneHint: data.sceneHint.present ? data.sceneHint.value : this.sceneHint,
      sceneLabel: data.sceneLabel.present ? data.sceneLabel.value : this.sceneLabel,
      labelConfidence: data.labelConfidence.present ? data.labelConfidence.value : this.labelConfidence,
      labelByUser: data.labelByUser.present ? data.labelByUser.value : this.labelByUser,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      tone: data.tone.present ? data.tone.value : this.tone,
      flagged: data.flagged.present ? data.flagged.value : this.flagged,
      excludedReason: data.excludedReason.present ? data.excludedReason.value : this.excludedReason,
      retentionMode: data.retentionMode.present ? data.retentionMode.value : this.retentionMode,
      analysisStatus: data.analysisStatus.present ? data.analysisStatus.value : this.analysisStatus,
      analyzerVersion: data.analyzerVersion.present ? data.analyzerVersion.value : this.analyzerVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('state: $state, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('tz: $tz, ')
          ..write('sceneHint: $sceneHint, ')
          ..write('sceneLabel: $sceneLabel, ')
          ..write('labelConfidence: $labelConfidence, ')
          ..write('labelByUser: $labelByUser, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('tone: $tone, ')
          ..write('flagged: $flagged, ')
          ..write('excludedReason: $excludedReason, ')
          ..write('retentionMode: $retentionMode, ')
          ..write('analysisStatus: $analysisStatus, ')
          ..write('analyzerVersion: $analyzerVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    state,
    startMs,
    endMs,
    tz,
    sceneHint,
    sceneLabel,
    labelConfidence,
    labelByUser,
    title,
    summary,
    tone,
    flagged,
    excludedReason,
    retentionMode,
    analysisStatus,
    analyzerVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.state == this.state &&
          other.startMs == this.startMs &&
          other.endMs == this.endMs &&
          other.tz == this.tz &&
          other.sceneHint == this.sceneHint &&
          other.sceneLabel == this.sceneLabel &&
          other.labelConfidence == this.labelConfidence &&
          other.labelByUser == this.labelByUser &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.tone == this.tone &&
          other.flagged == this.flagged &&
          other.excludedReason == this.excludedReason &&
          other.retentionMode == this.retentionMode &&
          other.analysisStatus == this.analysisStatus &&
          other.analyzerVersion == this.analyzerVersion);
}

class MomentCompanion extends UpdateCompanion<MomentData> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> state;
  final Value<int> startMs;
  final Value<int?> endMs;
  final Value<String> tz;
  final Value<String?> sceneHint;
  final Value<String?> sceneLabel;
  final Value<double?> labelConfidence;
  final Value<int> labelByUser;
  final Value<String?> title;
  final Value<String?> summary;
  final Value<String?> tone;
  final Value<int> flagged;
  final Value<String?> excludedReason;
  final Value<String> retentionMode;
  final Value<String> analysisStatus;
  final Value<String?> analyzerVersion;
  final Value<int> rowid;
  const MomentCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.state = const Value.absent(),
    this.startMs = const Value.absent(),
    this.endMs = const Value.absent(),
    this.tz = const Value.absent(),
    this.sceneHint = const Value.absent(),
    this.sceneLabel = const Value.absent(),
    this.labelConfidence = const Value.absent(),
    this.labelByUser = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.tone = const Value.absent(),
    this.flagged = const Value.absent(),
    this.excludedReason = const Value.absent(),
    this.retentionMode = const Value.absent(),
    this.analysisStatus = const Value.absent(),
    this.analyzerVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentCompanion.insert({
    required String id,
    required String sessionId,
    this.state = const Value.absent(),
    required int startMs,
    this.endMs = const Value.absent(),
    required String tz,
    this.sceneHint = const Value.absent(),
    this.sceneLabel = const Value.absent(),
    this.labelConfidence = const Value.absent(),
    this.labelByUser = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.tone = const Value.absent(),
    this.flagged = const Value.absent(),
    this.excludedReason = const Value.absent(),
    this.retentionMode = const Value.absent(),
    this.analysisStatus = const Value.absent(),
    this.analyzerVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       startMs = Value(startMs),
       tz = Value(tz);
  static Insertable<MomentData> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? state,
    Expression<int>? startMs,
    Expression<int>? endMs,
    Expression<String>? tz,
    Expression<String>? sceneHint,
    Expression<String>? sceneLabel,
    Expression<double>? labelConfidence,
    Expression<int>? labelByUser,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<String>? tone,
    Expression<int>? flagged,
    Expression<String>? excludedReason,
    Expression<String>? retentionMode,
    Expression<String>? analysisStatus,
    Expression<String>? analyzerVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (state != null) 'state': state,
      if (startMs != null) 'start_ms': startMs,
      if (endMs != null) 'end_ms': endMs,
      if (tz != null) 'tz': tz,
      if (sceneHint != null) 'scene_hint': sceneHint,
      if (sceneLabel != null) 'scene_label': sceneLabel,
      if (labelConfidence != null) 'label_confidence': labelConfidence,
      if (labelByUser != null) 'label_by_user': labelByUser,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (tone != null) 'tone': tone,
      if (flagged != null) 'flagged': flagged,
      if (excludedReason != null) 'excluded_reason': excludedReason,
      if (retentionMode != null) 'retention_mode': retentionMode,
      if (analysisStatus != null) 'analysis_status': analysisStatus,
      if (analyzerVersion != null) 'analyzer_version': analyzerVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String>? state,
    Value<int>? startMs,
    Value<int?>? endMs,
    Value<String>? tz,
    Value<String?>? sceneHint,
    Value<String?>? sceneLabel,
    Value<double?>? labelConfidence,
    Value<int>? labelByUser,
    Value<String?>? title,
    Value<String?>? summary,
    Value<String?>? tone,
    Value<int>? flagged,
    Value<String?>? excludedReason,
    Value<String>? retentionMode,
    Value<String>? analysisStatus,
    Value<String?>? analyzerVersion,
    Value<int>? rowid,
  }) {
    return MomentCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      state: state ?? this.state,
      startMs: startMs ?? this.startMs,
      endMs: endMs ?? this.endMs,
      tz: tz ?? this.tz,
      sceneHint: sceneHint ?? this.sceneHint,
      sceneLabel: sceneLabel ?? this.sceneLabel,
      labelConfidence: labelConfidence ?? this.labelConfidence,
      labelByUser: labelByUser ?? this.labelByUser,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      tone: tone ?? this.tone,
      flagged: flagged ?? this.flagged,
      excludedReason: excludedReason ?? this.excludedReason,
      retentionMode: retentionMode ?? this.retentionMode,
      analysisStatus: analysisStatus ?? this.analysisStatus,
      analyzerVersion: analyzerVersion ?? this.analyzerVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (startMs.present) {
      map['start_ms'] = Variable<int>(startMs.value);
    }
    if (endMs.present) {
      map['end_ms'] = Variable<int>(endMs.value);
    }
    if (tz.present) {
      map['tz'] = Variable<String>(tz.value);
    }
    if (sceneHint.present) {
      map['scene_hint'] = Variable<String>(sceneHint.value);
    }
    if (sceneLabel.present) {
      map['scene_label'] = Variable<String>(sceneLabel.value);
    }
    if (labelConfidence.present) {
      map['label_confidence'] = Variable<double>(labelConfidence.value);
    }
    if (labelByUser.present) {
      map['label_by_user'] = Variable<int>(labelByUser.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (tone.present) {
      map['tone'] = Variable<String>(tone.value);
    }
    if (flagged.present) {
      map['flagged'] = Variable<int>(flagged.value);
    }
    if (excludedReason.present) {
      map['excluded_reason'] = Variable<String>(excludedReason.value);
    }
    if (retentionMode.present) {
      map['retention_mode'] = Variable<String>(retentionMode.value);
    }
    if (analysisStatus.present) {
      map['analysis_status'] = Variable<String>(analysisStatus.value);
    }
    if (analyzerVersion.present) {
      map['analyzer_version'] = Variable<String>(analyzerVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('state: $state, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('tz: $tz, ')
          ..write('sceneHint: $sceneHint, ')
          ..write('sceneLabel: $sceneLabel, ')
          ..write('labelConfidence: $labelConfidence, ')
          ..write('labelByUser: $labelByUser, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('tone: $tone, ')
          ..write('flagged: $flagged, ')
          ..write('excludedReason: $excludedReason, ')
          ..write('retentionMode: $retentionMode, ')
          ..write('analysisStatus: $analysisStatus, ')
          ..write('analyzerVersion: $analyzerVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Utterance extends Table with TableInfo<Utterance, UtteranceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Utterance(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seqMeta = const VerificationMeta('seq');
  late final GeneratedColumn<int> seq = GeneratedColumn<int>(
    'seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY',
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES session(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _momentIdMeta = const VerificationMeta('momentId');
  late final GeneratedColumn<String> momentId = GeneratedColumn<String>(
    'moment_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES moment(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _speakerIdMeta = const VerificationMeta('speakerId');
  late final GeneratedColumn<String> speakerId = GeneratedColumn<String>(
    'speaker_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES speaker(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _speakerLockedMeta = const VerificationMeta('speakerLocked');
  late final GeneratedColumn<int> speakerLocked = GeneratedColumn<int>(
    'speaker_locked',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _startMsMeta = const VerificationMeta('startMs');
  late final GeneratedColumn<int> startMs = GeneratedColumn<int>(
    'start_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _endMsMeta = const VerificationMeta('endMs');
  late final GeneratedColumn<int> endMs = GeneratedColumn<int>(
    'end_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _text$Meta = const VerificationMeta('text\$');
  late final GeneratedColumn<String> text$ = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _textLiveMeta = const VerificationMeta('textLive');
  late final GeneratedColumn<String> textLive = GeneratedColumn<String>(
    'text_live',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _langMeta = const VerificationMeta('lang');
  late final GeneratedColumn<String> lang = GeneratedColumn<String>(
    'lang',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _asrConfidenceMeta = const VerificationMeta('asrConfidence');
  late final GeneratedColumn<double> asrConfidence = GeneratedColumn<double>(
    'asr_confidence',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _speakerConfidenceMeta = const VerificationMeta('speakerConfidence');
  late final GeneratedColumn<double> speakerConfidence = GeneratedColumn<double>(
    'speaker_confidence',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _passMeta = const VerificationMeta('pass');
  late final GeneratedColumn<int> pass = GeneratedColumn<int>(
    'pass',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  static const VerificationMeta _translationMeta = const VerificationMeta('translation');
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
    'translation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _translationLangMeta = const VerificationMeta('translationLang');
  late final GeneratedColumn<String> translationLang = GeneratedColumn<String>(
    'translation_lang',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    seq,
    id,
    sessionId,
    momentId,
    speakerId,
    speakerLocked,
    startMs,
    endMs,
    text$,
    textLive,
    lang,
    asrConfidence,
    speakerConfidence,
    pass,
    translation,
    translationLang,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'utterance';
  @override
  VerificationContext validateIntegrity(Insertable<UtteranceData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('seq')) {
      context.handle(_seqMeta, seq.isAcceptableOrUnknown(data['seq']!, _seqMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta, sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('moment_id')) {
      context.handle(_momentIdMeta, momentId.isAcceptableOrUnknown(data['moment_id']!, _momentIdMeta));
    }
    if (data.containsKey('speaker_id')) {
      context.handle(_speakerIdMeta, speakerId.isAcceptableOrUnknown(data['speaker_id']!, _speakerIdMeta));
    }
    if (data.containsKey('speaker_locked')) {
      context.handle(
        _speakerLockedMeta,
        speakerLocked.isAcceptableOrUnknown(data['speaker_locked']!, _speakerLockedMeta),
      );
    }
    if (data.containsKey('start_ms')) {
      context.handle(_startMsMeta, startMs.isAcceptableOrUnknown(data['start_ms']!, _startMsMeta));
    } else if (isInserting) {
      context.missing(_startMsMeta);
    }
    if (data.containsKey('end_ms')) {
      context.handle(_endMsMeta, endMs.isAcceptableOrUnknown(data['end_ms']!, _endMsMeta));
    } else if (isInserting) {
      context.missing(_endMsMeta);
    }
    if (data.containsKey('text')) {
      context.handle(_text$Meta, text$.isAcceptableOrUnknown(data['text']!, _text$Meta));
    } else if (isInserting) {
      context.missing(_text$Meta);
    }
    if (data.containsKey('text_live')) {
      context.handle(_textLiveMeta, textLive.isAcceptableOrUnknown(data['text_live']!, _textLiveMeta));
    }
    if (data.containsKey('lang')) {
      context.handle(_langMeta, lang.isAcceptableOrUnknown(data['lang']!, _langMeta));
    }
    if (data.containsKey('asr_confidence')) {
      context.handle(
        _asrConfidenceMeta,
        asrConfidence.isAcceptableOrUnknown(data['asr_confidence']!, _asrConfidenceMeta),
      );
    }
    if (data.containsKey('speaker_confidence')) {
      context.handle(
        _speakerConfidenceMeta,
        speakerConfidence.isAcceptableOrUnknown(data['speaker_confidence']!, _speakerConfidenceMeta),
      );
    }
    if (data.containsKey('pass')) {
      context.handle(_passMeta, pass.isAcceptableOrUnknown(data['pass']!, _passMeta));
    }
    if (data.containsKey('translation')) {
      context.handle(_translationMeta, translation.isAcceptableOrUnknown(data['translation']!, _translationMeta));
    }
    if (data.containsKey('translation_lang')) {
      context.handle(
        _translationLangMeta,
        translationLang.isAcceptableOrUnknown(data['translation_lang']!, _translationLangMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seq};
  @override
  UtteranceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UtteranceData(
      seq: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}seq'])!,
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      momentId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}moment_id']),
      speakerId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}speaker_id']),
      speakerLocked: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}speaker_locked'])!,
      startMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}start_ms'])!,
      endMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}end_ms'])!,
      text$: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}text'])!,
      textLive: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}text_live']),
      lang: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}lang']),
      asrConfidence: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}asr_confidence']),
      speakerConfidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speaker_confidence'],
      ),
      pass: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}pass'])!,
      translation: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}translation']),
      translationLang: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation_lang'],
      ),
    );
  }

  @override
  Utterance createAlias(String alias) {
    return Utterance(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UtteranceData extends DataClass implements Insertable<UtteranceData> {
  final int seq;

  /// stable rowid for the FTS index (§10.1)
  final String id;
  final String sessionId;
  final String? momentId;
  final String? speakerId;
  final int speakerLocked;

  /// the user reassigned it; re-cluster keeps it (§7.4)
  final int startMs;
  final int endMs;
  final String text$;
  final String? textLive;

  /// live text, kept when the refine pass replaces it (§7.2)
  final String? lang;
  final double? asrConfidence;
  final double? speakerConfidence;
  final int pass;

  /// 1 live, 2 speakers re-clustered, 4 text refined
  final String? translation;

  /// Phase 2
  final String? translationLang;
  const UtteranceData({
    required this.seq,
    required this.id,
    required this.sessionId,
    this.momentId,
    this.speakerId,
    required this.speakerLocked,
    required this.startMs,
    required this.endMs,
    required this.text$,
    this.textLive,
    this.lang,
    this.asrConfidence,
    this.speakerConfidence,
    required this.pass,
    this.translation,
    this.translationLang,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['seq'] = Variable<int>(seq);
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    if (!nullToAbsent || momentId != null) {
      map['moment_id'] = Variable<String>(momentId);
    }
    if (!nullToAbsent || speakerId != null) {
      map['speaker_id'] = Variable<String>(speakerId);
    }
    map['speaker_locked'] = Variable<int>(speakerLocked);
    map['start_ms'] = Variable<int>(startMs);
    map['end_ms'] = Variable<int>(endMs);
    map['text'] = Variable<String>(text$);
    if (!nullToAbsent || textLive != null) {
      map['text_live'] = Variable<String>(textLive);
    }
    if (!nullToAbsent || lang != null) {
      map['lang'] = Variable<String>(lang);
    }
    if (!nullToAbsent || asrConfidence != null) {
      map['asr_confidence'] = Variable<double>(asrConfidence);
    }
    if (!nullToAbsent || speakerConfidence != null) {
      map['speaker_confidence'] = Variable<double>(speakerConfidence);
    }
    map['pass'] = Variable<int>(pass);
    if (!nullToAbsent || translation != null) {
      map['translation'] = Variable<String>(translation);
    }
    if (!nullToAbsent || translationLang != null) {
      map['translation_lang'] = Variable<String>(translationLang);
    }
    return map;
  }

  UtteranceCompanion toCompanion(bool nullToAbsent) {
    return UtteranceCompanion(
      seq: Value(seq),
      id: Value(id),
      sessionId: Value(sessionId),
      momentId: momentId == null && nullToAbsent ? const Value.absent() : Value(momentId),
      speakerId: speakerId == null && nullToAbsent ? const Value.absent() : Value(speakerId),
      speakerLocked: Value(speakerLocked),
      startMs: Value(startMs),
      endMs: Value(endMs),
      text$: Value(text$),
      textLive: textLive == null && nullToAbsent ? const Value.absent() : Value(textLive),
      lang: lang == null && nullToAbsent ? const Value.absent() : Value(lang),
      asrConfidence: asrConfidence == null && nullToAbsent ? const Value.absent() : Value(asrConfidence),
      speakerConfidence: speakerConfidence == null && nullToAbsent ? const Value.absent() : Value(speakerConfidence),
      pass: Value(pass),
      translation: translation == null && nullToAbsent ? const Value.absent() : Value(translation),
      translationLang: translationLang == null && nullToAbsent ? const Value.absent() : Value(translationLang),
    );
  }

  factory UtteranceData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UtteranceData(
      seq: serializer.fromJson<int>(json['seq']),
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['session_id']),
      momentId: serializer.fromJson<String?>(json['moment_id']),
      speakerId: serializer.fromJson<String?>(json['speaker_id']),
      speakerLocked: serializer.fromJson<int>(json['speaker_locked']),
      startMs: serializer.fromJson<int>(json['start_ms']),
      endMs: serializer.fromJson<int>(json['end_ms']),
      text$: serializer.fromJson<String>(json['text']),
      textLive: serializer.fromJson<String?>(json['text_live']),
      lang: serializer.fromJson<String?>(json['lang']),
      asrConfidence: serializer.fromJson<double?>(json['asr_confidence']),
      speakerConfidence: serializer.fromJson<double?>(json['speaker_confidence']),
      pass: serializer.fromJson<int>(json['pass']),
      translation: serializer.fromJson<String?>(json['translation']),
      translationLang: serializer.fromJson<String?>(json['translation_lang']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seq': serializer.toJson<int>(seq),
      'id': serializer.toJson<String>(id),
      'session_id': serializer.toJson<String>(sessionId),
      'moment_id': serializer.toJson<String?>(momentId),
      'speaker_id': serializer.toJson<String?>(speakerId),
      'speaker_locked': serializer.toJson<int>(speakerLocked),
      'start_ms': serializer.toJson<int>(startMs),
      'end_ms': serializer.toJson<int>(endMs),
      'text': serializer.toJson<String>(text$),
      'text_live': serializer.toJson<String?>(textLive),
      'lang': serializer.toJson<String?>(lang),
      'asr_confidence': serializer.toJson<double?>(asrConfidence),
      'speaker_confidence': serializer.toJson<double?>(speakerConfidence),
      'pass': serializer.toJson<int>(pass),
      'translation': serializer.toJson<String?>(translation),
      'translation_lang': serializer.toJson<String?>(translationLang),
    };
  }

  UtteranceData copyWith({
    int? seq,
    String? id,
    String? sessionId,
    Value<String?> momentId = const Value.absent(),
    Value<String?> speakerId = const Value.absent(),
    int? speakerLocked,
    int? startMs,
    int? endMs,
    String? text$,
    Value<String?> textLive = const Value.absent(),
    Value<String?> lang = const Value.absent(),
    Value<double?> asrConfidence = const Value.absent(),
    Value<double?> speakerConfidence = const Value.absent(),
    int? pass,
    Value<String?> translation = const Value.absent(),
    Value<String?> translationLang = const Value.absent(),
  }) => UtteranceData(
    seq: seq ?? this.seq,
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    momentId: momentId.present ? momentId.value : this.momentId,
    speakerId: speakerId.present ? speakerId.value : this.speakerId,
    speakerLocked: speakerLocked ?? this.speakerLocked,
    startMs: startMs ?? this.startMs,
    endMs: endMs ?? this.endMs,
    text$: text$ ?? this.text$,
    textLive: textLive.present ? textLive.value : this.textLive,
    lang: lang.present ? lang.value : this.lang,
    asrConfidence: asrConfidence.present ? asrConfidence.value : this.asrConfidence,
    speakerConfidence: speakerConfidence.present ? speakerConfidence.value : this.speakerConfidence,
    pass: pass ?? this.pass,
    translation: translation.present ? translation.value : this.translation,
    translationLang: translationLang.present ? translationLang.value : this.translationLang,
  );
  UtteranceData copyWithCompanion(UtteranceCompanion data) {
    return UtteranceData(
      seq: data.seq.present ? data.seq.value : this.seq,
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      momentId: data.momentId.present ? data.momentId.value : this.momentId,
      speakerId: data.speakerId.present ? data.speakerId.value : this.speakerId,
      speakerLocked: data.speakerLocked.present ? data.speakerLocked.value : this.speakerLocked,
      startMs: data.startMs.present ? data.startMs.value : this.startMs,
      endMs: data.endMs.present ? data.endMs.value : this.endMs,
      text$: data.text$.present ? data.text$.value : this.text$,
      textLive: data.textLive.present ? data.textLive.value : this.textLive,
      lang: data.lang.present ? data.lang.value : this.lang,
      asrConfidence: data.asrConfidence.present ? data.asrConfidence.value : this.asrConfidence,
      speakerConfidence: data.speakerConfidence.present ? data.speakerConfidence.value : this.speakerConfidence,
      pass: data.pass.present ? data.pass.value : this.pass,
      translation: data.translation.present ? data.translation.value : this.translation,
      translationLang: data.translationLang.present ? data.translationLang.value : this.translationLang,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UtteranceData(')
          ..write('seq: $seq, ')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('momentId: $momentId, ')
          ..write('speakerId: $speakerId, ')
          ..write('speakerLocked: $speakerLocked, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('text\$: ${text$}, ')
          ..write('textLive: $textLive, ')
          ..write('lang: $lang, ')
          ..write('asrConfidence: $asrConfidence, ')
          ..write('speakerConfidence: $speakerConfidence, ')
          ..write('pass: $pass, ')
          ..write('translation: $translation, ')
          ..write('translationLang: $translationLang')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    seq,
    id,
    sessionId,
    momentId,
    speakerId,
    speakerLocked,
    startMs,
    endMs,
    text$,
    textLive,
    lang,
    asrConfidence,
    speakerConfidence,
    pass,
    translation,
    translationLang,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UtteranceData &&
          other.seq == this.seq &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.momentId == this.momentId &&
          other.speakerId == this.speakerId &&
          other.speakerLocked == this.speakerLocked &&
          other.startMs == this.startMs &&
          other.endMs == this.endMs &&
          other.text$ == this.text$ &&
          other.textLive == this.textLive &&
          other.lang == this.lang &&
          other.asrConfidence == this.asrConfidence &&
          other.speakerConfidence == this.speakerConfidence &&
          other.pass == this.pass &&
          other.translation == this.translation &&
          other.translationLang == this.translationLang);
}

class UtteranceCompanion extends UpdateCompanion<UtteranceData> {
  final Value<int> seq;
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String?> momentId;
  final Value<String?> speakerId;
  final Value<int> speakerLocked;
  final Value<int> startMs;
  final Value<int> endMs;
  final Value<String> text$;
  final Value<String?> textLive;
  final Value<String?> lang;
  final Value<double?> asrConfidence;
  final Value<double?> speakerConfidence;
  final Value<int> pass;
  final Value<String?> translation;
  final Value<String?> translationLang;
  const UtteranceCompanion({
    this.seq = const Value.absent(),
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.momentId = const Value.absent(),
    this.speakerId = const Value.absent(),
    this.speakerLocked = const Value.absent(),
    this.startMs = const Value.absent(),
    this.endMs = const Value.absent(),
    this.text$ = const Value.absent(),
    this.textLive = const Value.absent(),
    this.lang = const Value.absent(),
    this.asrConfidence = const Value.absent(),
    this.speakerConfidence = const Value.absent(),
    this.pass = const Value.absent(),
    this.translation = const Value.absent(),
    this.translationLang = const Value.absent(),
  });
  UtteranceCompanion.insert({
    this.seq = const Value.absent(),
    required String id,
    required String sessionId,
    this.momentId = const Value.absent(),
    this.speakerId = const Value.absent(),
    this.speakerLocked = const Value.absent(),
    required int startMs,
    required int endMs,
    required String text$,
    this.textLive = const Value.absent(),
    this.lang = const Value.absent(),
    this.asrConfidence = const Value.absent(),
    this.speakerConfidence = const Value.absent(),
    this.pass = const Value.absent(),
    this.translation = const Value.absent(),
    this.translationLang = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       startMs = Value(startMs),
       endMs = Value(endMs),
       text$ = Value(text$);
  static Insertable<UtteranceData> custom({
    Expression<int>? seq,
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? momentId,
    Expression<String>? speakerId,
    Expression<int>? speakerLocked,
    Expression<int>? startMs,
    Expression<int>? endMs,
    Expression<String>? text$,
    Expression<String>? textLive,
    Expression<String>? lang,
    Expression<double>? asrConfidence,
    Expression<double>? speakerConfidence,
    Expression<int>? pass,
    Expression<String>? translation,
    Expression<String>? translationLang,
  }) {
    return RawValuesInsertable({
      if (seq != null) 'seq': seq,
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (momentId != null) 'moment_id': momentId,
      if (speakerId != null) 'speaker_id': speakerId,
      if (speakerLocked != null) 'speaker_locked': speakerLocked,
      if (startMs != null) 'start_ms': startMs,
      if (endMs != null) 'end_ms': endMs,
      if (text$ != null) 'text': text$,
      if (textLive != null) 'text_live': textLive,
      if (lang != null) 'lang': lang,
      if (asrConfidence != null) 'asr_confidence': asrConfidence,
      if (speakerConfidence != null) 'speaker_confidence': speakerConfidence,
      if (pass != null) 'pass': pass,
      if (translation != null) 'translation': translation,
      if (translationLang != null) 'translation_lang': translationLang,
    });
  }

  UtteranceCompanion copyWith({
    Value<int>? seq,
    Value<String>? id,
    Value<String>? sessionId,
    Value<String?>? momentId,
    Value<String?>? speakerId,
    Value<int>? speakerLocked,
    Value<int>? startMs,
    Value<int>? endMs,
    Value<String>? text$,
    Value<String?>? textLive,
    Value<String?>? lang,
    Value<double?>? asrConfidence,
    Value<double?>? speakerConfidence,
    Value<int>? pass,
    Value<String?>? translation,
    Value<String?>? translationLang,
  }) {
    return UtteranceCompanion(
      seq: seq ?? this.seq,
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      momentId: momentId ?? this.momentId,
      speakerId: speakerId ?? this.speakerId,
      speakerLocked: speakerLocked ?? this.speakerLocked,
      startMs: startMs ?? this.startMs,
      endMs: endMs ?? this.endMs,
      text$: text$ ?? this.text$,
      textLive: textLive ?? this.textLive,
      lang: lang ?? this.lang,
      asrConfidence: asrConfidence ?? this.asrConfidence,
      speakerConfidence: speakerConfidence ?? this.speakerConfidence,
      pass: pass ?? this.pass,
      translation: translation ?? this.translation,
      translationLang: translationLang ?? this.translationLang,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seq.present) {
      map['seq'] = Variable<int>(seq.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (momentId.present) {
      map['moment_id'] = Variable<String>(momentId.value);
    }
    if (speakerId.present) {
      map['speaker_id'] = Variable<String>(speakerId.value);
    }
    if (speakerLocked.present) {
      map['speaker_locked'] = Variable<int>(speakerLocked.value);
    }
    if (startMs.present) {
      map['start_ms'] = Variable<int>(startMs.value);
    }
    if (endMs.present) {
      map['end_ms'] = Variable<int>(endMs.value);
    }
    if (text$.present) {
      map['text'] = Variable<String>(text$.value);
    }
    if (textLive.present) {
      map['text_live'] = Variable<String>(textLive.value);
    }
    if (lang.present) {
      map['lang'] = Variable<String>(lang.value);
    }
    if (asrConfidence.present) {
      map['asr_confidence'] = Variable<double>(asrConfidence.value);
    }
    if (speakerConfidence.present) {
      map['speaker_confidence'] = Variable<double>(speakerConfidence.value);
    }
    if (pass.present) {
      map['pass'] = Variable<int>(pass.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (translationLang.present) {
      map['translation_lang'] = Variable<String>(translationLang.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UtteranceCompanion(')
          ..write('seq: $seq, ')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('momentId: $momentId, ')
          ..write('speakerId: $speakerId, ')
          ..write('speakerLocked: $speakerLocked, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('text\$: ${text$}, ')
          ..write('textLive: $textLive, ')
          ..write('lang: $lang, ')
          ..write('asrConfidence: $asrConfidence, ')
          ..write('speakerConfidence: $speakerConfidence, ')
          ..write('pass: $pass, ')
          ..write('translation: $translation, ')
          ..write('translationLang: $translationLang')
          ..write(')'))
        .toString();
  }
}

class UtteranceFts extends Table
    with TableInfo<UtteranceFts, UtteranceFt>, VirtualTableInfo<UtteranceFts, UtteranceFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UtteranceFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _text$Meta = const VerificationMeta('text\$');
  late final GeneratedColumn<String> text$ = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [text$];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'utterance_fts';
  @override
  VerificationContext validateIntegrity(Insertable<UtteranceFt> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('text')) {
      context.handle(_text$Meta, text$.isAcceptableOrUnknown(data['text']!, _text$Meta));
    } else if (isInserting) {
      context.missing(_text$Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UtteranceFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UtteranceFt(text$: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}text'])!);
  }

  @override
  UtteranceFts createAlias(String alias) {
    return UtteranceFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs => 'fts5(text, content=\'utterance\', content_rowid=\'seq\', tokenize=\'trigram\')';
}

class UtteranceFt extends DataClass implements Insertable<UtteranceFt> {
  final String text$;
  const UtteranceFt({required this.text$});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['text'] = Variable<String>(text$);
    return map;
  }

  UtteranceFtsCompanion toCompanion(bool nullToAbsent) {
    return UtteranceFtsCompanion(text$: Value(text$));
  }

  factory UtteranceFt.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UtteranceFt(text$: serializer.fromJson<String>(json['text']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'text': serializer.toJson<String>(text$)};
  }

  UtteranceFt copyWith({String? text$}) => UtteranceFt(text$: text$ ?? this.text$);
  UtteranceFt copyWithCompanion(UtteranceFtsCompanion data) {
    return UtteranceFt(text$: data.text$.present ? data.text$.value : this.text$);
  }

  @override
  String toString() {
    return (StringBuffer('UtteranceFt(')
          ..write('text\$: ${text$}')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => text$.hashCode;
  @override
  bool operator ==(Object other) => identical(this, other) || (other is UtteranceFt && other.text$ == this.text$);
}

class UtteranceFtsCompanion extends UpdateCompanion<UtteranceFt> {
  final Value<String> text$;
  final Value<int> rowid;
  const UtteranceFtsCompanion({this.text$ = const Value.absent(), this.rowid = const Value.absent()});
  UtteranceFtsCompanion.insert({required String text$, this.rowid = const Value.absent()}) : text$ = Value(text$);
  static Insertable<UtteranceFt> custom({Expression<String>? text$, Expression<int>? rowid}) {
    return RawValuesInsertable({if (text$ != null) 'text': text$, if (rowid != null) 'rowid': rowid});
  }

  UtteranceFtsCompanion copyWith({Value<String>? text$, Value<int>? rowid}) {
    return UtteranceFtsCompanion(text$: text$ ?? this.text$, rowid: rowid ?? this.rowid);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (text$.present) {
      map['text'] = Variable<String>(text$.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UtteranceFtsCompanion(')
          ..write('text\$: ${text$}, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Item extends Table with TableInfo<Item, ItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Item(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _momentIdMeta = const VerificationMeta('momentId');
  late final GeneratedColumn<String> momentId = GeneratedColumn<String>(
    'moment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES moment(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (type IN (\'promise\', \'decision\', \'fact\', \'question\'))',
  );
  static const VerificationMeta _text$Meta = const VerificationMeta('text\$');
  late final GeneratedColumn<String> text$ = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _ownerSpeakerIdMeta = const VerificationMeta('ownerSpeakerId');
  late final GeneratedColumn<String> ownerSpeakerId = GeneratedColumn<String>(
    'owner_speaker_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES speaker(id)',
  );
  static const VerificationMeta _ownerPersonIdMeta = const VerificationMeta('ownerPersonId');
  late final GeneratedColumn<String> ownerPersonId = GeneratedColumn<String>(
    'owner_person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES person(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _ownerFromUtteranceIdMeta = const VerificationMeta('ownerFromUtteranceId');
  late final GeneratedColumn<String> ownerFromUtteranceId = GeneratedColumn<String>(
    'owner_from_utterance_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES utterance(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _counterpartSpeakerIdMeta = const VerificationMeta('counterpartSpeakerId');
  late final GeneratedColumn<String> counterpartSpeakerId = GeneratedColumn<String>(
    'counterpart_speaker_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES speaker(id)',
  );
  static const VerificationMeta _counterpartPersonIdMeta = const VerificationMeta('counterpartPersonId');
  late final GeneratedColumn<String> counterpartPersonId = GeneratedColumn<String>(
    'counterpart_person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES person(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  late final GeneratedColumn<String> dueDate = GeneratedColumn<String>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _duePhraseMeta = const VerificationMeta('duePhrase');
  late final GeneratedColumn<String> duePhrase = GeneratedColumn<String>(
    'due_phrase',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _dueCheckMeta = const VerificationMeta('dueCheck');
  late final GeneratedColumn<String> dueCheck = GeneratedColumn<String>(
    'due_check',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'CHECK (due_check IN (\'match\', \'mismatch\', \'unparsed\'))',
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta('confidence');
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'open\' CHECK (status IN (\'open\', \'done\', \'dismissed\', \'wrong\'))',
    defaultValue: const CustomExpression('\'open\''),
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (origin IN (\'model\', \'user\'))',
  );
  static const VerificationMeta _userEditedMeta = const VerificationMeta('userEdited');
  late final GeneratedColumn<int> userEdited = GeneratedColumn<int>(
    'user_edited',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    momentId,
    type,
    text$,
    ownerSpeakerId,
    ownerPersonId,
    ownerFromUtteranceId,
    counterpartSpeakerId,
    counterpartPersonId,
    dueDate,
    duePhrase,
    dueCheck,
    confidence,
    status,
    origin,
    userEdited,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item';
  @override
  VerificationContext validateIntegrity(Insertable<ItemData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('moment_id')) {
      context.handle(_momentIdMeta, momentId.isAcceptableOrUnknown(data['moment_id']!, _momentIdMeta));
    } else if (isInserting) {
      context.missing(_momentIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(_typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('text')) {
      context.handle(_text$Meta, text$.isAcceptableOrUnknown(data['text']!, _text$Meta));
    } else if (isInserting) {
      context.missing(_text$Meta);
    }
    if (data.containsKey('owner_speaker_id')) {
      context.handle(
        _ownerSpeakerIdMeta,
        ownerSpeakerId.isAcceptableOrUnknown(data['owner_speaker_id']!, _ownerSpeakerIdMeta),
      );
    }
    if (data.containsKey('owner_person_id')) {
      context.handle(
        _ownerPersonIdMeta,
        ownerPersonId.isAcceptableOrUnknown(data['owner_person_id']!, _ownerPersonIdMeta),
      );
    }
    if (data.containsKey('owner_from_utterance_id')) {
      context.handle(
        _ownerFromUtteranceIdMeta,
        ownerFromUtteranceId.isAcceptableOrUnknown(data['owner_from_utterance_id']!, _ownerFromUtteranceIdMeta),
      );
    }
    if (data.containsKey('counterpart_speaker_id')) {
      context.handle(
        _counterpartSpeakerIdMeta,
        counterpartSpeakerId.isAcceptableOrUnknown(data['counterpart_speaker_id']!, _counterpartSpeakerIdMeta),
      );
    }
    if (data.containsKey('counterpart_person_id')) {
      context.handle(
        _counterpartPersonIdMeta,
        counterpartPersonId.isAcceptableOrUnknown(data['counterpart_person_id']!, _counterpartPersonIdMeta),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta, dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('due_phrase')) {
      context.handle(_duePhraseMeta, duePhrase.isAcceptableOrUnknown(data['due_phrase']!, _duePhraseMeta));
    }
    if (data.containsKey('due_check')) {
      context.handle(_dueCheckMeta, dueCheck.isAcceptableOrUnknown(data['due_check']!, _dueCheckMeta));
    }
    if (data.containsKey('confidence')) {
      context.handle(_confidenceMeta, confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta));
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta, status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta, origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    } else if (isInserting) {
      context.missing(_originMeta);
    }
    if (data.containsKey('user_edited')) {
      context.handle(_userEditedMeta, userEdited.isAcceptableOrUnknown(data['user_edited']!, _userEditedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      momentId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}moment_id'])!,
      type: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      text$: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}text'])!,
      ownerSpeakerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_speaker_id'],
      ),
      ownerPersonId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}owner_person_id']),
      ownerFromUtteranceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_from_utterance_id'],
      ),
      counterpartSpeakerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}counterpart_speaker_id'],
      ),
      counterpartPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}counterpart_person_id'],
      ),
      dueDate: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}due_date']),
      duePhrase: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}due_phrase']),
      dueCheck: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}due_check']),
      confidence: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}confidence'])!,
      status: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      origin: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}origin'])!,
      userEdited: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}user_edited'])!,
      createdAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  Item createAlias(String alias) {
    return Item(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(owner_speaker_id IS NULL OR owner_person_id IS NULL)',
    'CHECK(counterpart_speaker_id IS NULL OR counterpart_person_id IS NULL)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ItemData extends DataClass implements Insertable<ItemData> {
  final String id;
  final String momentId;
  final String type;
  final String text$;

  /// with {{spk:id}} / {{per:id}} placeholders
  final String? ownerSpeakerId;
  final String? ownerPersonId;
  final String? ownerFromUtteranceId;
  final String? counterpartSpeakerId;
  final String? counterpartPersonId;
  final String? dueDate;

  /// YYYY-MM-DD in the moment's zone
  final String? duePhrase;
  final String? dueCheck;
  final double confidence;

  /// 1.0 for user items
  final String status;
  final String origin;
  final int userEdited;
  final int createdAt;
  final int updatedAt;
  const ItemData({
    required this.id,
    required this.momentId,
    required this.type,
    required this.text$,
    this.ownerSpeakerId,
    this.ownerPersonId,
    this.ownerFromUtteranceId,
    this.counterpartSpeakerId,
    this.counterpartPersonId,
    this.dueDate,
    this.duePhrase,
    this.dueCheck,
    required this.confidence,
    required this.status,
    required this.origin,
    required this.userEdited,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['moment_id'] = Variable<String>(momentId);
    map['type'] = Variable<String>(type);
    map['text'] = Variable<String>(text$);
    if (!nullToAbsent || ownerSpeakerId != null) {
      map['owner_speaker_id'] = Variable<String>(ownerSpeakerId);
    }
    if (!nullToAbsent || ownerPersonId != null) {
      map['owner_person_id'] = Variable<String>(ownerPersonId);
    }
    if (!nullToAbsent || ownerFromUtteranceId != null) {
      map['owner_from_utterance_id'] = Variable<String>(ownerFromUtteranceId);
    }
    if (!nullToAbsent || counterpartSpeakerId != null) {
      map['counterpart_speaker_id'] = Variable<String>(counterpartSpeakerId);
    }
    if (!nullToAbsent || counterpartPersonId != null) {
      map['counterpart_person_id'] = Variable<String>(counterpartPersonId);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<String>(dueDate);
    }
    if (!nullToAbsent || duePhrase != null) {
      map['due_phrase'] = Variable<String>(duePhrase);
    }
    if (!nullToAbsent || dueCheck != null) {
      map['due_check'] = Variable<String>(dueCheck);
    }
    map['confidence'] = Variable<double>(confidence);
    map['status'] = Variable<String>(status);
    map['origin'] = Variable<String>(origin);
    map['user_edited'] = Variable<int>(userEdited);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  ItemCompanion toCompanion(bool nullToAbsent) {
    return ItemCompanion(
      id: Value(id),
      momentId: Value(momentId),
      type: Value(type),
      text$: Value(text$),
      ownerSpeakerId: ownerSpeakerId == null && nullToAbsent ? const Value.absent() : Value(ownerSpeakerId),
      ownerPersonId: ownerPersonId == null && nullToAbsent ? const Value.absent() : Value(ownerPersonId),
      ownerFromUtteranceId: ownerFromUtteranceId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerFromUtteranceId),
      counterpartSpeakerId: counterpartSpeakerId == null && nullToAbsent
          ? const Value.absent()
          : Value(counterpartSpeakerId),
      counterpartPersonId: counterpartPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(counterpartPersonId),
      dueDate: dueDate == null && nullToAbsent ? const Value.absent() : Value(dueDate),
      duePhrase: duePhrase == null && nullToAbsent ? const Value.absent() : Value(duePhrase),
      dueCheck: dueCheck == null && nullToAbsent ? const Value.absent() : Value(dueCheck),
      confidence: Value(confidence),
      status: Value(status),
      origin: Value(origin),
      userEdited: Value(userEdited),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ItemData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemData(
      id: serializer.fromJson<String>(json['id']),
      momentId: serializer.fromJson<String>(json['moment_id']),
      type: serializer.fromJson<String>(json['type']),
      text$: serializer.fromJson<String>(json['text']),
      ownerSpeakerId: serializer.fromJson<String?>(json['owner_speaker_id']),
      ownerPersonId: serializer.fromJson<String?>(json['owner_person_id']),
      ownerFromUtteranceId: serializer.fromJson<String?>(json['owner_from_utterance_id']),
      counterpartSpeakerId: serializer.fromJson<String?>(json['counterpart_speaker_id']),
      counterpartPersonId: serializer.fromJson<String?>(json['counterpart_person_id']),
      dueDate: serializer.fromJson<String?>(json['due_date']),
      duePhrase: serializer.fromJson<String?>(json['due_phrase']),
      dueCheck: serializer.fromJson<String?>(json['due_check']),
      confidence: serializer.fromJson<double>(json['confidence']),
      status: serializer.fromJson<String>(json['status']),
      origin: serializer.fromJson<String>(json['origin']),
      userEdited: serializer.fromJson<int>(json['user_edited']),
      createdAt: serializer.fromJson<int>(json['created_at']),
      updatedAt: serializer.fromJson<int>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'moment_id': serializer.toJson<String>(momentId),
      'type': serializer.toJson<String>(type),
      'text': serializer.toJson<String>(text$),
      'owner_speaker_id': serializer.toJson<String?>(ownerSpeakerId),
      'owner_person_id': serializer.toJson<String?>(ownerPersonId),
      'owner_from_utterance_id': serializer.toJson<String?>(ownerFromUtteranceId),
      'counterpart_speaker_id': serializer.toJson<String?>(counterpartSpeakerId),
      'counterpart_person_id': serializer.toJson<String?>(counterpartPersonId),
      'due_date': serializer.toJson<String?>(dueDate),
      'due_phrase': serializer.toJson<String?>(duePhrase),
      'due_check': serializer.toJson<String?>(dueCheck),
      'confidence': serializer.toJson<double>(confidence),
      'status': serializer.toJson<String>(status),
      'origin': serializer.toJson<String>(origin),
      'user_edited': serializer.toJson<int>(userEdited),
      'created_at': serializer.toJson<int>(createdAt),
      'updated_at': serializer.toJson<int>(updatedAt),
    };
  }

  ItemData copyWith({
    String? id,
    String? momentId,
    String? type,
    String? text$,
    Value<String?> ownerSpeakerId = const Value.absent(),
    Value<String?> ownerPersonId = const Value.absent(),
    Value<String?> ownerFromUtteranceId = const Value.absent(),
    Value<String?> counterpartSpeakerId = const Value.absent(),
    Value<String?> counterpartPersonId = const Value.absent(),
    Value<String?> dueDate = const Value.absent(),
    Value<String?> duePhrase = const Value.absent(),
    Value<String?> dueCheck = const Value.absent(),
    double? confidence,
    String? status,
    String? origin,
    int? userEdited,
    int? createdAt,
    int? updatedAt,
  }) => ItemData(
    id: id ?? this.id,
    momentId: momentId ?? this.momentId,
    type: type ?? this.type,
    text$: text$ ?? this.text$,
    ownerSpeakerId: ownerSpeakerId.present ? ownerSpeakerId.value : this.ownerSpeakerId,
    ownerPersonId: ownerPersonId.present ? ownerPersonId.value : this.ownerPersonId,
    ownerFromUtteranceId: ownerFromUtteranceId.present ? ownerFromUtteranceId.value : this.ownerFromUtteranceId,
    counterpartSpeakerId: counterpartSpeakerId.present ? counterpartSpeakerId.value : this.counterpartSpeakerId,
    counterpartPersonId: counterpartPersonId.present ? counterpartPersonId.value : this.counterpartPersonId,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    duePhrase: duePhrase.present ? duePhrase.value : this.duePhrase,
    dueCheck: dueCheck.present ? dueCheck.value : this.dueCheck,
    confidence: confidence ?? this.confidence,
    status: status ?? this.status,
    origin: origin ?? this.origin,
    userEdited: userEdited ?? this.userEdited,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ItemData copyWithCompanion(ItemCompanion data) {
    return ItemData(
      id: data.id.present ? data.id.value : this.id,
      momentId: data.momentId.present ? data.momentId.value : this.momentId,
      type: data.type.present ? data.type.value : this.type,
      text$: data.text$.present ? data.text$.value : this.text$,
      ownerSpeakerId: data.ownerSpeakerId.present ? data.ownerSpeakerId.value : this.ownerSpeakerId,
      ownerPersonId: data.ownerPersonId.present ? data.ownerPersonId.value : this.ownerPersonId,
      ownerFromUtteranceId: data.ownerFromUtteranceId.present
          ? data.ownerFromUtteranceId.value
          : this.ownerFromUtteranceId,
      counterpartSpeakerId: data.counterpartSpeakerId.present
          ? data.counterpartSpeakerId.value
          : this.counterpartSpeakerId,
      counterpartPersonId: data.counterpartPersonId.present ? data.counterpartPersonId.value : this.counterpartPersonId,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      duePhrase: data.duePhrase.present ? data.duePhrase.value : this.duePhrase,
      dueCheck: data.dueCheck.present ? data.dueCheck.value : this.dueCheck,
      confidence: data.confidence.present ? data.confidence.value : this.confidence,
      status: data.status.present ? data.status.value : this.status,
      origin: data.origin.present ? data.origin.value : this.origin,
      userEdited: data.userEdited.present ? data.userEdited.value : this.userEdited,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemData(')
          ..write('id: $id, ')
          ..write('momentId: $momentId, ')
          ..write('type: $type, ')
          ..write('text\$: ${text$}, ')
          ..write('ownerSpeakerId: $ownerSpeakerId, ')
          ..write('ownerPersonId: $ownerPersonId, ')
          ..write('ownerFromUtteranceId: $ownerFromUtteranceId, ')
          ..write('counterpartSpeakerId: $counterpartSpeakerId, ')
          ..write('counterpartPersonId: $counterpartPersonId, ')
          ..write('dueDate: $dueDate, ')
          ..write('duePhrase: $duePhrase, ')
          ..write('dueCheck: $dueCheck, ')
          ..write('confidence: $confidence, ')
          ..write('status: $status, ')
          ..write('origin: $origin, ')
          ..write('userEdited: $userEdited, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    momentId,
    type,
    text$,
    ownerSpeakerId,
    ownerPersonId,
    ownerFromUtteranceId,
    counterpartSpeakerId,
    counterpartPersonId,
    dueDate,
    duePhrase,
    dueCheck,
    confidence,
    status,
    origin,
    userEdited,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemData &&
          other.id == this.id &&
          other.momentId == this.momentId &&
          other.type == this.type &&
          other.text$ == this.text$ &&
          other.ownerSpeakerId == this.ownerSpeakerId &&
          other.ownerPersonId == this.ownerPersonId &&
          other.ownerFromUtteranceId == this.ownerFromUtteranceId &&
          other.counterpartSpeakerId == this.counterpartSpeakerId &&
          other.counterpartPersonId == this.counterpartPersonId &&
          other.dueDate == this.dueDate &&
          other.duePhrase == this.duePhrase &&
          other.dueCheck == this.dueCheck &&
          other.confidence == this.confidence &&
          other.status == this.status &&
          other.origin == this.origin &&
          other.userEdited == this.userEdited &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ItemCompanion extends UpdateCompanion<ItemData> {
  final Value<String> id;
  final Value<String> momentId;
  final Value<String> type;
  final Value<String> text$;
  final Value<String?> ownerSpeakerId;
  final Value<String?> ownerPersonId;
  final Value<String?> ownerFromUtteranceId;
  final Value<String?> counterpartSpeakerId;
  final Value<String?> counterpartPersonId;
  final Value<String?> dueDate;
  final Value<String?> duePhrase;
  final Value<String?> dueCheck;
  final Value<double> confidence;
  final Value<String> status;
  final Value<String> origin;
  final Value<int> userEdited;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const ItemCompanion({
    this.id = const Value.absent(),
    this.momentId = const Value.absent(),
    this.type = const Value.absent(),
    this.text$ = const Value.absent(),
    this.ownerSpeakerId = const Value.absent(),
    this.ownerPersonId = const Value.absent(),
    this.ownerFromUtteranceId = const Value.absent(),
    this.counterpartSpeakerId = const Value.absent(),
    this.counterpartPersonId = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.duePhrase = const Value.absent(),
    this.dueCheck = const Value.absent(),
    this.confidence = const Value.absent(),
    this.status = const Value.absent(),
    this.origin = const Value.absent(),
    this.userEdited = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemCompanion.insert({
    required String id,
    required String momentId,
    required String type,
    required String text$,
    this.ownerSpeakerId = const Value.absent(),
    this.ownerPersonId = const Value.absent(),
    this.ownerFromUtteranceId = const Value.absent(),
    this.counterpartSpeakerId = const Value.absent(),
    this.counterpartPersonId = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.duePhrase = const Value.absent(),
    this.dueCheck = const Value.absent(),
    required double confidence,
    this.status = const Value.absent(),
    required String origin,
    this.userEdited = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       momentId = Value(momentId),
       type = Value(type),
       text$ = Value(text$),
       confidence = Value(confidence),
       origin = Value(origin),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ItemData> custom({
    Expression<String>? id,
    Expression<String>? momentId,
    Expression<String>? type,
    Expression<String>? text$,
    Expression<String>? ownerSpeakerId,
    Expression<String>? ownerPersonId,
    Expression<String>? ownerFromUtteranceId,
    Expression<String>? counterpartSpeakerId,
    Expression<String>? counterpartPersonId,
    Expression<String>? dueDate,
    Expression<String>? duePhrase,
    Expression<String>? dueCheck,
    Expression<double>? confidence,
    Expression<String>? status,
    Expression<String>? origin,
    Expression<int>? userEdited,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (momentId != null) 'moment_id': momentId,
      if (type != null) 'type': type,
      if (text$ != null) 'text': text$,
      if (ownerSpeakerId != null) 'owner_speaker_id': ownerSpeakerId,
      if (ownerPersonId != null) 'owner_person_id': ownerPersonId,
      if (ownerFromUtteranceId != null) 'owner_from_utterance_id': ownerFromUtteranceId,
      if (counterpartSpeakerId != null) 'counterpart_speaker_id': counterpartSpeakerId,
      if (counterpartPersonId != null) 'counterpart_person_id': counterpartPersonId,
      if (dueDate != null) 'due_date': dueDate,
      if (duePhrase != null) 'due_phrase': duePhrase,
      if (dueCheck != null) 'due_check': dueCheck,
      if (confidence != null) 'confidence': confidence,
      if (status != null) 'status': status,
      if (origin != null) 'origin': origin,
      if (userEdited != null) 'user_edited': userEdited,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemCompanion copyWith({
    Value<String>? id,
    Value<String>? momentId,
    Value<String>? type,
    Value<String>? text$,
    Value<String?>? ownerSpeakerId,
    Value<String?>? ownerPersonId,
    Value<String?>? ownerFromUtteranceId,
    Value<String?>? counterpartSpeakerId,
    Value<String?>? counterpartPersonId,
    Value<String?>? dueDate,
    Value<String?>? duePhrase,
    Value<String?>? dueCheck,
    Value<double>? confidence,
    Value<String>? status,
    Value<String>? origin,
    Value<int>? userEdited,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return ItemCompanion(
      id: id ?? this.id,
      momentId: momentId ?? this.momentId,
      type: type ?? this.type,
      text$: text$ ?? this.text$,
      ownerSpeakerId: ownerSpeakerId ?? this.ownerSpeakerId,
      ownerPersonId: ownerPersonId ?? this.ownerPersonId,
      ownerFromUtteranceId: ownerFromUtteranceId ?? this.ownerFromUtteranceId,
      counterpartSpeakerId: counterpartSpeakerId ?? this.counterpartSpeakerId,
      counterpartPersonId: counterpartPersonId ?? this.counterpartPersonId,
      dueDate: dueDate ?? this.dueDate,
      duePhrase: duePhrase ?? this.duePhrase,
      dueCheck: dueCheck ?? this.dueCheck,
      confidence: confidence ?? this.confidence,
      status: status ?? this.status,
      origin: origin ?? this.origin,
      userEdited: userEdited ?? this.userEdited,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (momentId.present) {
      map['moment_id'] = Variable<String>(momentId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (text$.present) {
      map['text'] = Variable<String>(text$.value);
    }
    if (ownerSpeakerId.present) {
      map['owner_speaker_id'] = Variable<String>(ownerSpeakerId.value);
    }
    if (ownerPersonId.present) {
      map['owner_person_id'] = Variable<String>(ownerPersonId.value);
    }
    if (ownerFromUtteranceId.present) {
      map['owner_from_utterance_id'] = Variable<String>(ownerFromUtteranceId.value);
    }
    if (counterpartSpeakerId.present) {
      map['counterpart_speaker_id'] = Variable<String>(counterpartSpeakerId.value);
    }
    if (counterpartPersonId.present) {
      map['counterpart_person_id'] = Variable<String>(counterpartPersonId.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<String>(dueDate.value);
    }
    if (duePhrase.present) {
      map['due_phrase'] = Variable<String>(duePhrase.value);
    }
    if (dueCheck.present) {
      map['due_check'] = Variable<String>(dueCheck.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (userEdited.present) {
      map['user_edited'] = Variable<int>(userEdited.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemCompanion(')
          ..write('id: $id, ')
          ..write('momentId: $momentId, ')
          ..write('type: $type, ')
          ..write('text\$: ${text$}, ')
          ..write('ownerSpeakerId: $ownerSpeakerId, ')
          ..write('ownerPersonId: $ownerPersonId, ')
          ..write('ownerFromUtteranceId: $ownerFromUtteranceId, ')
          ..write('counterpartSpeakerId: $counterpartSpeakerId, ')
          ..write('counterpartPersonId: $counterpartPersonId, ')
          ..write('dueDate: $dueDate, ')
          ..write('duePhrase: $duePhrase, ')
          ..write('dueCheck: $dueCheck, ')
          ..write('confidence: $confidence, ')
          ..write('status: $status, ')
          ..write('origin: $origin, ')
          ..write('userEdited: $userEdited, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ItemViewData extends DataClass {
  final String id;
  final String momentId;
  final String type;
  final String text;
  final String? ownerSpeakerId;
  final String? ownerPersonId;
  final String? ownerFromUtteranceId;
  final String? counterpartSpeakerId;
  final String? counterpartPersonId;
  final String? dueDate;
  final String? duePhrase;
  final String? dueCheck;
  final double confidence;
  final String status;
  final String origin;
  final int userEdited;
  final int createdAt;
  final int updatedAt;
  final String direction;
  const ItemViewData({
    required this.id,
    required this.momentId,
    required this.type,
    required this.text,
    this.ownerSpeakerId,
    this.ownerPersonId,
    this.ownerFromUtteranceId,
    this.counterpartSpeakerId,
    this.counterpartPersonId,
    this.dueDate,
    this.duePhrase,
    this.dueCheck,
    required this.confidence,
    required this.status,
    required this.origin,
    required this.userEdited,
    required this.createdAt,
    required this.updatedAt,
    required this.direction,
  });
  factory ItemViewData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemViewData(
      id: serializer.fromJson<String>(json['id']),
      momentId: serializer.fromJson<String>(json['moment_id']),
      type: serializer.fromJson<String>(json['type']),
      text: serializer.fromJson<String>(json['text']),
      ownerSpeakerId: serializer.fromJson<String?>(json['owner_speaker_id']),
      ownerPersonId: serializer.fromJson<String?>(json['owner_person_id']),
      ownerFromUtteranceId: serializer.fromJson<String?>(json['owner_from_utterance_id']),
      counterpartSpeakerId: serializer.fromJson<String?>(json['counterpart_speaker_id']),
      counterpartPersonId: serializer.fromJson<String?>(json['counterpart_person_id']),
      dueDate: serializer.fromJson<String?>(json['due_date']),
      duePhrase: serializer.fromJson<String?>(json['due_phrase']),
      dueCheck: serializer.fromJson<String?>(json['due_check']),
      confidence: serializer.fromJson<double>(json['confidence']),
      status: serializer.fromJson<String>(json['status']),
      origin: serializer.fromJson<String>(json['origin']),
      userEdited: serializer.fromJson<int>(json['user_edited']),
      createdAt: serializer.fromJson<int>(json['created_at']),
      updatedAt: serializer.fromJson<int>(json['updated_at']),
      direction: serializer.fromJson<String>(json['direction']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'moment_id': serializer.toJson<String>(momentId),
      'type': serializer.toJson<String>(type),
      'text': serializer.toJson<String>(text),
      'owner_speaker_id': serializer.toJson<String?>(ownerSpeakerId),
      'owner_person_id': serializer.toJson<String?>(ownerPersonId),
      'owner_from_utterance_id': serializer.toJson<String?>(ownerFromUtteranceId),
      'counterpart_speaker_id': serializer.toJson<String?>(counterpartSpeakerId),
      'counterpart_person_id': serializer.toJson<String?>(counterpartPersonId),
      'due_date': serializer.toJson<String?>(dueDate),
      'due_phrase': serializer.toJson<String?>(duePhrase),
      'due_check': serializer.toJson<String?>(dueCheck),
      'confidence': serializer.toJson<double>(confidence),
      'status': serializer.toJson<String>(status),
      'origin': serializer.toJson<String>(origin),
      'user_edited': serializer.toJson<int>(userEdited),
      'created_at': serializer.toJson<int>(createdAt),
      'updated_at': serializer.toJson<int>(updatedAt),
      'direction': serializer.toJson<String>(direction),
    };
  }

  ItemViewData copyWith({
    String? id,
    String? momentId,
    String? type,
    String? text,
    Value<String?> ownerSpeakerId = const Value.absent(),
    Value<String?> ownerPersonId = const Value.absent(),
    Value<String?> ownerFromUtteranceId = const Value.absent(),
    Value<String?> counterpartSpeakerId = const Value.absent(),
    Value<String?> counterpartPersonId = const Value.absent(),
    Value<String?> dueDate = const Value.absent(),
    Value<String?> duePhrase = const Value.absent(),
    Value<String?> dueCheck = const Value.absent(),
    double? confidence,
    String? status,
    String? origin,
    int? userEdited,
    int? createdAt,
    int? updatedAt,
    String? direction,
  }) => ItemViewData(
    id: id ?? this.id,
    momentId: momentId ?? this.momentId,
    type: type ?? this.type,
    text: text ?? this.text,
    ownerSpeakerId: ownerSpeakerId.present ? ownerSpeakerId.value : this.ownerSpeakerId,
    ownerPersonId: ownerPersonId.present ? ownerPersonId.value : this.ownerPersonId,
    ownerFromUtteranceId: ownerFromUtteranceId.present ? ownerFromUtteranceId.value : this.ownerFromUtteranceId,
    counterpartSpeakerId: counterpartSpeakerId.present ? counterpartSpeakerId.value : this.counterpartSpeakerId,
    counterpartPersonId: counterpartPersonId.present ? counterpartPersonId.value : this.counterpartPersonId,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    duePhrase: duePhrase.present ? duePhrase.value : this.duePhrase,
    dueCheck: dueCheck.present ? dueCheck.value : this.dueCheck,
    confidence: confidence ?? this.confidence,
    status: status ?? this.status,
    origin: origin ?? this.origin,
    userEdited: userEdited ?? this.userEdited,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    direction: direction ?? this.direction,
  );
  @override
  String toString() {
    return (StringBuffer('ItemViewData(')
          ..write('id: $id, ')
          ..write('momentId: $momentId, ')
          ..write('type: $type, ')
          ..write('text: $text, ')
          ..write('ownerSpeakerId: $ownerSpeakerId, ')
          ..write('ownerPersonId: $ownerPersonId, ')
          ..write('ownerFromUtteranceId: $ownerFromUtteranceId, ')
          ..write('counterpartSpeakerId: $counterpartSpeakerId, ')
          ..write('counterpartPersonId: $counterpartPersonId, ')
          ..write('dueDate: $dueDate, ')
          ..write('duePhrase: $duePhrase, ')
          ..write('dueCheck: $dueCheck, ')
          ..write('confidence: $confidence, ')
          ..write('status: $status, ')
          ..write('origin: $origin, ')
          ..write('userEdited: $userEdited, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('direction: $direction')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    momentId,
    type,
    text,
    ownerSpeakerId,
    ownerPersonId,
    ownerFromUtteranceId,
    counterpartSpeakerId,
    counterpartPersonId,
    dueDate,
    duePhrase,
    dueCheck,
    confidence,
    status,
    origin,
    userEdited,
    createdAt,
    updatedAt,
    direction,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemViewData &&
          other.id == this.id &&
          other.momentId == this.momentId &&
          other.type == this.type &&
          other.text == this.text &&
          other.ownerSpeakerId == this.ownerSpeakerId &&
          other.ownerPersonId == this.ownerPersonId &&
          other.ownerFromUtteranceId == this.ownerFromUtteranceId &&
          other.counterpartSpeakerId == this.counterpartSpeakerId &&
          other.counterpartPersonId == this.counterpartPersonId &&
          other.dueDate == this.dueDate &&
          other.duePhrase == this.duePhrase &&
          other.dueCheck == this.dueCheck &&
          other.confidence == this.confidence &&
          other.status == this.status &&
          other.origin == this.origin &&
          other.userEdited == this.userEdited &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.direction == this.direction);
}

class ItemView extends ViewInfo<ItemView, ItemViewData> implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDatabase attachedDatabase;
  ItemView(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    momentId,
    type,
    text,
    ownerSpeakerId,
    ownerPersonId,
    ownerFromUtteranceId,
    counterpartSpeakerId,
    counterpartPersonId,
    dueDate,
    duePhrase,
    dueCheck,
    confidence,
    status,
    origin,
    userEdited,
    createdAt,
    updatedAt,
    direction,
  ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'item_view';
  @override
  Map<SqlDialect, String> get createViewStatements => {
    SqlDialect.sqlite: 'CREATE VIEW item_view AS SELECT i.*, CASE WHEN COALESCE(os.is_self, op.is_self, 0) = 1 THEN \'by_user\' WHEN COALESCE(cs.is_self, cp.is_self, 0) = 1 THEN \'to_user\' ELSE \'other\' END AS direction FROM item AS i LEFT JOIN speaker AS os ON os.id = i.owner_speaker_id LEFT JOIN person AS op ON op.id = i.owner_person_id LEFT JOIN speaker AS cs ON cs.id = i.counterpart_speaker_id LEFT JOIN person AS cp ON cp.id = i.counterpart_person_id',
  };
  @override
  ItemView get asDslTable => this;
  @override
  ItemViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemViewData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      momentId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}moment_id'])!,
      type: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      text: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}text'])!,
      ownerSpeakerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_speaker_id'],
      ),
      ownerPersonId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}owner_person_id']),
      ownerFromUtteranceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_from_utterance_id'],
      ),
      counterpartSpeakerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}counterpart_speaker_id'],
      ),
      counterpartPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}counterpart_person_id'],
      ),
      dueDate: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}due_date']),
      duePhrase: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}due_phrase']),
      dueCheck: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}due_check']),
      confidence: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}confidence'])!,
      status: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      origin: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}origin'])!,
      userEdited: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}user_edited'])!,
      createdAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
      direction: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>('id', aliasedName, false, type: DriftSqlType.string);
  late final GeneratedColumn<String> momentId = GeneratedColumn<String>(
    'moment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> text = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> ownerSpeakerId = GeneratedColumn<String>(
    'owner_speaker_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> ownerPersonId = GeneratedColumn<String>(
    'owner_person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> ownerFromUtteranceId = GeneratedColumn<String>(
    'owner_from_utterance_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> counterpartSpeakerId = GeneratedColumn<String>(
    'counterpart_speaker_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> counterpartPersonId = GeneratedColumn<String>(
    'counterpart_person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> dueDate = GeneratedColumn<String>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> duePhrase = GeneratedColumn<String>(
    'due_phrase',
    aliasedName,
    true,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> dueCheck = GeneratedColumn<String>(
    'due_check',
    aliasedName,
    true,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
  );
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    false,
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<int> userEdited = GeneratedColumn<int>(
    'user_edited',
    aliasedName,
    false,
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
  );
  @override
  ItemView createAlias(String alias) {
    return ItemView(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'item', 'speaker', 'person', 'session', 'moment', 'utterance'};
}

class ItemSource extends Table with TableInfo<ItemSource, ItemSourceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ItemSource(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES item(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _utteranceIdMeta = const VerificationMeta('utteranceId');
  late final GeneratedColumn<String> utteranceId = GeneratedColumn<String>(
    'utterance_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES utterance(id)ON DELETE CASCADE',
  );
  @override
  List<GeneratedColumn> get $columns => [itemId, utteranceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_source';
  @override
  VerificationContext validateIntegrity(Insertable<ItemSourceData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta, itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('utterance_id')) {
      context.handle(_utteranceIdMeta, utteranceId.isAcceptableOrUnknown(data['utterance_id']!, _utteranceIdMeta));
    } else if (isInserting) {
      context.missing(_utteranceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemId, utteranceId};
  @override
  ItemSourceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemSourceData(
      itemId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      utteranceId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}utterance_id'])!,
    );
  }

  @override
  ItemSource createAlias(String alias) {
    return ItemSource(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(item_id, utterance_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class ItemSourceData extends DataClass implements Insertable<ItemSourceData> {
  final String itemId;
  final String utteranceId;
  const ItemSourceData({required this.itemId, required this.utteranceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['utterance_id'] = Variable<String>(utteranceId);
    return map;
  }

  ItemSourceCompanion toCompanion(bool nullToAbsent) {
    return ItemSourceCompanion(itemId: Value(itemId), utteranceId: Value(utteranceId));
  }

  factory ItemSourceData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemSourceData(
      itemId: serializer.fromJson<String>(json['item_id']),
      utteranceId: serializer.fromJson<String>(json['utterance_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'item_id': serializer.toJson<String>(itemId),
      'utterance_id': serializer.toJson<String>(utteranceId),
    };
  }

  ItemSourceData copyWith({String? itemId, String? utteranceId}) =>
      ItemSourceData(itemId: itemId ?? this.itemId, utteranceId: utteranceId ?? this.utteranceId);
  ItemSourceData copyWithCompanion(ItemSourceCompanion data) {
    return ItemSourceData(
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      utteranceId: data.utteranceId.present ? data.utteranceId.value : this.utteranceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemSourceData(')
          ..write('itemId: $itemId, ')
          ..write('utteranceId: $utteranceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, utteranceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemSourceData && other.itemId == this.itemId && other.utteranceId == this.utteranceId);
}

class ItemSourceCompanion extends UpdateCompanion<ItemSourceData> {
  final Value<String> itemId;
  final Value<String> utteranceId;
  final Value<int> rowid;
  const ItemSourceCompanion({
    this.itemId = const Value.absent(),
    this.utteranceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemSourceCompanion.insert({required String itemId, required String utteranceId, this.rowid = const Value.absent()})
    : itemId = Value(itemId),
      utteranceId = Value(utteranceId);
  static Insertable<ItemSourceData> custom({
    Expression<String>? itemId,
    Expression<String>? utteranceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (utteranceId != null) 'utterance_id': utteranceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemSourceCompanion copyWith({Value<String>? itemId, Value<String>? utteranceId, Value<int>? rowid}) {
    return ItemSourceCompanion(
      itemId: itemId ?? this.itemId,
      utteranceId: utteranceId ?? this.utteranceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (utteranceId.present) {
      map['utterance_id'] = Variable<String>(utteranceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemSourceCompanion(')
          ..write('itemId: $itemId, ')
          ..write('utteranceId: $utteranceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Media extends Table with TableInfo<Media, MediaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Media(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES session(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (kind IN (\'audio\', \'video\', \'photo\'))',
  );
  static const VerificationMeta _relPathMeta = const VerificationMeta('relPath');
  late final GeneratedColumn<String> relPath = GeneratedColumn<String>(
    'rel_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _startMsMeta = const VerificationMeta('startMs');
  late final GeneratedColumn<int> startMs = GeneratedColumn<int>(
    'start_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _endMsMeta = const VerificationMeta('endMs');
  late final GeneratedColumn<int> endMs = GeneratedColumn<int>(
    'end_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _bytesMeta = const VerificationMeta('bytes');
  late final GeneratedColumn<int> bytes = GeneratedColumn<int>(
    'bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _codecMeta = const VerificationMeta('codec');
  late final GeneratedColumn<String> codec = GeneratedColumn<String>(
    'codec',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _deleteAtMeta = const VerificationMeta('deleteAt');
  late final GeneratedColumn<int> deleteAt = GeneratedColumn<int>(
    'delete_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  late final GeneratedColumn<int> deletedAt = GeneratedColumn<int>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    kind,
    relPath,
    startMs,
    endMs,
    bytes,
    codec,
    deleteAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media';
  @override
  VerificationContext validateIntegrity(Insertable<MediaData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta, sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(_kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('rel_path')) {
      context.handle(_relPathMeta, relPath.isAcceptableOrUnknown(data['rel_path']!, _relPathMeta));
    } else if (isInserting) {
      context.missing(_relPathMeta);
    }
    if (data.containsKey('start_ms')) {
      context.handle(_startMsMeta, startMs.isAcceptableOrUnknown(data['start_ms']!, _startMsMeta));
    } else if (isInserting) {
      context.missing(_startMsMeta);
    }
    if (data.containsKey('end_ms')) {
      context.handle(_endMsMeta, endMs.isAcceptableOrUnknown(data['end_ms']!, _endMsMeta));
    } else if (isInserting) {
      context.missing(_endMsMeta);
    }
    if (data.containsKey('bytes')) {
      context.handle(_bytesMeta, bytes.isAcceptableOrUnknown(data['bytes']!, _bytesMeta));
    } else if (isInserting) {
      context.missing(_bytesMeta);
    }
    if (data.containsKey('codec')) {
      context.handle(_codecMeta, codec.isAcceptableOrUnknown(data['codec']!, _codecMeta));
    } else if (isInserting) {
      context.missing(_codecMeta);
    }
    if (data.containsKey('delete_at')) {
      context.handle(_deleteAtMeta, deleteAt.isAcceptableOrUnknown(data['delete_at']!, _deleteAtMeta));
    } else if (isInserting) {
      context.missing(_deleteAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta, deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      kind: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      relPath: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}rel_path'])!,
      startMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}start_ms'])!,
      endMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}end_ms'])!,
      bytes: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}bytes'])!,
      codec: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}codec'])!,
      deleteAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}delete_at'])!,
      deletedAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  Media createAlias(String alias) {
    return Media(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MediaData extends DataClass implements Insertable<MediaData> {
  final String id;
  final String sessionId;
  final String kind;
  final String relPath;
  final int startMs;
  final int endMs;
  final int bytes;
  final String codec;

  /// aac-adts-24k (D8)
  final int deleteAt;

  /// I8
  final int? deletedAt;
  const MediaData({
    required this.id,
    required this.sessionId,
    required this.kind,
    required this.relPath,
    required this.startMs,
    required this.endMs,
    required this.bytes,
    required this.codec,
    required this.deleteAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['kind'] = Variable<String>(kind);
    map['rel_path'] = Variable<String>(relPath);
    map['start_ms'] = Variable<int>(startMs);
    map['end_ms'] = Variable<int>(endMs);
    map['bytes'] = Variable<int>(bytes);
    map['codec'] = Variable<String>(codec);
    map['delete_at'] = Variable<int>(deleteAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(deletedAt);
    }
    return map;
  }

  MediaCompanion toCompanion(bool nullToAbsent) {
    return MediaCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      kind: Value(kind),
      relPath: Value(relPath),
      startMs: Value(startMs),
      endMs: Value(endMs),
      bytes: Value(bytes),
      codec: Value(codec),
      deleteAt: Value(deleteAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
    );
  }

  factory MediaData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaData(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['session_id']),
      kind: serializer.fromJson<String>(json['kind']),
      relPath: serializer.fromJson<String>(json['rel_path']),
      startMs: serializer.fromJson<int>(json['start_ms']),
      endMs: serializer.fromJson<int>(json['end_ms']),
      bytes: serializer.fromJson<int>(json['bytes']),
      codec: serializer.fromJson<String>(json['codec']),
      deleteAt: serializer.fromJson<int>(json['delete_at']),
      deletedAt: serializer.fromJson<int?>(json['deleted_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'session_id': serializer.toJson<String>(sessionId),
      'kind': serializer.toJson<String>(kind),
      'rel_path': serializer.toJson<String>(relPath),
      'start_ms': serializer.toJson<int>(startMs),
      'end_ms': serializer.toJson<int>(endMs),
      'bytes': serializer.toJson<int>(bytes),
      'codec': serializer.toJson<String>(codec),
      'delete_at': serializer.toJson<int>(deleteAt),
      'deleted_at': serializer.toJson<int?>(deletedAt),
    };
  }

  MediaData copyWith({
    String? id,
    String? sessionId,
    String? kind,
    String? relPath,
    int? startMs,
    int? endMs,
    int? bytes,
    String? codec,
    int? deleteAt,
    Value<int?> deletedAt = const Value.absent(),
  }) => MediaData(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    kind: kind ?? this.kind,
    relPath: relPath ?? this.relPath,
    startMs: startMs ?? this.startMs,
    endMs: endMs ?? this.endMs,
    bytes: bytes ?? this.bytes,
    codec: codec ?? this.codec,
    deleteAt: deleteAt ?? this.deleteAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  MediaData copyWithCompanion(MediaCompanion data) {
    return MediaData(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      kind: data.kind.present ? data.kind.value : this.kind,
      relPath: data.relPath.present ? data.relPath.value : this.relPath,
      startMs: data.startMs.present ? data.startMs.value : this.startMs,
      endMs: data.endMs.present ? data.endMs.value : this.endMs,
      bytes: data.bytes.present ? data.bytes.value : this.bytes,
      codec: data.codec.present ? data.codec.value : this.codec,
      deleteAt: data.deleteAt.present ? data.deleteAt.value : this.deleteAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('kind: $kind, ')
          ..write('relPath: $relPath, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('bytes: $bytes, ')
          ..write('codec: $codec, ')
          ..write('deleteAt: $deleteAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, kind, relPath, startMs, endMs, bytes, codec, deleteAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.kind == this.kind &&
          other.relPath == this.relPath &&
          other.startMs == this.startMs &&
          other.endMs == this.endMs &&
          other.bytes == this.bytes &&
          other.codec == this.codec &&
          other.deleteAt == this.deleteAt &&
          other.deletedAt == this.deletedAt);
}

class MediaCompanion extends UpdateCompanion<MediaData> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> kind;
  final Value<String> relPath;
  final Value<int> startMs;
  final Value<int> endMs;
  final Value<int> bytes;
  final Value<String> codec;
  final Value<int> deleteAt;
  final Value<int?> deletedAt;
  final Value<int> rowid;
  const MediaCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.kind = const Value.absent(),
    this.relPath = const Value.absent(),
    this.startMs = const Value.absent(),
    this.endMs = const Value.absent(),
    this.bytes = const Value.absent(),
    this.codec = const Value.absent(),
    this.deleteAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaCompanion.insert({
    required String id,
    required String sessionId,
    required String kind,
    required String relPath,
    required int startMs,
    required int endMs,
    required int bytes,
    required String codec,
    required int deleteAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       kind = Value(kind),
       relPath = Value(relPath),
       startMs = Value(startMs),
       endMs = Value(endMs),
       bytes = Value(bytes),
       codec = Value(codec),
       deleteAt = Value(deleteAt);
  static Insertable<MediaData> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? kind,
    Expression<String>? relPath,
    Expression<int>? startMs,
    Expression<int>? endMs,
    Expression<int>? bytes,
    Expression<String>? codec,
    Expression<int>? deleteAt,
    Expression<int>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (kind != null) 'kind': kind,
      if (relPath != null) 'rel_path': relPath,
      if (startMs != null) 'start_ms': startMs,
      if (endMs != null) 'end_ms': endMs,
      if (bytes != null) 'bytes': bytes,
      if (codec != null) 'codec': codec,
      if (deleteAt != null) 'delete_at': deleteAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String>? kind,
    Value<String>? relPath,
    Value<int>? startMs,
    Value<int>? endMs,
    Value<int>? bytes,
    Value<String>? codec,
    Value<int>? deleteAt,
    Value<int?>? deletedAt,
    Value<int>? rowid,
  }) {
    return MediaCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      kind: kind ?? this.kind,
      relPath: relPath ?? this.relPath,
      startMs: startMs ?? this.startMs,
      endMs: endMs ?? this.endMs,
      bytes: bytes ?? this.bytes,
      codec: codec ?? this.codec,
      deleteAt: deleteAt ?? this.deleteAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (relPath.present) {
      map['rel_path'] = Variable<String>(relPath.value);
    }
    if (startMs.present) {
      map['start_ms'] = Variable<int>(startMs.value);
    }
    if (endMs.present) {
      map['end_ms'] = Variable<int>(endMs.value);
    }
    if (bytes.present) {
      map['bytes'] = Variable<int>(bytes.value);
    }
    if (codec.present) {
      map['codec'] = Variable<String>(codec.value);
    }
    if (deleteAt.present) {
      map['delete_at'] = Variable<int>(deleteAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('kind: $kind, ')
          ..write('relPath: $relPath, ')
          ..write('startMs: $startMs, ')
          ..write('endMs: $endMs, ')
          ..write('bytes: $bytes, ')
          ..write('codec: $codec, ')
          ..write('deleteAt: $deleteAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Mark extends Table with TableInfo<Mark, MarkData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Mark(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta('sessionId');
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES session(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _atMsMeta = const VerificationMeta('atMs');
  late final GeneratedColumn<int> atMs = GeneratedColumn<int>(
    'at_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (source IN (\'button\', \'live_activity\', \'voice\', \'watch\'))',
  );
  @override
  List<GeneratedColumn> get $columns => [id, sessionId, atMs, source];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mark';
  @override
  VerificationContext validateIntegrity(Insertable<MarkData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta, sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('at_ms')) {
      context.handle(_atMsMeta, atMs.isAcceptableOrUnknown(data['at_ms']!, _atMsMeta));
    } else if (isInserting) {
      context.missing(_atMsMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta, source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MarkData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MarkData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      atMs: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}at_ms'])!,
      source: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}source'])!,
    );
  }

  @override
  Mark createAlias(String alias) {
    return Mark(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MarkData extends DataClass implements Insertable<MarkData> {
  final String id;
  final String sessionId;
  final int atMs;
  final String source;
  const MarkData({required this.id, required this.sessionId, required this.atMs, required this.source});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['at_ms'] = Variable<int>(atMs);
    map['source'] = Variable<String>(source);
    return map;
  }

  MarkCompanion toCompanion(bool nullToAbsent) {
    return MarkCompanion(id: Value(id), sessionId: Value(sessionId), atMs: Value(atMs), source: Value(source));
  }

  factory MarkData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MarkData(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['session_id']),
      atMs: serializer.fromJson<int>(json['at_ms']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'session_id': serializer.toJson<String>(sessionId),
      'at_ms': serializer.toJson<int>(atMs),
      'source': serializer.toJson<String>(source),
    };
  }

  MarkData copyWith({String? id, String? sessionId, int? atMs, String? source}) => MarkData(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    atMs: atMs ?? this.atMs,
    source: source ?? this.source,
  );
  MarkData copyWithCompanion(MarkCompanion data) {
    return MarkData(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      atMs: data.atMs.present ? data.atMs.value : this.atMs,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MarkData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('atMs: $atMs, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, atMs, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarkData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.atMs == this.atMs &&
          other.source == this.source);
}

class MarkCompanion extends UpdateCompanion<MarkData> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<int> atMs;
  final Value<String> source;
  final Value<int> rowid;
  const MarkCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.atMs = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MarkCompanion.insert({
    required String id,
    required String sessionId,
    required int atMs,
    required String source,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       atMs = Value(atMs),
       source = Value(source);
  static Insertable<MarkData> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<int>? atMs,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (atMs != null) 'at_ms': atMs,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MarkCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<int>? atMs,
    Value<String>? source,
    Value<int>? rowid,
  }) {
    return MarkCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      atMs: atMs ?? this.atMs,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (atMs.present) {
      map['at_ms'] = Variable<int>(atMs.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarkCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('atMs: $atMs, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Recap extends Table with TableInfo<Recap, RecapData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Recap(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  static const VerificationMeta _cutoffAtMeta = const VerificationMeta('cutoffAt');
  late final GeneratedColumn<int> cutoffAt = GeneratedColumn<int>(
    'cutoff_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta('generatedAt');
  late final GeneratedColumn<int> generatedAt = GeneratedColumn<int>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _modelVersionMeta = const VerificationMeta('modelVersion');
  late final GeneratedColumn<String> modelVersion = GeneratedColumn<String>(
    'model_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _quietDayMeta = const VerificationMeta('quietDay');
  late final GeneratedColumn<int> quietDay = GeneratedColumn<int>(
    'quiet_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _funLineMeta = const VerificationMeta('funLine');
  late final GeneratedColumn<String> funLine = GeneratedColumn<String>(
    'fun_line',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _openedAtMeta = const VerificationMeta('openedAt');
  late final GeneratedColumn<int> openedAt = GeneratedColumn<int>(
    'opened_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [id, day, cutoffAt, generatedAt, modelVersion, quietDay, funLine, openedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recap';
  @override
  VerificationContext validateIntegrity(Insertable<RecapData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('day')) {
      context.handle(_dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('cutoff_at')) {
      context.handle(_cutoffAtMeta, cutoffAt.isAcceptableOrUnknown(data['cutoff_at']!, _cutoffAtMeta));
    } else if (isInserting) {
      context.missing(_cutoffAtMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(_generatedAtMeta, generatedAt.isAcceptableOrUnknown(data['generated_at']!, _generatedAtMeta));
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('model_version')) {
      context.handle(_modelVersionMeta, modelVersion.isAcceptableOrUnknown(data['model_version']!, _modelVersionMeta));
    } else if (isInserting) {
      context.missing(_modelVersionMeta);
    }
    if (data.containsKey('quiet_day')) {
      context.handle(_quietDayMeta, quietDay.isAcceptableOrUnknown(data['quiet_day']!, _quietDayMeta));
    }
    if (data.containsKey('fun_line')) {
      context.handle(_funLineMeta, funLine.isAcceptableOrUnknown(data['fun_line']!, _funLineMeta));
    }
    if (data.containsKey('opened_at')) {
      context.handle(_openedAtMeta, openedAt.isAcceptableOrUnknown(data['opened_at']!, _openedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecapData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecapData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      day: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}day'])!,
      cutoffAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}cutoff_at'])!,
      generatedAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}generated_at'])!,
      modelVersion: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}model_version'])!,
      quietDay: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}quiet_day'])!,
      funLine: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}fun_line']),
      openedAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}opened_at']),
    );
  }

  @override
  Recap createAlias(String alias) {
    return Recap(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class RecapData extends DataClass implements Insertable<RecapData> {
  final String id;
  final String day;

  /// YYYY-MM-DD local
  final int cutoffAt;
  final int generatedAt;
  final String modelVersion;

  /// 'local-fallback' for §9.6
  final int quietDay;
  final String? funLine;

  /// with placeholders
  final int? openedAt;
  const RecapData({
    required this.id,
    required this.day,
    required this.cutoffAt,
    required this.generatedAt,
    required this.modelVersion,
    required this.quietDay,
    this.funLine,
    this.openedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['day'] = Variable<String>(day);
    map['cutoff_at'] = Variable<int>(cutoffAt);
    map['generated_at'] = Variable<int>(generatedAt);
    map['model_version'] = Variable<String>(modelVersion);
    map['quiet_day'] = Variable<int>(quietDay);
    if (!nullToAbsent || funLine != null) {
      map['fun_line'] = Variable<String>(funLine);
    }
    if (!nullToAbsent || openedAt != null) {
      map['opened_at'] = Variable<int>(openedAt);
    }
    return map;
  }

  RecapCompanion toCompanion(bool nullToAbsent) {
    return RecapCompanion(
      id: Value(id),
      day: Value(day),
      cutoffAt: Value(cutoffAt),
      generatedAt: Value(generatedAt),
      modelVersion: Value(modelVersion),
      quietDay: Value(quietDay),
      funLine: funLine == null && nullToAbsent ? const Value.absent() : Value(funLine),
      openedAt: openedAt == null && nullToAbsent ? const Value.absent() : Value(openedAt),
    );
  }

  factory RecapData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecapData(
      id: serializer.fromJson<String>(json['id']),
      day: serializer.fromJson<String>(json['day']),
      cutoffAt: serializer.fromJson<int>(json['cutoff_at']),
      generatedAt: serializer.fromJson<int>(json['generated_at']),
      modelVersion: serializer.fromJson<String>(json['model_version']),
      quietDay: serializer.fromJson<int>(json['quiet_day']),
      funLine: serializer.fromJson<String?>(json['fun_line']),
      openedAt: serializer.fromJson<int?>(json['opened_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'day': serializer.toJson<String>(day),
      'cutoff_at': serializer.toJson<int>(cutoffAt),
      'generated_at': serializer.toJson<int>(generatedAt),
      'model_version': serializer.toJson<String>(modelVersion),
      'quiet_day': serializer.toJson<int>(quietDay),
      'fun_line': serializer.toJson<String?>(funLine),
      'opened_at': serializer.toJson<int?>(openedAt),
    };
  }

  RecapData copyWith({
    String? id,
    String? day,
    int? cutoffAt,
    int? generatedAt,
    String? modelVersion,
    int? quietDay,
    Value<String?> funLine = const Value.absent(),
    Value<int?> openedAt = const Value.absent(),
  }) => RecapData(
    id: id ?? this.id,
    day: day ?? this.day,
    cutoffAt: cutoffAt ?? this.cutoffAt,
    generatedAt: generatedAt ?? this.generatedAt,
    modelVersion: modelVersion ?? this.modelVersion,
    quietDay: quietDay ?? this.quietDay,
    funLine: funLine.present ? funLine.value : this.funLine,
    openedAt: openedAt.present ? openedAt.value : this.openedAt,
  );
  RecapData copyWithCompanion(RecapCompanion data) {
    return RecapData(
      id: data.id.present ? data.id.value : this.id,
      day: data.day.present ? data.day.value : this.day,
      cutoffAt: data.cutoffAt.present ? data.cutoffAt.value : this.cutoffAt,
      generatedAt: data.generatedAt.present ? data.generatedAt.value : this.generatedAt,
      modelVersion: data.modelVersion.present ? data.modelVersion.value : this.modelVersion,
      quietDay: data.quietDay.present ? data.quietDay.value : this.quietDay,
      funLine: data.funLine.present ? data.funLine.value : this.funLine,
      openedAt: data.openedAt.present ? data.openedAt.value : this.openedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecapData(')
          ..write('id: $id, ')
          ..write('day: $day, ')
          ..write('cutoffAt: $cutoffAt, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('quietDay: $quietDay, ')
          ..write('funLine: $funLine, ')
          ..write('openedAt: $openedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, day, cutoffAt, generatedAt, modelVersion, quietDay, funLine, openedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecapData &&
          other.id == this.id &&
          other.day == this.day &&
          other.cutoffAt == this.cutoffAt &&
          other.generatedAt == this.generatedAt &&
          other.modelVersion == this.modelVersion &&
          other.quietDay == this.quietDay &&
          other.funLine == this.funLine &&
          other.openedAt == this.openedAt);
}

class RecapCompanion extends UpdateCompanion<RecapData> {
  final Value<String> id;
  final Value<String> day;
  final Value<int> cutoffAt;
  final Value<int> generatedAt;
  final Value<String> modelVersion;
  final Value<int> quietDay;
  final Value<String?> funLine;
  final Value<int?> openedAt;
  final Value<int> rowid;
  const RecapCompanion({
    this.id = const Value.absent(),
    this.day = const Value.absent(),
    this.cutoffAt = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.modelVersion = const Value.absent(),
    this.quietDay = const Value.absent(),
    this.funLine = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecapCompanion.insert({
    required String id,
    required String day,
    required int cutoffAt,
    required int generatedAt,
    required String modelVersion,
    this.quietDay = const Value.absent(),
    this.funLine = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       day = Value(day),
       cutoffAt = Value(cutoffAt),
       generatedAt = Value(generatedAt),
       modelVersion = Value(modelVersion);
  static Insertable<RecapData> custom({
    Expression<String>? id,
    Expression<String>? day,
    Expression<int>? cutoffAt,
    Expression<int>? generatedAt,
    Expression<String>? modelVersion,
    Expression<int>? quietDay,
    Expression<String>? funLine,
    Expression<int>? openedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (day != null) 'day': day,
      if (cutoffAt != null) 'cutoff_at': cutoffAt,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (modelVersion != null) 'model_version': modelVersion,
      if (quietDay != null) 'quiet_day': quietDay,
      if (funLine != null) 'fun_line': funLine,
      if (openedAt != null) 'opened_at': openedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecapCompanion copyWith({
    Value<String>? id,
    Value<String>? day,
    Value<int>? cutoffAt,
    Value<int>? generatedAt,
    Value<String>? modelVersion,
    Value<int>? quietDay,
    Value<String?>? funLine,
    Value<int?>? openedAt,
    Value<int>? rowid,
  }) {
    return RecapCompanion(
      id: id ?? this.id,
      day: day ?? this.day,
      cutoffAt: cutoffAt ?? this.cutoffAt,
      generatedAt: generatedAt ?? this.generatedAt,
      modelVersion: modelVersion ?? this.modelVersion,
      quietDay: quietDay ?? this.quietDay,
      funLine: funLine ?? this.funLine,
      openedAt: openedAt ?? this.openedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (cutoffAt.present) {
      map['cutoff_at'] = Variable<int>(cutoffAt.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<int>(generatedAt.value);
    }
    if (modelVersion.present) {
      map['model_version'] = Variable<String>(modelVersion.value);
    }
    if (quietDay.present) {
      map['quiet_day'] = Variable<int>(quietDay.value);
    }
    if (funLine.present) {
      map['fun_line'] = Variable<String>(funLine.value);
    }
    if (openedAt.present) {
      map['opened_at'] = Variable<int>(openedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecapCompanion(')
          ..write('id: $id, ')
          ..write('day: $day, ')
          ..write('cutoffAt: $cutoffAt, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('quietDay: $quietDay, ')
          ..write('funLine: $funLine, ')
          ..write('openedAt: $openedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class RecapEntry extends Table with TableInfo<RecapEntry, RecapEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RecapEntry(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recapIdMeta = const VerificationMeta('recapId');
  late final GeneratedColumn<String> recapId = GeneratedColumn<String>(
    'recap_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES recap(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _sectionMeta = const VerificationMeta('section');
  late final GeneratedColumn<String> section = GeneratedColumn<String>(
    'section',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (section IN (\'promise_by_you\', \'promise_to_you\', \'decision\', \'remember\', \'question\', \'highlight\'))',
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES item(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _momentIdMeta = const VerificationMeta('momentId');
  late final GeneratedColumn<String> momentId = GeneratedColumn<String>(
    'moment_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES moment(id)ON DELETE CASCADE',
  );
  @override
  List<GeneratedColumn> get $columns => [recapId, position, section, itemId, momentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recap_entry';
  @override
  VerificationContext validateIntegrity(Insertable<RecapEntryData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recap_id')) {
      context.handle(_recapIdMeta, recapId.isAcceptableOrUnknown(data['recap_id']!, _recapIdMeta));
    } else if (isInserting) {
      context.missing(_recapIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta, position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('section')) {
      context.handle(_sectionMeta, section.isAcceptableOrUnknown(data['section']!, _sectionMeta));
    } else if (isInserting) {
      context.missing(_sectionMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta, itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    }
    if (data.containsKey('moment_id')) {
      context.handle(_momentIdMeta, momentId.isAcceptableOrUnknown(data['moment_id']!, _momentIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recapId, position};
  @override
  RecapEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecapEntryData(
      recapId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}recap_id'])!,
      position: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      section: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}section'])!,
      itemId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}item_id']),
      momentId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}moment_id']),
    );
  }

  @override
  RecapEntry createAlias(String alias) {
    return RecapEntry(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(recap_id, position)',
    'CHECK(item_id IS NOT NULL OR moment_id IS NOT NULL)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class RecapEntryData extends DataClass implements Insertable<RecapEntryData> {
  final String recapId;
  final int position;
  final String section;
  final String? itemId;
  final String? momentId;
  const RecapEntryData({
    required this.recapId,
    required this.position,
    required this.section,
    this.itemId,
    this.momentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recap_id'] = Variable<String>(recapId);
    map['position'] = Variable<int>(position);
    map['section'] = Variable<String>(section);
    if (!nullToAbsent || itemId != null) {
      map['item_id'] = Variable<String>(itemId);
    }
    if (!nullToAbsent || momentId != null) {
      map['moment_id'] = Variable<String>(momentId);
    }
    return map;
  }

  RecapEntryCompanion toCompanion(bool nullToAbsent) {
    return RecapEntryCompanion(
      recapId: Value(recapId),
      position: Value(position),
      section: Value(section),
      itemId: itemId == null && nullToAbsent ? const Value.absent() : Value(itemId),
      momentId: momentId == null && nullToAbsent ? const Value.absent() : Value(momentId),
    );
  }

  factory RecapEntryData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecapEntryData(
      recapId: serializer.fromJson<String>(json['recap_id']),
      position: serializer.fromJson<int>(json['position']),
      section: serializer.fromJson<String>(json['section']),
      itemId: serializer.fromJson<String?>(json['item_id']),
      momentId: serializer.fromJson<String?>(json['moment_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recap_id': serializer.toJson<String>(recapId),
      'position': serializer.toJson<int>(position),
      'section': serializer.toJson<String>(section),
      'item_id': serializer.toJson<String?>(itemId),
      'moment_id': serializer.toJson<String?>(momentId),
    };
  }

  RecapEntryData copyWith({
    String? recapId,
    int? position,
    String? section,
    Value<String?> itemId = const Value.absent(),
    Value<String?> momentId = const Value.absent(),
  }) => RecapEntryData(
    recapId: recapId ?? this.recapId,
    position: position ?? this.position,
    section: section ?? this.section,
    itemId: itemId.present ? itemId.value : this.itemId,
    momentId: momentId.present ? momentId.value : this.momentId,
  );
  RecapEntryData copyWithCompanion(RecapEntryCompanion data) {
    return RecapEntryData(
      recapId: data.recapId.present ? data.recapId.value : this.recapId,
      position: data.position.present ? data.position.value : this.position,
      section: data.section.present ? data.section.value : this.section,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      momentId: data.momentId.present ? data.momentId.value : this.momentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecapEntryData(')
          ..write('recapId: $recapId, ')
          ..write('position: $position, ')
          ..write('section: $section, ')
          ..write('itemId: $itemId, ')
          ..write('momentId: $momentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recapId, position, section, itemId, momentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecapEntryData &&
          other.recapId == this.recapId &&
          other.position == this.position &&
          other.section == this.section &&
          other.itemId == this.itemId &&
          other.momentId == this.momentId);
}

class RecapEntryCompanion extends UpdateCompanion<RecapEntryData> {
  final Value<String> recapId;
  final Value<int> position;
  final Value<String> section;
  final Value<String?> itemId;
  final Value<String?> momentId;
  final Value<int> rowid;
  const RecapEntryCompanion({
    this.recapId = const Value.absent(),
    this.position = const Value.absent(),
    this.section = const Value.absent(),
    this.itemId = const Value.absent(),
    this.momentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecapEntryCompanion.insert({
    required String recapId,
    required int position,
    required String section,
    this.itemId = const Value.absent(),
    this.momentId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : recapId = Value(recapId),
       position = Value(position),
       section = Value(section);
  static Insertable<RecapEntryData> custom({
    Expression<String>? recapId,
    Expression<int>? position,
    Expression<String>? section,
    Expression<String>? itemId,
    Expression<String>? momentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recapId != null) 'recap_id': recapId,
      if (position != null) 'position': position,
      if (section != null) 'section': section,
      if (itemId != null) 'item_id': itemId,
      if (momentId != null) 'moment_id': momentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecapEntryCompanion copyWith({
    Value<String>? recapId,
    Value<int>? position,
    Value<String>? section,
    Value<String?>? itemId,
    Value<String?>? momentId,
    Value<int>? rowid,
  }) {
    return RecapEntryCompanion(
      recapId: recapId ?? this.recapId,
      position: position ?? this.position,
      section: section ?? this.section,
      itemId: itemId ?? this.itemId,
      momentId: momentId ?? this.momentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recapId.present) {
      map['recap_id'] = Variable<String>(recapId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (section.present) {
      map['section'] = Variable<String>(section.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (momentId.present) {
      map['moment_id'] = Variable<String>(momentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecapEntryCompanion(')
          ..write('recapId: $recapId, ')
          ..write('position: $position, ')
          ..write('section: $section, ')
          ..write('itemId: $itemId, ')
          ..write('momentId: $momentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Feedback extends Table with TableInfo<Feedback, FeedbackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Feedback(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES item(id)ON DELETE CASCADE',
  );
  static const VerificationMeta _recapIdMeta = const VerificationMeta('recapId');
  late final GeneratedColumn<String> recapId = GeneratedColumn<String>(
    'recap_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES recap(id)ON DELETE SET NULL',
  );
  static const VerificationMeta _verdictMeta = const VerificationMeta('verdict');
  late final GeneratedColumn<String> verdict = GeneratedColumn<String>(
    'verdict',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (verdict IN (\'right\', \'wrong\', \'not_important\'))',
  );
  static const VerificationMeta _atMeta = const VerificationMeta('at');
  late final GeneratedColumn<int> at = GeneratedColumn<int>(
    'at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, itemId, recapId, verdict, at];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feedback';
  @override
  VerificationContext validateIntegrity(Insertable<FeedbackData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta, itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('recap_id')) {
      context.handle(_recapIdMeta, recapId.isAcceptableOrUnknown(data['recap_id']!, _recapIdMeta));
    }
    if (data.containsKey('verdict')) {
      context.handle(_verdictMeta, verdict.isAcceptableOrUnknown(data['verdict']!, _verdictMeta));
    } else if (isInserting) {
      context.missing(_verdictMeta);
    }
    if (data.containsKey('at')) {
      context.handle(_atMeta, at.isAcceptableOrUnknown(data['at']!, _atMeta));
    } else if (isInserting) {
      context.missing(_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedbackData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeedbackData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      recapId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}recap_id']),
      verdict: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}verdict'])!,
      at: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}at'])!,
    );
  }

  @override
  Feedback createAlias(String alias) {
    return Feedback(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class FeedbackData extends DataClass implements Insertable<FeedbackData> {
  final String id;
  final String itemId;
  final String? recapId;
  final String verdict;
  final int at;
  const FeedbackData({required this.id, required this.itemId, this.recapId, required this.verdict, required this.at});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    if (!nullToAbsent || recapId != null) {
      map['recap_id'] = Variable<String>(recapId);
    }
    map['verdict'] = Variable<String>(verdict);
    map['at'] = Variable<int>(at);
    return map;
  }

  FeedbackCompanion toCompanion(bool nullToAbsent) {
    return FeedbackCompanion(
      id: Value(id),
      itemId: Value(itemId),
      recapId: recapId == null && nullToAbsent ? const Value.absent() : Value(recapId),
      verdict: Value(verdict),
      at: Value(at),
    );
  }

  factory FeedbackData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedbackData(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['item_id']),
      recapId: serializer.fromJson<String?>(json['recap_id']),
      verdict: serializer.fromJson<String>(json['verdict']),
      at: serializer.fromJson<int>(json['at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'item_id': serializer.toJson<String>(itemId),
      'recap_id': serializer.toJson<String?>(recapId),
      'verdict': serializer.toJson<String>(verdict),
      'at': serializer.toJson<int>(at),
    };
  }

  FeedbackData copyWith({
    String? id,
    String? itemId,
    Value<String?> recapId = const Value.absent(),
    String? verdict,
    int? at,
  }) => FeedbackData(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    recapId: recapId.present ? recapId.value : this.recapId,
    verdict: verdict ?? this.verdict,
    at: at ?? this.at,
  );
  FeedbackData copyWithCompanion(FeedbackCompanion data) {
    return FeedbackData(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      recapId: data.recapId.present ? data.recapId.value : this.recapId,
      verdict: data.verdict.present ? data.verdict.value : this.verdict,
      at: data.at.present ? data.at.value : this.at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeedbackData(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('recapId: $recapId, ')
          ..write('verdict: $verdict, ')
          ..write('at: $at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, recapId, verdict, at);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedbackData &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.recapId == this.recapId &&
          other.verdict == this.verdict &&
          other.at == this.at);
}

class FeedbackCompanion extends UpdateCompanion<FeedbackData> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<String?> recapId;
  final Value<String> verdict;
  final Value<int> at;
  final Value<int> rowid;
  const FeedbackCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.recapId = const Value.absent(),
    this.verdict = const Value.absent(),
    this.at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeedbackCompanion.insert({
    required String id,
    required String itemId,
    this.recapId = const Value.absent(),
    required String verdict,
    required int at,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       itemId = Value(itemId),
       verdict = Value(verdict),
       at = Value(at);
  static Insertable<FeedbackData> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<String>? recapId,
    Expression<String>? verdict,
    Expression<int>? at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (recapId != null) 'recap_id': recapId,
      if (verdict != null) 'verdict': verdict,
      if (at != null) 'at': at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeedbackCompanion copyWith({
    Value<String>? id,
    Value<String>? itemId,
    Value<String?>? recapId,
    Value<String>? verdict,
    Value<int>? at,
    Value<int>? rowid,
  }) {
    return FeedbackCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      recapId: recapId ?? this.recapId,
      verdict: verdict ?? this.verdict,
      at: at ?? this.at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (recapId.present) {
      map['recap_id'] = Variable<String>(recapId.value);
    }
    if (verdict.present) {
      map['verdict'] = Variable<String>(verdict.value);
    }
    if (at.present) {
      map['at'] = Variable<int>(at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedbackCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('recapId: $recapId, ')
          ..write('verdict: $verdict, ')
          ..write('at: $at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class PauseZone extends Table with TableInfo<PauseZone, PauseZoneData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PauseZone(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _radiusMMeta = const VerificationMeta('radiusM');
  late final GeneratedColumn<int> radiusM = GeneratedColumn<int>(
    'radius_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (radius_m BETWEEN 100 AND 300)',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, lat, lng, radiusM];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pause_zone';
  @override
  VerificationContext validateIntegrity(Insertable<PauseZoneData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(_latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(_lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('radius_m')) {
      context.handle(_radiusMMeta, radiusM.isAcceptableOrUnknown(data['radius_m']!, _radiusMMeta));
    } else if (isInserting) {
      context.missing(_radiusMMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PauseZoneData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PauseZoneData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lat: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lng: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}lng'])!,
      radiusM: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}radius_m'])!,
    );
  }

  @override
  PauseZone createAlias(String alias) {
    return PauseZone(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PauseZoneData extends DataClass implements Insertable<PauseZoneData> {
  final String id;
  final String name;
  final double lat;
  final double lng;
  final int radiusM;
  const PauseZoneData({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.radiusM,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['radius_m'] = Variable<int>(radiusM);
    return map;
  }

  PauseZoneCompanion toCompanion(bool nullToAbsent) {
    return PauseZoneCompanion(
      id: Value(id),
      name: Value(name),
      lat: Value(lat),
      lng: Value(lng),
      radiusM: Value(radiusM),
    );
  }

  factory PauseZoneData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PauseZoneData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      radiusM: serializer.fromJson<int>(json['radius_m']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'radius_m': serializer.toJson<int>(radiusM),
    };
  }

  PauseZoneData copyWith({String? id, String? name, double? lat, double? lng, int? radiusM}) => PauseZoneData(
    id: id ?? this.id,
    name: name ?? this.name,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    radiusM: radiusM ?? this.radiusM,
  );
  PauseZoneData copyWithCompanion(PauseZoneCompanion data) {
    return PauseZoneData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      radiusM: data.radiusM.present ? data.radiusM.value : this.radiusM,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PauseZoneData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('radiusM: $radiusM')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lat, lng, radiusM);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PauseZoneData &&
          other.id == this.id &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.radiusM == this.radiusM);
}

class PauseZoneCompanion extends UpdateCompanion<PauseZoneData> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> lat;
  final Value<double> lng;
  final Value<int> radiusM;
  final Value<int> rowid;
  const PauseZoneCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.radiusM = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PauseZoneCompanion.insert({
    required String id,
    required String name,
    required double lat,
    required double lng,
    required int radiusM,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       lat = Value(lat),
       lng = Value(lng),
       radiusM = Value(radiusM);
  static Insertable<PauseZoneData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<int>? radiusM,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (radiusM != null) 'radius_m': radiusM,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PauseZoneCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? lat,
    Value<double>? lng,
    Value<int>? radiusM,
    Value<int>? rowid,
  }) {
    return PauseZoneCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      radiusM: radiusM ?? this.radiusM,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (radiusM.present) {
      map['radius_m'] = Variable<int>(radiusM.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PauseZoneCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('radiusM: $radiusM, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CloudJob extends Table with TableInfo<CloudJob, CloudJobData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CloudJob(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (kind IN (\'label\', \'recap\'))',
  );
  static const VerificationMeta _targetIdMeta = const VerificationMeta('targetId');
  late final GeneratedColumn<String> targetId = GeneratedColumn<String>(
    'target_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (status IN (\'queued\', \'in_flight\', \'done\', \'failed\', \'blocked\'))',
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta('attempts');
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  static const VerificationMeta _nextAttemptAtMeta = const VerificationMeta('nextAttemptAt');
  late final GeneratedColumn<int> nextAttemptAt = GeneratedColumn<int>(
    'next_attempt_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta('lastError');
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [id, kind, targetId, status, attempts, nextAttemptAt, lastError];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_job';
  @override
  VerificationContext validateIntegrity(Insertable<CloudJobData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(_kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('target_id')) {
      context.handle(_targetIdMeta, targetId.isAcceptableOrUnknown(data['target_id']!, _targetIdMeta));
    } else if (isInserting) {
      context.missing(_targetIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta, status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta, attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('next_attempt_at')) {
      context.handle(
        _nextAttemptAtMeta,
        nextAttemptAt.isAcceptableOrUnknown(data['next_attempt_at']!, _nextAttemptAtMeta),
      );
    } else if (isInserting) {
      context.missing(_nextAttemptAtMeta);
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta, lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {kind, targetId},
  ];
  @override
  CloudJobData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudJobData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      kind: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      targetId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}target_id'])!,
      status: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      attempts: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      nextAttemptAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}next_attempt_at'])!,
      lastError: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}last_error']),
    );
  }

  @override
  CloudJob createAlias(String alias) {
    return CloudJob(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(kind, target_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class CloudJobData extends DataClass implements Insertable<CloudJobData> {
  final String id;
  final String kind;
  final String targetId;

  /// moment id, or recap day
  final String status;
  final int attempts;
  final int nextAttemptAt;
  final String? lastError;
  const CloudJobData({
    required this.id,
    required this.kind,
    required this.targetId,
    required this.status,
    required this.attempts,
    required this.nextAttemptAt,
    this.lastError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    map['target_id'] = Variable<String>(targetId);
    map['status'] = Variable<String>(status);
    map['attempts'] = Variable<int>(attempts);
    map['next_attempt_at'] = Variable<int>(nextAttemptAt);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  CloudJobCompanion toCompanion(bool nullToAbsent) {
    return CloudJobCompanion(
      id: Value(id),
      kind: Value(kind),
      targetId: Value(targetId),
      status: Value(status),
      attempts: Value(attempts),
      nextAttemptAt: Value(nextAttemptAt),
      lastError: lastError == null && nullToAbsent ? const Value.absent() : Value(lastError),
    );
  }

  factory CloudJobData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudJobData(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      targetId: serializer.fromJson<String>(json['target_id']),
      status: serializer.fromJson<String>(json['status']),
      attempts: serializer.fromJson<int>(json['attempts']),
      nextAttemptAt: serializer.fromJson<int>(json['next_attempt_at']),
      lastError: serializer.fromJson<String?>(json['last_error']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'target_id': serializer.toJson<String>(targetId),
      'status': serializer.toJson<String>(status),
      'attempts': serializer.toJson<int>(attempts),
      'next_attempt_at': serializer.toJson<int>(nextAttemptAt),
      'last_error': serializer.toJson<String?>(lastError),
    };
  }

  CloudJobData copyWith({
    String? id,
    String? kind,
    String? targetId,
    String? status,
    int? attempts,
    int? nextAttemptAt,
    Value<String?> lastError = const Value.absent(),
  }) => CloudJobData(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    targetId: targetId ?? this.targetId,
    status: status ?? this.status,
    attempts: attempts ?? this.attempts,
    nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
    lastError: lastError.present ? lastError.value : this.lastError,
  );
  CloudJobData copyWithCompanion(CloudJobCompanion data) {
    return CloudJobData(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      status: data.status.present ? data.status.value : this.status,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      nextAttemptAt: data.nextAttemptAt.present ? data.nextAttemptAt.value : this.nextAttemptAt,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudJobData(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('targetId: $targetId, ')
          ..write('status: $status, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, kind, targetId, status, attempts, nextAttemptAt, lastError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudJobData &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.targetId == this.targetId &&
          other.status == this.status &&
          other.attempts == this.attempts &&
          other.nextAttemptAt == this.nextAttemptAt &&
          other.lastError == this.lastError);
}

class CloudJobCompanion extends UpdateCompanion<CloudJobData> {
  final Value<String> id;
  final Value<String> kind;
  final Value<String> targetId;
  final Value<String> status;
  final Value<int> attempts;
  final Value<int> nextAttemptAt;
  final Value<String?> lastError;
  final Value<int> rowid;
  const CloudJobCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.targetId = const Value.absent(),
    this.status = const Value.absent(),
    this.attempts = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudJobCompanion.insert({
    required String id,
    required String kind,
    required String targetId,
    required String status,
    this.attempts = const Value.absent(),
    required int nextAttemptAt,
    this.lastError = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       targetId = Value(targetId),
       status = Value(status),
       nextAttemptAt = Value(nextAttemptAt);
  static Insertable<CloudJobData> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<String>? targetId,
    Expression<String>? status,
    Expression<int>? attempts,
    Expression<int>? nextAttemptAt,
    Expression<String>? lastError,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (targetId != null) 'target_id': targetId,
      if (status != null) 'status': status,
      if (attempts != null) 'attempts': attempts,
      if (nextAttemptAt != null) 'next_attempt_at': nextAttemptAt,
      if (lastError != null) 'last_error': lastError,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CloudJobCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<String>? targetId,
    Value<String>? status,
    Value<int>? attempts,
    Value<int>? nextAttemptAt,
    Value<String?>? lastError,
    Value<int>? rowid,
  }) {
    return CloudJobCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      targetId: targetId ?? this.targetId,
      status: status ?? this.status,
      attempts: attempts ?? this.attempts,
      nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
      lastError: lastError ?? this.lastError,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (targetId.present) {
      map['target_id'] = Variable<String>(targetId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (nextAttemptAt.present) {
      map['next_attempt_at'] = Variable<int>(nextAttemptAt.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudJobCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('targetId: $targetId, ')
          ..write('status: $status, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class TelemetryOutbox extends Table with TableInfo<TelemetryOutbox, TelemetryOutboxData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TelemetryOutbox(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seqMeta = const VerificationMeta('seq');
  late final GeneratedColumn<int> seq = GeneratedColumn<int>(
    'seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'PRIMARY KEY',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _propsMeta = const VerificationMeta('props');
  late final GeneratedColumn<String> props = GeneratedColumn<String>(
    'props',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta('occurredAt');
  late final GeneratedColumn<int> occurredAt = GeneratedColumn<int>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [seq, name, props, occurredAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'telemetry_outbox';
  @override
  VerificationContext validateIntegrity(Insertable<TelemetryOutboxData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('seq')) {
      context.handle(_seqMeta, seq.isAcceptableOrUnknown(data['seq']!, _seqMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('props')) {
      context.handle(_propsMeta, props.isAcceptableOrUnknown(data['props']!, _propsMeta));
    } else if (isInserting) {
      context.missing(_propsMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(_occurredAtMeta, occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta));
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seq};
  @override
  TelemetryOutboxData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TelemetryOutboxData(
      seq: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}seq'])!,
      name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      props: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}props'])!,
      occurredAt: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}occurred_at'])!,
    );
  }

  @override
  TelemetryOutbox createAlias(String alias) {
    return TelemetryOutbox(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TelemetryOutboxData extends DataClass implements Insertable<TelemetryOutboxData> {
  final int seq;
  final String name;
  final String props;

  /// JSON, whitelisted keys only (§15)
  final int occurredAt;
  const TelemetryOutboxData({required this.seq, required this.name, required this.props, required this.occurredAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['seq'] = Variable<int>(seq);
    map['name'] = Variable<String>(name);
    map['props'] = Variable<String>(props);
    map['occurred_at'] = Variable<int>(occurredAt);
    return map;
  }

  TelemetryOutboxCompanion toCompanion(bool nullToAbsent) {
    return TelemetryOutboxCompanion(
      seq: Value(seq),
      name: Value(name),
      props: Value(props),
      occurredAt: Value(occurredAt),
    );
  }

  factory TelemetryOutboxData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TelemetryOutboxData(
      seq: serializer.fromJson<int>(json['seq']),
      name: serializer.fromJson<String>(json['name']),
      props: serializer.fromJson<String>(json['props']),
      occurredAt: serializer.fromJson<int>(json['occurred_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seq': serializer.toJson<int>(seq),
      'name': serializer.toJson<String>(name),
      'props': serializer.toJson<String>(props),
      'occurred_at': serializer.toJson<int>(occurredAt),
    };
  }

  TelemetryOutboxData copyWith({int? seq, String? name, String? props, int? occurredAt}) => TelemetryOutboxData(
    seq: seq ?? this.seq,
    name: name ?? this.name,
    props: props ?? this.props,
    occurredAt: occurredAt ?? this.occurredAt,
  );
  TelemetryOutboxData copyWithCompanion(TelemetryOutboxCompanion data) {
    return TelemetryOutboxData(
      seq: data.seq.present ? data.seq.value : this.seq,
      name: data.name.present ? data.name.value : this.name,
      props: data.props.present ? data.props.value : this.props,
      occurredAt: data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TelemetryOutboxData(')
          ..write('seq: $seq, ')
          ..write('name: $name, ')
          ..write('props: $props, ')
          ..write('occurredAt: $occurredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(seq, name, props, occurredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TelemetryOutboxData &&
          other.seq == this.seq &&
          other.name == this.name &&
          other.props == this.props &&
          other.occurredAt == this.occurredAt);
}

class TelemetryOutboxCompanion extends UpdateCompanion<TelemetryOutboxData> {
  final Value<int> seq;
  final Value<String> name;
  final Value<String> props;
  final Value<int> occurredAt;
  const TelemetryOutboxCompanion({
    this.seq = const Value.absent(),
    this.name = const Value.absent(),
    this.props = const Value.absent(),
    this.occurredAt = const Value.absent(),
  });
  TelemetryOutboxCompanion.insert({
    this.seq = const Value.absent(),
    required String name,
    required String props,
    required int occurredAt,
  }) : name = Value(name),
       props = Value(props),
       occurredAt = Value(occurredAt);
  static Insertable<TelemetryOutboxData> custom({
    Expression<int>? seq,
    Expression<String>? name,
    Expression<String>? props,
    Expression<int>? occurredAt,
  }) {
    return RawValuesInsertable({
      if (seq != null) 'seq': seq,
      if (name != null) 'name': name,
      if (props != null) 'props': props,
      if (occurredAt != null) 'occurred_at': occurredAt,
    });
  }

  TelemetryOutboxCompanion copyWith({
    Value<int>? seq,
    Value<String>? name,
    Value<String>? props,
    Value<int>? occurredAt,
  }) {
    return TelemetryOutboxCompanion(
      seq: seq ?? this.seq,
      name: name ?? this.name,
      props: props ?? this.props,
      occurredAt: occurredAt ?? this.occurredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seq.present) {
      map['seq'] = Variable<int>(seq.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (props.present) {
      map['props'] = Variable<String>(props.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<int>(occurredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TelemetryOutboxCompanion(')
          ..write('seq: $seq, ')
          ..write('name: $name, ')
          ..write('props: $props, ')
          ..write('occurredAt: $occurredAt')
          ..write(')'))
        .toString();
  }
}

class Setting extends Table with TableInfo<Setting, SettingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Setting(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'setting';
  @override
  VerificationContext validateIntegrity(Insertable<SettingData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(_keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(_valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingData(
      key: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  Setting createAlias(String alias) {
    return Setting(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SettingData extends DataClass implements Insertable<SettingData> {
  final String key;
  final String value;
  const SettingData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingCompanion toCompanion(bool nullToAbsent) {
    return SettingCompanion(key: Value(key), value: Value(value));
  }

  factory SettingData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'key': serializer.toJson<String>(key), 'value': serializer.toJson<String>(value)};
  }

  SettingData copyWith({String? key, String? value}) => SettingData(key: key ?? this.key, value: value ?? this.value);
  SettingData copyWithCompanion(SettingCompanion data) {
    return SettingData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is SettingData && other.key == this.key && other.value == this.value);
}

class SettingCompanion extends UpdateCompanion<SettingData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingCompanion.insert({required String key, required String value, this.rowid = const Value.absent()})
    : key = Value(key),
      value = Value(value);
  static Insertable<SettingData> custom({Expression<String>? key, Expression<String>? value, Expression<int>? rowid}) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingCompanion copyWith({Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return SettingCompanion(key: key ?? this.key, value: value ?? this.value, rowid: rowid ?? this.rowid);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Flag extends Table with TableInfo<Flag, FlagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Flag(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'PRIMARY KEY NOT NULL',
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flag';
  @override
  VerificationContext validateIntegrity(Insertable<FlagData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(_keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(_valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  FlagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlagData(
      key: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  Flag createAlias(String alias) {
    return Flag(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class FlagData extends DataClass implements Insertable<FlagData> {
  final String key;
  final String value;
  const FlagData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  FlagCompanion toCompanion(bool nullToAbsent) {
    return FlagCompanion(key: Value(key), value: Value(value));
  }

  factory FlagData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlagData(key: serializer.fromJson<String>(json['key']), value: serializer.fromJson<String>(json['value']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'key': serializer.toJson<String>(key), 'value': serializer.toJson<String>(value)};
  }

  FlagData copyWith({String? key, String? value}) => FlagData(key: key ?? this.key, value: value ?? this.value);
  FlagData copyWithCompanion(FlagCompanion data) {
    return FlagData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FlagData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is FlagData && other.key == this.key && other.value == this.value);
}

class FlagCompanion extends UpdateCompanion<FlagData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const FlagCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FlagCompanion.insert({required String key, required String value, this.rowid = const Value.absent()})
    : key = Value(key),
      value = Value(value);
  static Insertable<FlagData> custom({Expression<String>? key, Expression<String>? value, Expression<int>? rowid}) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FlagCompanion copyWith({Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return FlagCompanion(key: key ?? this.key, value: value ?? this.value, rowid: rowid ?? this.rowid);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlagCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Session session = Session(this);
  late final Index sessionRun = Index('session_run', 'CREATE INDEX session_run ON session (run_id, started_at)');
  late final CaptureGap captureGap = CaptureGap(this);
  late final Person person = Person(this);
  late final Index personOneSelf = Index(
    'person_one_self',
    'CREATE UNIQUE INDEX person_one_self ON person (is_self) WHERE is_self = 1',
  );
  late final Speaker speaker = Speaker(this);
  late final ConsentRecord consentRecord = ConsentRecord(this);
  late final VoiceSignature voiceSignature = VoiceSignature(this);
  late final Trigger voiceSignatureNeedsConsent = Trigger(
    'CREATE TRIGGER voice_signature_needs_consent BEFORE INSERT ON voice_signature WHEN NOT EXISTS (SELECT 1 FROM consent_record AS c WHERE c.id = NEW.consent_record_id AND c.withdrawn_at IS NULL AND c.kind = CASE WHEN NEW.is_self = 1 THEN \'self_voice\' ELSE \'remembered_voice\' END) BEGIN SELECT RAISE (ABORT, \'I6: no granted consent record\');END',
    'voice_signature_needs_consent',
  );
  late final Trigger consentWithdrawnDeletesSignatures = Trigger(
    'CREATE TRIGGER consent_withdrawn_deletes_signatures AFTER UPDATE OF withdrawn_at ON consent_record WHEN NEW.withdrawn_at IS NOT NULL BEGIN DELETE FROM voice_signature WHERE consent_record_id = NEW.id;END',
    'consent_withdrawn_deletes_signatures',
  );
  late final Moment moment = Moment(this);
  late final Utterance utterance = Utterance(this);
  late final Index utteranceSessionTime = Index(
    'utterance_session_time',
    'CREATE INDEX utterance_session_time ON utterance (session_id, start_ms)',
  );
  late final Index utteranceMoment = Index(
    'utterance_moment',
    'CREATE INDEX utterance_moment ON utterance (moment_id, start_ms)',
  );
  late final UtteranceFts utteranceFts = UtteranceFts(this);
  late final Trigger utteranceFtsAi = Trigger(
    'CREATE TRIGGER utterance_fts_ai AFTER INSERT ON utterance BEGIN INSERT INTO utterance_fts ("rowid", text) VALUES (NEW.seq, NEW.text);END',
    'utterance_fts_ai',
  );
  late final Trigger utteranceFtsAd = Trigger(
    'CREATE TRIGGER utterance_fts_ad AFTER DELETE ON utterance BEGIN INSERT INTO utterance_fts (utterance_fts, "rowid", text) VALUES (\'delete\', OLD.seq, OLD.text);END',
    'utterance_fts_ad',
  );
  late final Trigger utteranceFtsAu = Trigger(
    'CREATE TRIGGER utterance_fts_au AFTER UPDATE OF text ON utterance BEGIN INSERT INTO utterance_fts (utterance_fts, "rowid", text) VALUES (\'delete\', OLD.seq, OLD.text);INSERT INTO utterance_fts ("rowid", text) VALUES (NEW.seq, NEW.text);END',
    'utterance_fts_au',
  );
  late final Item item = Item(this);
  late final ItemView itemView = ItemView(this);
  late final ItemSource itemSource = ItemSource(this);
  late final Trigger itemSourceOrphan = Trigger(
    'CREATE TRIGGER item_source_orphan AFTER DELETE ON item_source WHEN NOT EXISTS (SELECT 1 FROM item_source WHERE item_id = OLD.item_id) BEGIN DELETE FROM item WHERE id = OLD.item_id AND origin = \'model\';END',
    'item_source_orphan',
  );
  late final Media media = Media(this);
  late final Index mediaDeleteAt = Index(
    'media_delete_at',
    'CREATE INDEX media_delete_at ON media (delete_at) WHERE deleted_at IS NULL',
  );
  late final Mark mark = Mark(this);
  late final Recap recap = Recap(this);
  late final RecapEntry recapEntry = RecapEntry(this);
  late final Feedback feedback = Feedback(this);
  late final PauseZone pauseZone = PauseZone(this);
  late final CloudJob cloudJob = CloudJob(this);
  late final TelemetryOutbox telemetryOutbox = TelemetryOutbox(this);
  late final Setting setting = Setting(this);
  late final Flag flag = Flag(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    session,
    sessionRun,
    captureGap,
    person,
    personOneSelf,
    speaker,
    consentRecord,
    voiceSignature,
    voiceSignatureNeedsConsent,
    consentWithdrawnDeletesSignatures,
    moment,
    utterance,
    utteranceSessionTime,
    utteranceMoment,
    utteranceFts,
    utteranceFtsAi,
    utteranceFtsAd,
    utteranceFtsAu,
    item,
    itemView,
    itemSource,
    itemSourceOrphan,
    media,
    mediaDeleteAt,
    mark,
    recap,
    recapEntry,
    feedback,
    pauseZone,
    cloudJob,
    telemetryOutbox,
    setting,
    flag,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName('session', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('capture_gap', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('session', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('speaker', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('person', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('speaker', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('person', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('voice_signature', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('voice_signature', limitUpdateKind: UpdateKind.insert),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('consent_record', limitUpdateKind: UpdateKind.update),
      result: [TableUpdate('voice_signature', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('session', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('moment', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('session', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('utterance', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('moment', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('utterance', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('speaker', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('utterance', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('utterance', limitUpdateKind: UpdateKind.insert),
      result: [TableUpdate('utterance_fts', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('utterance', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('utterance_fts', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('utterance', limitUpdateKind: UpdateKind.update),
      result: [TableUpdate('utterance_fts', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('moment', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('item', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('person', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('item', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('utterance', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('item', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('person', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('item', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('item', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('item_source', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('utterance', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('item_source', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('item_source', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('item', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('session', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('media', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('session', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('mark', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('recap', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('recap_entry', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('item', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('recap_entry', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('moment', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('recap_entry', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('item', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('feedback', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName('recap', limitUpdateKind: UpdateKind.delete),
      result: [TableUpdate('feedback', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $SessionCreateCompanionBuilder = SessionCompanion Function({
  required String id,
  required String runId,
  required String scene,
  required String startTrigger,
  required int startedAt,
  Value<int?> endedAt,
  Value<String?> endReason,
  required String tz,
  required String status,
  Value<int?> lastHeartbeatAt,
  Value<String?> placeLabel,
  Value<double?> latCoarse,
  Value<double?> lngCoarse,
  Value<String?> calendarEventId,
  Value<int?> attendeeCountHint,
  Value<int?> consentShownAt,
  Value<String?> consentMode,
  Value<int> rowid,
});
typedef $SessionUpdateCompanionBuilder = SessionCompanion Function({
  Value<String> id,
  Value<String> runId,
  Value<String> scene,
  Value<String> startTrigger,
  Value<int> startedAt,
  Value<int?> endedAt,
  Value<String?> endReason,
  Value<String> tz,
  Value<String> status,
  Value<int?> lastHeartbeatAt,
  Value<String?> placeLabel,
  Value<double?> latCoarse,
  Value<double?> lngCoarse,
  Value<String?> calendarEventId,
  Value<int?> attendeeCountHint,
  Value<int?> consentShownAt,
  Value<String?> consentMode,
  Value<int> rowid,
});

final class $SessionReferences extends BaseReferences<_$AppDatabase, Session, SessionData> {
  $SessionReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<CaptureGap, List<CaptureGapData>> _captureGapRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.captureGap, aliasName: 'session__id__capture_gap__session_id');

  $CaptureGapProcessedTableManager get captureGapRefs {
    final manager = $CaptureGapTableManager(
      $_db,
      $_db.captureGap,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_captureGapRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<Speaker, List<SpeakerData>> _speakerRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.speaker, aliasName: 'session__id__speaker__session_id');

  $SpeakerProcessedTableManager get speakerRefs {
    final manager = $SpeakerTableManager(
      $_db,
      $_db.speaker,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_speakerRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<Moment, List<MomentData>> _momentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.moment, aliasName: 'session__id__moment__session_id');

  $MomentProcessedTableManager get momentRefs {
    final manager = $MomentTableManager(
      $_db,
      $_db.moment,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<Utterance, List<UtteranceData>> _utteranceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.utterance, aliasName: 'session__id__utterance__session_id');

  $UtteranceProcessedTableManager get utteranceRefs {
    final manager = $UtteranceTableManager(
      $_db,
      $_db.utterance,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_utteranceRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<Media, List<MediaData>> _mediaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.media, aliasName: 'session__id__media__session_id');

  $MediaProcessedTableManager get mediaRefs {
    final manager = $MediaTableManager(
      $_db,
      $_db.media,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<Mark, List<MarkData>> _markRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.mark, aliasName: 'session__id__mark__session_id');

  $MarkProcessedTableManager get markRefs {
    final manager = $MarkTableManager(
      $_db,
      $_db.mark,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_markRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $SessionFilterComposer extends Composer<_$AppDatabase, Session> {
  $SessionFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get runId =>
      $composableBuilder(column: $table.runId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scene =>
      $composableBuilder(column: $table.scene, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startTrigger =>
      $composableBuilder(column: $table.startTrigger, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endReason =>
      $composableBuilder(column: $table.endReason, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tz => $composableBuilder(column: $table.tz, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastHeartbeatAt =>
      $composableBuilder(column: $table.lastHeartbeatAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get placeLabel =>
      $composableBuilder(column: $table.placeLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latCoarse =>
      $composableBuilder(column: $table.latCoarse, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lngCoarse =>
      $composableBuilder(column: $table.lngCoarse, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get calendarEventId =>
      $composableBuilder(column: $table.calendarEventId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attendeeCountHint =>
      $composableBuilder(column: $table.attendeeCountHint, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get consentShownAt =>
      $composableBuilder(column: $table.consentShownAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get consentMode =>
      $composableBuilder(column: $table.consentMode, builder: (column) => ColumnFilters(column));

  Expression<bool> captureGapRefs(Expression<bool> Function($CaptureGapFilterComposer f) f) {
    final $CaptureGapFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.captureGap,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $CaptureGapFilterComposer(
            $db: $db,
            $table: $db.captureGap,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> speakerRefs(Expression<bool> Function($SpeakerFilterComposer f) f) {
    final $SpeakerFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerFilterComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> momentRefs(Expression<bool> Function($MomentFilterComposer f) f) {
    final $MomentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentFilterComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> utteranceRefs(Expression<bool> Function($UtteranceFilterComposer f) f) {
    final $UtteranceFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceFilterComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mediaRefs(Expression<bool> Function($MediaFilterComposer f) f) {
    final $MediaFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MediaFilterComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> markRefs(Expression<bool> Function($MarkFilterComposer f) f) {
    final $MarkFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mark,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MarkFilterComposer(
            $db: $db,
            $table: $db.mark,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $SessionOrderingComposer extends Composer<_$AppDatabase, Session> {
  $SessionOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get runId =>
      $composableBuilder(column: $table.runId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scene =>
      $composableBuilder(column: $table.scene, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startTrigger =>
      $composableBuilder(column: $table.startTrigger, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endReason =>
      $composableBuilder(column: $table.endReason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tz => $composableBuilder(column: $table.tz, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastHeartbeatAt =>
      $composableBuilder(column: $table.lastHeartbeatAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get placeLabel =>
      $composableBuilder(column: $table.placeLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latCoarse =>
      $composableBuilder(column: $table.latCoarse, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lngCoarse =>
      $composableBuilder(column: $table.lngCoarse, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get calendarEventId =>
      $composableBuilder(column: $table.calendarEventId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attendeeCountHint =>
      $composableBuilder(column: $table.attendeeCountHint, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get consentShownAt =>
      $composableBuilder(column: $table.consentShownAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get consentMode =>
      $composableBuilder(column: $table.consentMode, builder: (column) => ColumnOrderings(column));
}

class $SessionAnnotationComposer extends Composer<_$AppDatabase, Session> {
  $SessionAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get runId => $composableBuilder(column: $table.runId, builder: (column) => column);

  GeneratedColumn<String> get scene => $composableBuilder(column: $table.scene, builder: (column) => column);

  GeneratedColumn<String> get startTrigger =>
      $composableBuilder(column: $table.startTrigger, builder: (column) => column);

  GeneratedColumn<int> get startedAt => $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get endedAt => $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<String> get endReason => $composableBuilder(column: $table.endReason, builder: (column) => column);

  GeneratedColumn<String> get tz => $composableBuilder(column: $table.tz, builder: (column) => column);

  GeneratedColumn<String> get status => $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get lastHeartbeatAt =>
      $composableBuilder(column: $table.lastHeartbeatAt, builder: (column) => column);

  GeneratedColumn<String> get placeLabel => $composableBuilder(column: $table.placeLabel, builder: (column) => column);

  GeneratedColumn<double> get latCoarse => $composableBuilder(column: $table.latCoarse, builder: (column) => column);

  GeneratedColumn<double> get lngCoarse => $composableBuilder(column: $table.lngCoarse, builder: (column) => column);

  GeneratedColumn<String> get calendarEventId =>
      $composableBuilder(column: $table.calendarEventId, builder: (column) => column);

  GeneratedColumn<int> get attendeeCountHint =>
      $composableBuilder(column: $table.attendeeCountHint, builder: (column) => column);

  GeneratedColumn<int> get consentShownAt =>
      $composableBuilder(column: $table.consentShownAt, builder: (column) => column);

  GeneratedColumn<String> get consentMode =>
      $composableBuilder(column: $table.consentMode, builder: (column) => column);

  Expression<T> captureGapRefs<T extends Object>(Expression<T> Function($CaptureGapAnnotationComposer a) f) {
    final $CaptureGapAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.captureGap,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $CaptureGapAnnotationComposer(
            $db: $db,
            $table: $db.captureGap,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> speakerRefs<T extends Object>(Expression<T> Function($SpeakerAnnotationComposer a) f) {
    final $SpeakerAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerAnnotationComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> momentRefs<T extends Object>(Expression<T> Function($MomentAnnotationComposer a) f) {
    final $MomentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentAnnotationComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> utteranceRefs<T extends Object>(Expression<T> Function($UtteranceAnnotationComposer a) f) {
    final $UtteranceAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceAnnotationComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mediaRefs<T extends Object>(Expression<T> Function($MediaAnnotationComposer a) f) {
    final $MediaAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.media,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MediaAnnotationComposer(
            $db: $db,
            $table: $db.media,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> markRefs<T extends Object>(Expression<T> Function($MarkAnnotationComposer a) f) {
    final $MarkAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mark,
      getReferencedColumn: (t) => t.sessionId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MarkAnnotationComposer(
            $db: $db,
            $table: $db.mark,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $SessionTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Session,
          SessionData,
          $SessionFilterComposer,
          $SessionOrderingComposer,
          $SessionAnnotationComposer,
          $SessionCreateCompanionBuilder,
          $SessionUpdateCompanionBuilder,
          (SessionData, $SessionReferences),
          SessionData,
          PrefetchHooks Function({
            bool captureGapRefs,
            bool speakerRefs,
            bool momentRefs,
            bool utteranceRefs,
            bool mediaRefs,
            bool markRefs,
          })
        > {
  $SessionTableManager(_$AppDatabase db, Session table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $SessionFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $SessionOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $SessionAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> runId = const Value.absent(),
                Value<String> scene = const Value.absent(),
                Value<String> startTrigger = const Value.absent(),
                Value<int> startedAt = const Value.absent(),
                Value<int?> endedAt = const Value.absent(),
                Value<String?> endReason = const Value.absent(),
                Value<String> tz = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> lastHeartbeatAt = const Value.absent(),
                Value<String?> placeLabel = const Value.absent(),
                Value<double?> latCoarse = const Value.absent(),
                Value<double?> lngCoarse = const Value.absent(),
                Value<String?> calendarEventId = const Value.absent(),
                Value<int?> attendeeCountHint = const Value.absent(),
                Value<int?> consentShownAt = const Value.absent(),
                Value<String?> consentMode = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionCompanion(
                id: id,
                runId: runId,
                scene: scene,
                startTrigger: startTrigger,
                startedAt: startedAt,
                endedAt: endedAt,
                endReason: endReason,
                tz: tz,
                status: status,
                lastHeartbeatAt: lastHeartbeatAt,
                placeLabel: placeLabel,
                latCoarse: latCoarse,
                lngCoarse: lngCoarse,
                calendarEventId: calendarEventId,
                attendeeCountHint: attendeeCountHint,
                consentShownAt: consentShownAt,
                consentMode: consentMode,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String runId,
                required String scene,
                required String startTrigger,
                required int startedAt,
                Value<int?> endedAt = const Value.absent(),
                Value<String?> endReason = const Value.absent(),
                required String tz,
                required String status,
                Value<int?> lastHeartbeatAt = const Value.absent(),
                Value<String?> placeLabel = const Value.absent(),
                Value<double?> latCoarse = const Value.absent(),
                Value<double?> lngCoarse = const Value.absent(),
                Value<String?> calendarEventId = const Value.absent(),
                Value<int?> attendeeCountHint = const Value.absent(),
                Value<int?> consentShownAt = const Value.absent(),
                Value<String?> consentMode = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionCompanion.insert(
                id: id,
                runId: runId,
                scene: scene,
                startTrigger: startTrigger,
                startedAt: startedAt,
                endedAt: endedAt,
                endReason: endReason,
                tz: tz,
                status: status,
                lastHeartbeatAt: lastHeartbeatAt,
                placeLabel: placeLabel,
                latCoarse: latCoarse,
                lngCoarse: lngCoarse,
                calendarEventId: calendarEventId,
                attendeeCountHint: attendeeCountHint,
                consentShownAt: consentShownAt,
                consentMode: consentMode,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Session, SessionData>(table), $SessionReferences(db, table, e))).toList(),
          prefetchHooksCallback:
              ({
                captureGapRefs = false,
                speakerRefs = false,
                momentRefs = false,
                utteranceRefs = false,
                mediaRefs = false,
                markRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (captureGapRefs) db.captureGap,
                    if (speakerRefs) db.speaker,
                    if (momentRefs) db.moment,
                    if (utteranceRefs) db.utterance,
                    if (mediaRefs) db.media,
                    if (markRefs) db.mark,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (captureGapRefs)
                        await $_getPrefetchedDataByColumns<SessionData, Session, CaptureGapData, CaptureGap>(
                          currentTable: table,
                          referencedTable: $SessionReferences._captureGapRefsTable(db),
                          managerFromTypedResult: (p0) => $SessionReferences(db, table, p0).captureGapRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                      if (speakerRefs)
                        await $_getPrefetchedDataByColumns<SessionData, Session, SpeakerData, Speaker>(
                          currentTable: table,
                          referencedTable: $SessionReferences._speakerRefsTable(db),
                          managerFromTypedResult: (p0) => $SessionReferences(db, table, p0).speakerRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                      if (momentRefs)
                        await $_getPrefetchedDataByColumns<SessionData, Session, MomentData, Moment>(
                          currentTable: table,
                          referencedTable: $SessionReferences._momentRefsTable(db),
                          managerFromTypedResult: (p0) => $SessionReferences(db, table, p0).momentRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                      if (utteranceRefs)
                        await $_getPrefetchedDataByColumns<SessionData, Session, UtteranceData, Utterance>(
                          currentTable: table,
                          referencedTable: $SessionReferences._utteranceRefsTable(db),
                          managerFromTypedResult: (p0) => $SessionReferences(db, table, p0).utteranceRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                      if (mediaRefs)
                        await $_getPrefetchedDataByColumns<SessionData, Session, MediaData, Media>(
                          currentTable: table,
                          referencedTable: $SessionReferences._mediaRefsTable(db),
                          managerFromTypedResult: (p0) => $SessionReferences(db, table, p0).mediaRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                      if (markRefs)
                        await $_getPrefetchedDataByColumns<SessionData, Session, MarkData, Mark>(
                          currentTable: table,
                          referencedTable: $SessionReferences._markRefsTable(db),
                          managerFromTypedResult: (p0) => $SessionReferences(db, table, p0).markRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $SessionProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Session,
      SessionData,
      $SessionFilterComposer,
      $SessionOrderingComposer,
      $SessionAnnotationComposer,
      $SessionCreateCompanionBuilder,
      $SessionUpdateCompanionBuilder,
      (SessionData, $SessionReferences),
      SessionData,
      PrefetchHooks Function({
        bool captureGapRefs,
        bool speakerRefs,
        bool momentRefs,
        bool utteranceRefs,
        bool mediaRefs,
        bool markRefs,
      })
    >;
typedef $CaptureGapCreateCompanionBuilder = CaptureGapCompanion Function({
  required String id,
  required String sessionId,
  required int startMs,
  Value<int?> endMs,
  required String reason,
  Value<int> rowid,
});
typedef $CaptureGapUpdateCompanionBuilder = CaptureGapCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<int> startMs,
  Value<int?> endMs,
  Value<String> reason,
  Value<int> rowid,
});

final class $CaptureGapReferences extends BaseReferences<_$AppDatabase, CaptureGap, CaptureGapData> {
  $CaptureGapReferences(super.$_db, super.$_table, super.$_typedResult);

  static Session _sessionIdTable(_$AppDatabase db) => db.session.createAlias('capture_gap__session_id__session__id');

  $SessionProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $SessionTableManager($_db, $_db.session).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $CaptureGapFilterComposer extends Composer<_$AppDatabase, CaptureGap> {
  $CaptureGapFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endMs => $composableBuilder(column: $table.endMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => ColumnFilters(column));

  $SessionFilterComposer get sessionId {
    final $SessionFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionFilterComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $CaptureGapOrderingComposer extends Composer<_$AppDatabase, CaptureGap> {
  $CaptureGapOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endMs =>
      $composableBuilder(column: $table.endMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => ColumnOrderings(column));

  $SessionOrderingComposer get sessionId {
    final $SessionOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionOrderingComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $CaptureGapAnnotationComposer extends Composer<_$AppDatabase, CaptureGap> {
  $CaptureGapAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get startMs => $composableBuilder(column: $table.startMs, builder: (column) => column);

  GeneratedColumn<int> get endMs => $composableBuilder(column: $table.endMs, builder: (column) => column);

  GeneratedColumn<String> get reason => $composableBuilder(column: $table.reason, builder: (column) => column);

  $SessionAnnotationComposer get sessionId {
    final $SessionAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionAnnotationComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $CaptureGapTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CaptureGap,
          CaptureGapData,
          $CaptureGapFilterComposer,
          $CaptureGapOrderingComposer,
          $CaptureGapAnnotationComposer,
          $CaptureGapCreateCompanionBuilder,
          $CaptureGapUpdateCompanionBuilder,
          (CaptureGapData, $CaptureGapReferences),
          CaptureGapData,
          PrefetchHooks Function({bool sessionId})
        > {
  $CaptureGapTableManager(_$AppDatabase db, CaptureGap table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $CaptureGapFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $CaptureGapOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $CaptureGapAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<int> startMs = const Value.absent(),
                Value<int?> endMs = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CaptureGapCompanion(
                id: id,
                sessionId: sessionId,
                startMs: startMs,
                endMs: endMs,
                reason: reason,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required int startMs,
                Value<int?> endMs = const Value.absent(),
                required String reason,
                Value<int> rowid = const Value.absent(),
              }) => CaptureGapCompanion.insert(
                id: id,
                sessionId: sessionId,
                startMs: startMs,
                endMs: endMs,
                reason: reason,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable<CaptureGap, CaptureGapData>(table), $CaptureGapReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.sessionId,
                        referencedTable: $CaptureGapReferences._sessionIdTable(db),
                        referencedColumn: $CaptureGapReferences._sessionIdTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $CaptureGapProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CaptureGap,
      CaptureGapData,
      $CaptureGapFilterComposer,
      $CaptureGapOrderingComposer,
      $CaptureGapAnnotationComposer,
      $CaptureGapCreateCompanionBuilder,
      $CaptureGapUpdateCompanionBuilder,
      (CaptureGapData, $CaptureGapReferences),
      CaptureGapData,
      PrefetchHooks Function({bool sessionId})
    >;
typedef $PersonCreateCompanionBuilder = PersonCompanion Function({
  required String id,
  required String displayName,
  Value<String?> aliases,
  Value<int> isSelf,
  Value<String?> contactRef,
  required int createdAt,
  Value<int> rowid,
});
typedef $PersonUpdateCompanionBuilder = PersonCompanion Function({
  Value<String> id,
  Value<String> displayName,
  Value<String?> aliases,
  Value<int> isSelf,
  Value<String?> contactRef,
  Value<int> createdAt,
  Value<int> rowid,
});

final class $PersonReferences extends BaseReferences<_$AppDatabase, Person, PersonData> {
  $PersonReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Speaker, List<SpeakerData>> _speakerRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.speaker, aliasName: 'person__id__speaker__person_id');

  $SpeakerProcessedTableManager get speakerRefs {
    final manager = $SpeakerTableManager(
      $_db,
      $_db.speaker,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_speakerRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<ConsentRecord, List<ConsentRecordData>> _consentRecordRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.consentRecord, aliasName: 'person__id__consent_record__subject_person');

  $ConsentRecordProcessedTableManager get consentRecordRefs {
    final manager = $ConsentRecordTableManager(
      $_db,
      $_db.consentRecord,
    ).filter((f) => f.subjectPerson.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_consentRecordRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<VoiceSignature, List<VoiceSignatureData>> _voiceSignatureRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.voiceSignature, aliasName: 'person__id__voice_signature__person_id');

  $VoiceSignatureProcessedTableManager get voiceSignatureRefs {
    final manager = $VoiceSignatureTableManager(
      $_db,
      $_db.voiceSignature,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_voiceSignatureRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $PersonFilterComposer extends Composer<_$AppDatabase, Person> {
  $PersonFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName =>
      $composableBuilder(column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isSelf =>
      $composableBuilder(column: $table.isSelf, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactRef =>
      $composableBuilder(column: $table.contactRef, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> speakerRefs(Expression<bool> Function($SpeakerFilterComposer f) f) {
    final $SpeakerFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.personId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerFilterComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> consentRecordRefs(Expression<bool> Function($ConsentRecordFilterComposer f) f) {
    final $ConsentRecordFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.consentRecord,
      getReferencedColumn: (t) => t.subjectPerson,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ConsentRecordFilterComposer(
            $db: $db,
            $table: $db.consentRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> voiceSignatureRefs(Expression<bool> Function($VoiceSignatureFilterComposer f) f) {
    final $VoiceSignatureFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.voiceSignature,
      getReferencedColumn: (t) => t.personId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $VoiceSignatureFilterComposer(
            $db: $db,
            $table: $db.voiceSignature,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $PersonOrderingComposer extends Composer<_$AppDatabase, Person> {
  $PersonOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName =>
      $composableBuilder(column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isSelf =>
      $composableBuilder(column: $table.isSelf, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactRef =>
      $composableBuilder(column: $table.contactRef, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $PersonAnnotationComposer extends Composer<_$AppDatabase, Person> {
  $PersonAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName =>
      $composableBuilder(column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get aliases => $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<int> get isSelf => $composableBuilder(column: $table.isSelf, builder: (column) => column);

  GeneratedColumn<String> get contactRef => $composableBuilder(column: $table.contactRef, builder: (column) => column);

  GeneratedColumn<int> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> speakerRefs<T extends Object>(Expression<T> Function($SpeakerAnnotationComposer a) f) {
    final $SpeakerAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.personId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerAnnotationComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> consentRecordRefs<T extends Object>(Expression<T> Function($ConsentRecordAnnotationComposer a) f) {
    final $ConsentRecordAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.consentRecord,
      getReferencedColumn: (t) => t.subjectPerson,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ConsentRecordAnnotationComposer(
            $db: $db,
            $table: $db.consentRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> voiceSignatureRefs<T extends Object>(Expression<T> Function($VoiceSignatureAnnotationComposer a) f) {
    final $VoiceSignatureAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.voiceSignature,
      getReferencedColumn: (t) => t.personId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $VoiceSignatureAnnotationComposer(
            $db: $db,
            $table: $db.voiceSignature,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $PersonTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Person,
          PersonData,
          $PersonFilterComposer,
          $PersonOrderingComposer,
          $PersonAnnotationComposer,
          $PersonCreateCompanionBuilder,
          $PersonUpdateCompanionBuilder,
          (PersonData, $PersonReferences),
          PersonData,
          PrefetchHooks Function({bool speakerRefs, bool consentRecordRefs, bool voiceSignatureRefs})
        > {
  $PersonTableManager(_$AppDatabase db, Person table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $PersonFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $PersonOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $PersonAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> aliases = const Value.absent(),
                Value<int> isSelf = const Value.absent(),
                Value<String?> contactRef = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonCompanion(
                id: id,
                displayName: displayName,
                aliases: aliases,
                isSelf: isSelf,
                contactRef: contactRef,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String displayName,
                Value<String?> aliases = const Value.absent(),
                Value<int> isSelf = const Value.absent(),
                Value<String?> contactRef = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PersonCompanion.insert(
                id: id,
                displayName: displayName,
                aliases: aliases,
                isSelf: isSelf,
                contactRef: contactRef,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Person, PersonData>(table), $PersonReferences(db, table, e))).toList(),
          prefetchHooksCallback: ({speakerRefs = false, consentRecordRefs = false, voiceSignatureRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (speakerRefs) db.speaker,
                if (consentRecordRefs) db.consentRecord,
                if (voiceSignatureRefs) db.voiceSignature,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (speakerRefs)
                    await $_getPrefetchedDataByColumns<PersonData, Person, SpeakerData, Speaker>(
                      currentTable: table,
                      referencedTable: $PersonReferences._speakerRefsTable(db),
                      managerFromTypedResult: (p0) => $PersonReferences(db, table, p0).speakerRefs,
                      currentColumn: 'id',
                      referencedColumn: 'person_id',
                      typedResults: items,
                    ),
                  if (consentRecordRefs)
                    await $_getPrefetchedDataByColumns<PersonData, Person, ConsentRecordData, ConsentRecord>(
                      currentTable: table,
                      referencedTable: $PersonReferences._consentRecordRefsTable(db),
                      managerFromTypedResult: (p0) => $PersonReferences(db, table, p0).consentRecordRefs,
                      currentColumn: 'id',
                      referencedColumn: 'subject_person',
                      typedResults: items,
                    ),
                  if (voiceSignatureRefs)
                    await $_getPrefetchedDataByColumns<PersonData, Person, VoiceSignatureData, VoiceSignature>(
                      currentTable: table,
                      referencedTable: $PersonReferences._voiceSignatureRefsTable(db),
                      managerFromTypedResult: (p0) => $PersonReferences(db, table, p0).voiceSignatureRefs,
                      currentColumn: 'id',
                      referencedColumn: 'person_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $PersonProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Person,
      PersonData,
      $PersonFilterComposer,
      $PersonOrderingComposer,
      $PersonAnnotationComposer,
      $PersonCreateCompanionBuilder,
      $PersonUpdateCompanionBuilder,
      (PersonData, $PersonReferences),
      PersonData,
      PrefetchHooks Function({bool speakerRefs, bool consentRecordRefs, bool voiceSignatureRefs})
    >;
typedef $SpeakerCreateCompanionBuilder = SpeakerCompanion Function({
  required String id,
  required String sessionId,
  required String label,
  Value<int> isSelf,
  Value<String?> personId,
  Value<String?> mergedInto,
  required int colorIndex,
  Value<int> rowid,
});
typedef $SpeakerUpdateCompanionBuilder = SpeakerCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<String> label,
  Value<int> isSelf,
  Value<String?> personId,
  Value<String?> mergedInto,
  Value<int> colorIndex,
  Value<int> rowid,
});

final class $SpeakerReferences extends BaseReferences<_$AppDatabase, Speaker, SpeakerData> {
  $SpeakerReferences(super.$_db, super.$_table, super.$_typedResult);

  static Session _sessionIdTable(_$AppDatabase db) => db.session.createAlias('speaker__session_id__session__id');

  $SessionProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $SessionTableManager($_db, $_db.session).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Person _personIdTable(_$AppDatabase db) => db.person.createAlias('speaker__person_id__person__id');

  $PersonProcessedTableManager? get personId {
    final $_column = $_itemColumn<String>('person_id');
    if ($_column == null) return null;
    final manager = $PersonTableManager($_db, $_db.person).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Speaker _mergedIntoTable(_$AppDatabase db) => db.speaker.createAlias('speaker__merged_into__speaker__id');

  $SpeakerProcessedTableManager? get mergedInto {
    final $_column = $_itemColumn<String>('merged_into');
    if ($_column == null) return null;
    final manager = $SpeakerTableManager($_db, $_db.speaker).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mergedIntoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<Utterance, List<UtteranceData>> _utteranceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.utterance, aliasName: 'speaker__id__utterance__speaker_id');

  $UtteranceProcessedTableManager get utteranceRefs {
    final manager = $UtteranceTableManager(
      $_db,
      $_db.utterance,
    ).filter((f) => f.speakerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_utteranceRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $SpeakerFilterComposer extends Composer<_$AppDatabase, Speaker> {
  $SpeakerFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isSelf =>
      $composableBuilder(column: $table.isSelf, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get colorIndex =>
      $composableBuilder(column: $table.colorIndex, builder: (column) => ColumnFilters(column));

  $SessionFilterComposer get sessionId {
    final $SessionFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionFilterComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonFilterComposer get personId {
    final $PersonFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonFilterComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerFilterComposer get mergedInto {
    final $SpeakerFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mergedInto,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerFilterComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> utteranceRefs(Expression<bool> Function($UtteranceFilterComposer f) f) {
    final $UtteranceFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.speakerId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceFilterComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $SpeakerOrderingComposer extends Composer<_$AppDatabase, Speaker> {
  $SpeakerOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isSelf =>
      $composableBuilder(column: $table.isSelf, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get colorIndex =>
      $composableBuilder(column: $table.colorIndex, builder: (column) => ColumnOrderings(column));

  $SessionOrderingComposer get sessionId {
    final $SessionOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionOrderingComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonOrderingComposer get personId {
    final $PersonOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonOrderingComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerOrderingComposer get mergedInto {
    final $SpeakerOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mergedInto,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerOrderingComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $SpeakerAnnotationComposer extends Composer<_$AppDatabase, Speaker> {
  $SpeakerAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label => $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<int> get isSelf => $composableBuilder(column: $table.isSelf, builder: (column) => column);

  GeneratedColumn<int> get colorIndex => $composableBuilder(column: $table.colorIndex, builder: (column) => column);

  $SessionAnnotationComposer get sessionId {
    final $SessionAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionAnnotationComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonAnnotationComposer get personId {
    final $PersonAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonAnnotationComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerAnnotationComposer get mergedInto {
    final $SpeakerAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mergedInto,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerAnnotationComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> utteranceRefs<T extends Object>(Expression<T> Function($UtteranceAnnotationComposer a) f) {
    final $UtteranceAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.speakerId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceAnnotationComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $SpeakerTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Speaker,
          SpeakerData,
          $SpeakerFilterComposer,
          $SpeakerOrderingComposer,
          $SpeakerAnnotationComposer,
          $SpeakerCreateCompanionBuilder,
          $SpeakerUpdateCompanionBuilder,
          (SpeakerData, $SpeakerReferences),
          SpeakerData,
          PrefetchHooks Function({bool sessionId, bool personId, bool mergedInto, bool utteranceRefs})
        > {
  $SpeakerTableManager(_$AppDatabase db, Speaker table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $SpeakerFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $SpeakerOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $SpeakerAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<int> isSelf = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> mergedInto = const Value.absent(),
                Value<int> colorIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpeakerCompanion(
                id: id,
                sessionId: sessionId,
                label: label,
                isSelf: isSelf,
                personId: personId,
                mergedInto: mergedInto,
                colorIndex: colorIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required String label,
                Value<int> isSelf = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> mergedInto = const Value.absent(),
                required int colorIndex,
                Value<int> rowid = const Value.absent(),
              }) => SpeakerCompanion.insert(
                id: id,
                sessionId: sessionId,
                label: label,
                isSelf: isSelf,
                personId: personId,
                mergedInto: mergedInto,
                colorIndex: colorIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Speaker, SpeakerData>(table), $SpeakerReferences(db, table, e))).toList(),
          prefetchHooksCallback: ({sessionId = false, personId = false, mergedInto = false, utteranceRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (utteranceRefs) db.utterance],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.sessionId,
                        referencedTable: $SpeakerReferences._sessionIdTable(db),
                        referencedColumn: $SpeakerReferences._sessionIdTable(db).id,
                      ) as T;
                    }
                    if (personId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.personId,
                        referencedTable: $SpeakerReferences._personIdTable(db),
                        referencedColumn: $SpeakerReferences._personIdTable(db).id,
                      ) as T;
                    }
                    if (mergedInto) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mergedInto,
                        referencedTable: $SpeakerReferences._mergedIntoTable(db),
                        referencedColumn: $SpeakerReferences._mergedIntoTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (utteranceRefs)
                    await $_getPrefetchedDataByColumns<SpeakerData, Speaker, UtteranceData, Utterance>(
                      currentTable: table,
                      referencedTable: $SpeakerReferences._utteranceRefsTable(db),
                      managerFromTypedResult: (p0) => $SpeakerReferences(db, table, p0).utteranceRefs,
                      currentColumn: 'id',
                      referencedColumn: 'speaker_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $SpeakerProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Speaker,
      SpeakerData,
      $SpeakerFilterComposer,
      $SpeakerOrderingComposer,
      $SpeakerAnnotationComposer,
      $SpeakerCreateCompanionBuilder,
      $SpeakerUpdateCompanionBuilder,
      (SpeakerData, $SpeakerReferences),
      SpeakerData,
      PrefetchHooks Function({bool sessionId, bool personId, bool mergedInto, bool utteranceRefs})
    >;
typedef $ConsentRecordCreateCompanionBuilder = ConsentRecordCompanion Function({
  required String id,
  required String kind,
  Value<String?> subjectPerson,
  required String textVersion,
  required int grantedAt,
  Value<int?> withdrawnAt,
  Value<int> rowid,
});
typedef $ConsentRecordUpdateCompanionBuilder = ConsentRecordCompanion Function({
  Value<String> id,
  Value<String> kind,
  Value<String?> subjectPerson,
  Value<String> textVersion,
  Value<int> grantedAt,
  Value<int?> withdrawnAt,
  Value<int> rowid,
});

final class $ConsentRecordReferences extends BaseReferences<_$AppDatabase, ConsentRecord, ConsentRecordData> {
  $ConsentRecordReferences(super.$_db, super.$_table, super.$_typedResult);

  static Person _subjectPersonTable(_$AppDatabase db) =>
      db.person.createAlias('consent_record__subject_person__person__id');

  $PersonProcessedTableManager? get subjectPerson {
    final $_column = $_itemColumn<String>('subject_person');
    if ($_column == null) return null;
    final manager = $PersonTableManager($_db, $_db.person).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectPersonTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<VoiceSignature, List<VoiceSignatureData>> _voiceSignatureRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.voiceSignature,
        aliasName: 'consent_record__id__voice_signature__consent_record_id',
      );

  $VoiceSignatureProcessedTableManager get voiceSignatureRefs {
    final manager = $VoiceSignatureTableManager(
      $_db,
      $_db.voiceSignature,
    ).filter((f) => f.consentRecordId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_voiceSignatureRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $ConsentRecordFilterComposer extends Composer<_$AppDatabase, ConsentRecord> {
  $ConsentRecordFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get textVersion =>
      $composableBuilder(column: $table.textVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get grantedAt =>
      $composableBuilder(column: $table.grantedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get withdrawnAt =>
      $composableBuilder(column: $table.withdrawnAt, builder: (column) => ColumnFilters(column));

  $PersonFilterComposer get subjectPerson {
    final $PersonFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectPerson,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonFilterComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> voiceSignatureRefs(Expression<bool> Function($VoiceSignatureFilterComposer f) f) {
    final $VoiceSignatureFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.voiceSignature,
      getReferencedColumn: (t) => t.consentRecordId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $VoiceSignatureFilterComposer(
            $db: $db,
            $table: $db.voiceSignature,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $ConsentRecordOrderingComposer extends Composer<_$AppDatabase, ConsentRecord> {
  $ConsentRecordOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get textVersion =>
      $composableBuilder(column: $table.textVersion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get grantedAt =>
      $composableBuilder(column: $table.grantedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get withdrawnAt =>
      $composableBuilder(column: $table.withdrawnAt, builder: (column) => ColumnOrderings(column));

  $PersonOrderingComposer get subjectPerson {
    final $PersonOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectPerson,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonOrderingComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ConsentRecordAnnotationComposer extends Composer<_$AppDatabase, ConsentRecord> {
  $ConsentRecordAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get textVersion =>
      $composableBuilder(column: $table.textVersion, builder: (column) => column);

  GeneratedColumn<int> get grantedAt => $composableBuilder(column: $table.grantedAt, builder: (column) => column);

  GeneratedColumn<int> get withdrawnAt => $composableBuilder(column: $table.withdrawnAt, builder: (column) => column);

  $PersonAnnotationComposer get subjectPerson {
    final $PersonAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectPerson,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonAnnotationComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> voiceSignatureRefs<T extends Object>(Expression<T> Function($VoiceSignatureAnnotationComposer a) f) {
    final $VoiceSignatureAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.voiceSignature,
      getReferencedColumn: (t) => t.consentRecordId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $VoiceSignatureAnnotationComposer(
            $db: $db,
            $table: $db.voiceSignature,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $ConsentRecordTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          ConsentRecord,
          ConsentRecordData,
          $ConsentRecordFilterComposer,
          $ConsentRecordOrderingComposer,
          $ConsentRecordAnnotationComposer,
          $ConsentRecordCreateCompanionBuilder,
          $ConsentRecordUpdateCompanionBuilder,
          (ConsentRecordData, $ConsentRecordReferences),
          ConsentRecordData,
          PrefetchHooks Function({bool subjectPerson, bool voiceSignatureRefs})
        > {
  $ConsentRecordTableManager(_$AppDatabase db, ConsentRecord table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $ConsentRecordFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $ConsentRecordOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $ConsentRecordAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String?> subjectPerson = const Value.absent(),
                Value<String> textVersion = const Value.absent(),
                Value<int> grantedAt = const Value.absent(),
                Value<int?> withdrawnAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConsentRecordCompanion(
                id: id,
                kind: kind,
                subjectPerson: subjectPerson,
                textVersion: textVersion,
                grantedAt: grantedAt,
                withdrawnAt: withdrawnAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                Value<String?> subjectPerson = const Value.absent(),
                required String textVersion,
                required int grantedAt,
                Value<int?> withdrawnAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConsentRecordCompanion.insert(
                id: id,
                kind: kind,
                subjectPerson: subjectPerson,
                textVersion: textVersion,
                grantedAt: grantedAt,
                withdrawnAt: withdrawnAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable<ConsentRecord, ConsentRecordData>(table), $ConsentRecordReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({subjectPerson = false, voiceSignatureRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (voiceSignatureRefs) db.voiceSignature],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (subjectPerson) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.subjectPerson,
                        referencedTable: $ConsentRecordReferences._subjectPersonTable(db),
                        referencedColumn: $ConsentRecordReferences._subjectPersonTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (voiceSignatureRefs)
                    await $_getPrefetchedDataByColumns<
                      ConsentRecordData,
                      ConsentRecord,
                      VoiceSignatureData,
                      VoiceSignature
                    >(
                      currentTable: table,
                      referencedTable: $ConsentRecordReferences._voiceSignatureRefsTable(db),
                      managerFromTypedResult: (p0) => $ConsentRecordReferences(db, table, p0).voiceSignatureRefs,
                      currentColumn: 'id',
                      referencedColumn: 'consent_record_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $ConsentRecordProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      ConsentRecord,
      ConsentRecordData,
      $ConsentRecordFilterComposer,
      $ConsentRecordOrderingComposer,
      $ConsentRecordAnnotationComposer,
      $ConsentRecordCreateCompanionBuilder,
      $ConsentRecordUpdateCompanionBuilder,
      (ConsentRecordData, $ConsentRecordReferences),
      ConsentRecordData,
      PrefetchHooks Function({bool subjectPerson, bool voiceSignatureRefs})
    >;
typedef $VoiceSignatureCreateCompanionBuilder = VoiceSignatureCompanion Function({
  required String id,
  required int isSelf,
  Value<String?> personId,
  required String modelId,
  required Uint8List embedding,
  required String consentRecordId,
  required int createdAt,
  Value<int> rowid,
});
typedef $VoiceSignatureUpdateCompanionBuilder = VoiceSignatureCompanion Function({
  Value<String> id,
  Value<int> isSelf,
  Value<String?> personId,
  Value<String> modelId,
  Value<Uint8List> embedding,
  Value<String> consentRecordId,
  Value<int> createdAt,
  Value<int> rowid,
});

final class $VoiceSignatureReferences extends BaseReferences<_$AppDatabase, VoiceSignature, VoiceSignatureData> {
  $VoiceSignatureReferences(super.$_db, super.$_table, super.$_typedResult);

  static Person _personIdTable(_$AppDatabase db) => db.person.createAlias('voice_signature__person_id__person__id');

  $PersonProcessedTableManager? get personId {
    final $_column = $_itemColumn<String>('person_id');
    if ($_column == null) return null;
    final manager = $PersonTableManager($_db, $_db.person).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static ConsentRecord _consentRecordIdTable(_$AppDatabase db) =>
      db.consentRecord.createAlias('voice_signature__consent_record_id__consent_record__id');

  $ConsentRecordProcessedTableManager get consentRecordId {
    final $_column = $_itemColumn<String>('consent_record_id')!;

    final manager = $ConsentRecordTableManager($_db, $_db.consentRecord).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_consentRecordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $VoiceSignatureFilterComposer extends Composer<_$AppDatabase, VoiceSignature> {
  $VoiceSignatureFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isSelf =>
      $composableBuilder(column: $table.isSelf, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get modelId =>
      $composableBuilder(column: $table.modelId, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get embedding =>
      $composableBuilder(column: $table.embedding, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $PersonFilterComposer get personId {
    final $PersonFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonFilterComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $ConsentRecordFilterComposer get consentRecordId {
    final $ConsentRecordFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.consentRecordId,
      referencedTable: $db.consentRecord,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ConsentRecordFilterComposer(
            $db: $db,
            $table: $db.consentRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $VoiceSignatureOrderingComposer extends Composer<_$AppDatabase, VoiceSignature> {
  $VoiceSignatureOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isSelf =>
      $composableBuilder(column: $table.isSelf, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get modelId =>
      $composableBuilder(column: $table.modelId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get embedding =>
      $composableBuilder(column: $table.embedding, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $PersonOrderingComposer get personId {
    final $PersonOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonOrderingComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $ConsentRecordOrderingComposer get consentRecordId {
    final $ConsentRecordOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.consentRecordId,
      referencedTable: $db.consentRecord,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ConsentRecordOrderingComposer(
            $db: $db,
            $table: $db.consentRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $VoiceSignatureAnnotationComposer extends Composer<_$AppDatabase, VoiceSignature> {
  $VoiceSignatureAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get isSelf => $composableBuilder(column: $table.isSelf, builder: (column) => column);

  GeneratedColumn<String> get modelId => $composableBuilder(column: $table.modelId, builder: (column) => column);

  GeneratedColumn<Uint8List> get embedding => $composableBuilder(column: $table.embedding, builder: (column) => column);

  GeneratedColumn<int> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $PersonAnnotationComposer get personId {
    final $PersonAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonAnnotationComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $ConsentRecordAnnotationComposer get consentRecordId {
    final $ConsentRecordAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.consentRecordId,
      referencedTable: $db.consentRecord,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ConsentRecordAnnotationComposer(
            $db: $db,
            $table: $db.consentRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $VoiceSignatureTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          VoiceSignature,
          VoiceSignatureData,
          $VoiceSignatureFilterComposer,
          $VoiceSignatureOrderingComposer,
          $VoiceSignatureAnnotationComposer,
          $VoiceSignatureCreateCompanionBuilder,
          $VoiceSignatureUpdateCompanionBuilder,
          (VoiceSignatureData, $VoiceSignatureReferences),
          VoiceSignatureData,
          PrefetchHooks Function({bool personId, bool consentRecordId})
        > {
  $VoiceSignatureTableManager(_$AppDatabase db, VoiceSignature table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $VoiceSignatureFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $VoiceSignatureOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $VoiceSignatureAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> isSelf = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String> modelId = const Value.absent(),
                Value<Uint8List> embedding = const Value.absent(),
                Value<String> consentRecordId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VoiceSignatureCompanion(
                id: id,
                isSelf: isSelf,
                personId: personId,
                modelId: modelId,
                embedding: embedding,
                consentRecordId: consentRecordId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int isSelf,
                Value<String?> personId = const Value.absent(),
                required String modelId,
                required Uint8List embedding,
                required String consentRecordId,
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => VoiceSignatureCompanion.insert(
                id: id,
                isSelf: isSelf,
                personId: personId,
                modelId: modelId,
                embedding: embedding,
                consentRecordId: consentRecordId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable<VoiceSignature, VoiceSignatureData>(table), $VoiceSignatureReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({personId = false, consentRecordId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (personId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.personId,
                        referencedTable: $VoiceSignatureReferences._personIdTable(db),
                        referencedColumn: $VoiceSignatureReferences._personIdTable(db).id,
                      ) as T;
                    }
                    if (consentRecordId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.consentRecordId,
                        referencedTable: $VoiceSignatureReferences._consentRecordIdTable(db),
                        referencedColumn: $VoiceSignatureReferences._consentRecordIdTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $VoiceSignatureProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      VoiceSignature,
      VoiceSignatureData,
      $VoiceSignatureFilterComposer,
      $VoiceSignatureOrderingComposer,
      $VoiceSignatureAnnotationComposer,
      $VoiceSignatureCreateCompanionBuilder,
      $VoiceSignatureUpdateCompanionBuilder,
      (VoiceSignatureData, $VoiceSignatureReferences),
      VoiceSignatureData,
      PrefetchHooks Function({bool personId, bool consentRecordId})
    >;
typedef $MomentCreateCompanionBuilder = MomentCompanion Function({
  required String id,
  required String sessionId,
  Value<String> state,
  required int startMs,
  Value<int?> endMs,
  required String tz,
  Value<String?> sceneHint,
  Value<String?> sceneLabel,
  Value<double?> labelConfidence,
  Value<int> labelByUser,
  Value<String?> title,
  Value<String?> summary,
  Value<String?> tone,
  Value<int> flagged,
  Value<String?> excludedReason,
  Value<String> retentionMode,
  Value<String> analysisStatus,
  Value<String?> analyzerVersion,
  Value<int> rowid,
});
typedef $MomentUpdateCompanionBuilder = MomentCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<String> state,
  Value<int> startMs,
  Value<int?> endMs,
  Value<String> tz,
  Value<String?> sceneHint,
  Value<String?> sceneLabel,
  Value<double?> labelConfidence,
  Value<int> labelByUser,
  Value<String?> title,
  Value<String?> summary,
  Value<String?> tone,
  Value<int> flagged,
  Value<String?> excludedReason,
  Value<String> retentionMode,
  Value<String> analysisStatus,
  Value<String?> analyzerVersion,
  Value<int> rowid,
});

final class $MomentReferences extends BaseReferences<_$AppDatabase, Moment, MomentData> {
  $MomentReferences(super.$_db, super.$_table, super.$_typedResult);

  static Session _sessionIdTable(_$AppDatabase db) => db.session.createAlias('moment__session_id__session__id');

  $SessionProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $SessionTableManager($_db, $_db.session).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<Utterance, List<UtteranceData>> _utteranceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.utterance, aliasName: 'moment__id__utterance__moment_id');

  $UtteranceProcessedTableManager get utteranceRefs {
    final manager = $UtteranceTableManager(
      $_db,
      $_db.utterance,
    ).filter((f) => f.momentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_utteranceRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<Item, List<ItemData>> _itemRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.item, aliasName: 'moment__id__item__moment_id');

  $ItemProcessedTableManager get itemRefs {
    final manager = $ItemTableManager(
      $_db,
      $_db.item,
    ).filter((f) => f.momentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<RecapEntry, List<RecapEntryData>> _recapEntryRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.recapEntry, aliasName: 'moment__id__recap_entry__moment_id');

  $RecapEntryProcessedTableManager get recapEntryRefs {
    final manager = $RecapEntryTableManager(
      $_db,
      $_db.recapEntry,
    ).filter((f) => f.momentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recapEntryRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $MomentFilterComposer extends Composer<_$AppDatabase, Moment> {
  $MomentFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endMs => $composableBuilder(column: $table.endMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tz => $composableBuilder(column: $table.tz, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sceneHint =>
      $composableBuilder(column: $table.sceneHint, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sceneLabel =>
      $composableBuilder(column: $table.sceneLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get labelConfidence =>
      $composableBuilder(column: $table.labelConfidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get labelByUser =>
      $composableBuilder(column: $table.labelByUser, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tone => $composableBuilder(column: $table.tone, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get flagged =>
      $composableBuilder(column: $table.flagged, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get excludedReason =>
      $composableBuilder(column: $table.excludedReason, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get retentionMode =>
      $composableBuilder(column: $table.retentionMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get analysisStatus =>
      $composableBuilder(column: $table.analysisStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get analyzerVersion =>
      $composableBuilder(column: $table.analyzerVersion, builder: (column) => ColumnFilters(column));

  $SessionFilterComposer get sessionId {
    final $SessionFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionFilterComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> utteranceRefs(Expression<bool> Function($UtteranceFilterComposer f) f) {
    final $UtteranceFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.momentId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceFilterComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> itemRefs(Expression<bool> Function($ItemFilterComposer f) f) {
    final $ItemFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.momentId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemFilterComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recapEntryRefs(Expression<bool> Function($RecapEntryFilterComposer f) f) {
    final $RecapEntryFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recapEntry,
      getReferencedColumn: (t) => t.momentId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapEntryFilterComposer(
            $db: $db,
            $table: $db.recapEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $MomentOrderingComposer extends Composer<_$AppDatabase, Moment> {
  $MomentOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endMs =>
      $composableBuilder(column: $table.endMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tz => $composableBuilder(column: $table.tz, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sceneHint =>
      $composableBuilder(column: $table.sceneHint, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sceneLabel =>
      $composableBuilder(column: $table.sceneLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get labelConfidence =>
      $composableBuilder(column: $table.labelConfidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get labelByUser =>
      $composableBuilder(column: $table.labelByUser, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tone =>
      $composableBuilder(column: $table.tone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get flagged =>
      $composableBuilder(column: $table.flagged, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get excludedReason =>
      $composableBuilder(column: $table.excludedReason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get retentionMode =>
      $composableBuilder(column: $table.retentionMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get analysisStatus =>
      $composableBuilder(column: $table.analysisStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get analyzerVersion =>
      $composableBuilder(column: $table.analyzerVersion, builder: (column) => ColumnOrderings(column));

  $SessionOrderingComposer get sessionId {
    final $SessionOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionOrderingComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MomentAnnotationComposer extends Composer<_$AppDatabase, Moment> {
  $MomentAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get state => $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<int> get startMs => $composableBuilder(column: $table.startMs, builder: (column) => column);

  GeneratedColumn<int> get endMs => $composableBuilder(column: $table.endMs, builder: (column) => column);

  GeneratedColumn<String> get tz => $composableBuilder(column: $table.tz, builder: (column) => column);

  GeneratedColumn<String> get sceneHint => $composableBuilder(column: $table.sceneHint, builder: (column) => column);

  GeneratedColumn<String> get sceneLabel => $composableBuilder(column: $table.sceneLabel, builder: (column) => column);

  GeneratedColumn<double> get labelConfidence =>
      $composableBuilder(column: $table.labelConfidence, builder: (column) => column);

  GeneratedColumn<int> get labelByUser => $composableBuilder(column: $table.labelByUser, builder: (column) => column);

  GeneratedColumn<String> get title => $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary => $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get tone => $composableBuilder(column: $table.tone, builder: (column) => column);

  GeneratedColumn<int> get flagged => $composableBuilder(column: $table.flagged, builder: (column) => column);

  GeneratedColumn<String> get excludedReason =>
      $composableBuilder(column: $table.excludedReason, builder: (column) => column);

  GeneratedColumn<String> get retentionMode =>
      $composableBuilder(column: $table.retentionMode, builder: (column) => column);

  GeneratedColumn<String> get analysisStatus =>
      $composableBuilder(column: $table.analysisStatus, builder: (column) => column);

  GeneratedColumn<String> get analyzerVersion =>
      $composableBuilder(column: $table.analyzerVersion, builder: (column) => column);

  $SessionAnnotationComposer get sessionId {
    final $SessionAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionAnnotationComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> utteranceRefs<T extends Object>(Expression<T> Function($UtteranceAnnotationComposer a) f) {
    final $UtteranceAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.momentId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceAnnotationComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> itemRefs<T extends Object>(Expression<T> Function($ItemAnnotationComposer a) f) {
    final $ItemAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.momentId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemAnnotationComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recapEntryRefs<T extends Object>(Expression<T> Function($RecapEntryAnnotationComposer a) f) {
    final $RecapEntryAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recapEntry,
      getReferencedColumn: (t) => t.momentId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapEntryAnnotationComposer(
            $db: $db,
            $table: $db.recapEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $MomentTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Moment,
          MomentData,
          $MomentFilterComposer,
          $MomentOrderingComposer,
          $MomentAnnotationComposer,
          $MomentCreateCompanionBuilder,
          $MomentUpdateCompanionBuilder,
          (MomentData, $MomentReferences),
          MomentData,
          PrefetchHooks Function({bool sessionId, bool utteranceRefs, bool itemRefs, bool recapEntryRefs})
        > {
  $MomentTableManager(_$AppDatabase db, Moment table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $MomentFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $MomentOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $MomentAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<int> startMs = const Value.absent(),
                Value<int?> endMs = const Value.absent(),
                Value<String> tz = const Value.absent(),
                Value<String?> sceneHint = const Value.absent(),
                Value<String?> sceneLabel = const Value.absent(),
                Value<double?> labelConfidence = const Value.absent(),
                Value<int> labelByUser = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> tone = const Value.absent(),
                Value<int> flagged = const Value.absent(),
                Value<String?> excludedReason = const Value.absent(),
                Value<String> retentionMode = const Value.absent(),
                Value<String> analysisStatus = const Value.absent(),
                Value<String?> analyzerVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentCompanion(
                id: id,
                sessionId: sessionId,
                state: state,
                startMs: startMs,
                endMs: endMs,
                tz: tz,
                sceneHint: sceneHint,
                sceneLabel: sceneLabel,
                labelConfidence: labelConfidence,
                labelByUser: labelByUser,
                title: title,
                summary: summary,
                tone: tone,
                flagged: flagged,
                excludedReason: excludedReason,
                retentionMode: retentionMode,
                analysisStatus: analysisStatus,
                analyzerVersion: analyzerVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                Value<String> state = const Value.absent(),
                required int startMs,
                Value<int?> endMs = const Value.absent(),
                required String tz,
                Value<String?> sceneHint = const Value.absent(),
                Value<String?> sceneLabel = const Value.absent(),
                Value<double?> labelConfidence = const Value.absent(),
                Value<int> labelByUser = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> tone = const Value.absent(),
                Value<int> flagged = const Value.absent(),
                Value<String?> excludedReason = const Value.absent(),
                Value<String> retentionMode = const Value.absent(),
                Value<String> analysisStatus = const Value.absent(),
                Value<String?> analyzerVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentCompanion.insert(
                id: id,
                sessionId: sessionId,
                state: state,
                startMs: startMs,
                endMs: endMs,
                tz: tz,
                sceneHint: sceneHint,
                sceneLabel: sceneLabel,
                labelConfidence: labelConfidence,
                labelByUser: labelByUser,
                title: title,
                summary: summary,
                tone: tone,
                flagged: flagged,
                excludedReason: excludedReason,
                retentionMode: retentionMode,
                analysisStatus: analysisStatus,
                analyzerVersion: analyzerVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Moment, MomentData>(table), $MomentReferences(db, table, e))).toList(),
          prefetchHooksCallback:
              ({sessionId = false, utteranceRefs = false, itemRefs = false, recapEntryRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (utteranceRefs) db.utterance,
                    if (itemRefs) db.item,
                    if (recapEntryRefs) db.recapEntry,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sessionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.sessionId,
                            referencedTable: $MomentReferences._sessionIdTable(db),
                            referencedColumn: $MomentReferences._sessionIdTable(db).id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (utteranceRefs)
                        await $_getPrefetchedDataByColumns<MomentData, Moment, UtteranceData, Utterance>(
                          currentTable: table,
                          referencedTable: $MomentReferences._utteranceRefsTable(db),
                          managerFromTypedResult: (p0) => $MomentReferences(db, table, p0).utteranceRefs,
                          currentColumn: 'id',
                          referencedColumn: 'moment_id',
                          typedResults: items,
                        ),
                      if (itemRefs)
                        await $_getPrefetchedDataByColumns<MomentData, Moment, ItemData, Item>(
                          currentTable: table,
                          referencedTable: $MomentReferences._itemRefsTable(db),
                          managerFromTypedResult: (p0) => $MomentReferences(db, table, p0).itemRefs,
                          currentColumn: 'id',
                          referencedColumn: 'moment_id',
                          typedResults: items,
                        ),
                      if (recapEntryRefs)
                        await $_getPrefetchedDataByColumns<MomentData, Moment, RecapEntryData, RecapEntry>(
                          currentTable: table,
                          referencedTable: $MomentReferences._recapEntryRefsTable(db),
                          managerFromTypedResult: (p0) => $MomentReferences(db, table, p0).recapEntryRefs,
                          currentColumn: 'id',
                          referencedColumn: 'moment_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $MomentProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Moment,
      MomentData,
      $MomentFilterComposer,
      $MomentOrderingComposer,
      $MomentAnnotationComposer,
      $MomentCreateCompanionBuilder,
      $MomentUpdateCompanionBuilder,
      (MomentData, $MomentReferences),
      MomentData,
      PrefetchHooks Function({bool sessionId, bool utteranceRefs, bool itemRefs, bool recapEntryRefs})
    >;
typedef $UtteranceCreateCompanionBuilder = UtteranceCompanion Function({
  Value<int> seq,
  required String id,
  required String sessionId,
  Value<String?> momentId,
  Value<String?> speakerId,
  Value<int> speakerLocked,
  required int startMs,
  required int endMs,
  required String text$,
  Value<String?> textLive,
  Value<String?> lang,
  Value<double?> asrConfidence,
  Value<double?> speakerConfidence,
  Value<int> pass,
  Value<String?> translation,
  Value<String?> translationLang,
});
typedef $UtteranceUpdateCompanionBuilder = UtteranceCompanion Function({
  Value<int> seq,
  Value<String> id,
  Value<String> sessionId,
  Value<String?> momentId,
  Value<String?> speakerId,
  Value<int> speakerLocked,
  Value<int> startMs,
  Value<int> endMs,
  Value<String> text$,
  Value<String?> textLive,
  Value<String?> lang,
  Value<double?> asrConfidence,
  Value<double?> speakerConfidence,
  Value<int> pass,
  Value<String?> translation,
  Value<String?> translationLang,
});

final class $UtteranceReferences extends BaseReferences<_$AppDatabase, Utterance, UtteranceData> {
  $UtteranceReferences(super.$_db, super.$_table, super.$_typedResult);

  static Session _sessionIdTable(_$AppDatabase db) => db.session.createAlias('utterance__session_id__session__id');

  $SessionProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $SessionTableManager($_db, $_db.session).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Moment _momentIdTable(_$AppDatabase db) => db.moment.createAlias('utterance__moment_id__moment__id');

  $MomentProcessedTableManager? get momentId {
    final $_column = $_itemColumn<String>('moment_id');
    if ($_column == null) return null;
    final manager = $MomentTableManager($_db, $_db.moment).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_momentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Speaker _speakerIdTable(_$AppDatabase db) => db.speaker.createAlias('utterance__speaker_id__speaker__id');

  $SpeakerProcessedTableManager? get speakerId {
    final $_column = $_itemColumn<String>('speaker_id');
    if ($_column == null) return null;
    final manager = $SpeakerTableManager($_db, $_db.speaker).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speakerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<Item, List<ItemData>> _itemRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.item, aliasName: 'utterance__id__item__owner_from_utterance_id');

  $ItemProcessedTableManager get itemRefs {
    final manager = $ItemTableManager(
      $_db,
      $_db.item,
    ).filter((f) => f.ownerFromUtteranceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<ItemSource, List<ItemSourceData>> _itemSourceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.itemSource, aliasName: 'utterance__id__item_source__utterance_id');

  $ItemSourceProcessedTableManager get itemSourceRefs {
    final manager = $ItemSourceTableManager(
      $_db,
      $_db.itemSource,
    ).filter((f) => f.utteranceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemSourceRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $UtteranceFilterComposer extends Composer<_$AppDatabase, Utterance> {
  $UtteranceFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get seq => $composableBuilder(column: $table.seq, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get speakerLocked =>
      $composableBuilder(column: $table.speakerLocked, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endMs => $composableBuilder(column: $table.endMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get text$ =>
      $composableBuilder(column: $table.text$, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get textLive =>
      $composableBuilder(column: $table.textLive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lang => $composableBuilder(column: $table.lang, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get asrConfidence =>
      $composableBuilder(column: $table.asrConfidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get speakerConfidence =>
      $composableBuilder(column: $table.speakerConfidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pass => $composableBuilder(column: $table.pass, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get translation =>
      $composableBuilder(column: $table.translation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get translationLang =>
      $composableBuilder(column: $table.translationLang, builder: (column) => ColumnFilters(column));

  $SessionFilterComposer get sessionId {
    final $SessionFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionFilterComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MomentFilterComposer get momentId {
    final $MomentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentFilterComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerFilterComposer get speakerId {
    final $SpeakerFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerFilterComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> itemRefs(Expression<bool> Function($ItemFilterComposer f) f) {
    final $ItemFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.ownerFromUtteranceId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemFilterComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> itemSourceRefs(Expression<bool> Function($ItemSourceFilterComposer f) f) {
    final $ItemSourceFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itemSource,
      getReferencedColumn: (t) => t.utteranceId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemSourceFilterComposer(
            $db: $db,
            $table: $db.itemSource,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $UtteranceOrderingComposer extends Composer<_$AppDatabase, Utterance> {
  $UtteranceOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get seq => $composableBuilder(column: $table.seq, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get speakerLocked =>
      $composableBuilder(column: $table.speakerLocked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endMs =>
      $composableBuilder(column: $table.endMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get text$ =>
      $composableBuilder(column: $table.text$, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get textLive =>
      $composableBuilder(column: $table.textLive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lang =>
      $composableBuilder(column: $table.lang, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get asrConfidence =>
      $composableBuilder(column: $table.asrConfidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get speakerConfidence =>
      $composableBuilder(column: $table.speakerConfidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pass =>
      $composableBuilder(column: $table.pass, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get translation =>
      $composableBuilder(column: $table.translation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get translationLang =>
      $composableBuilder(column: $table.translationLang, builder: (column) => ColumnOrderings(column));

  $SessionOrderingComposer get sessionId {
    final $SessionOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionOrderingComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MomentOrderingComposer get momentId {
    final $MomentOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentOrderingComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerOrderingComposer get speakerId {
    final $SpeakerOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerOrderingComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $UtteranceAnnotationComposer extends Composer<_$AppDatabase, Utterance> {
  $UtteranceAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get seq => $composableBuilder(column: $table.seq, builder: (column) => column);

  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get speakerLocked =>
      $composableBuilder(column: $table.speakerLocked, builder: (column) => column);

  GeneratedColumn<int> get startMs => $composableBuilder(column: $table.startMs, builder: (column) => column);

  GeneratedColumn<int> get endMs => $composableBuilder(column: $table.endMs, builder: (column) => column);

  GeneratedColumn<String> get text$ => $composableBuilder(column: $table.text$, builder: (column) => column);

  GeneratedColumn<String> get textLive => $composableBuilder(column: $table.textLive, builder: (column) => column);

  GeneratedColumn<String> get lang => $composableBuilder(column: $table.lang, builder: (column) => column);

  GeneratedColumn<double> get asrConfidence =>
      $composableBuilder(column: $table.asrConfidence, builder: (column) => column);

  GeneratedColumn<double> get speakerConfidence =>
      $composableBuilder(column: $table.speakerConfidence, builder: (column) => column);

  GeneratedColumn<int> get pass => $composableBuilder(column: $table.pass, builder: (column) => column);

  GeneratedColumn<String> get translation =>
      $composableBuilder(column: $table.translation, builder: (column) => column);

  GeneratedColumn<String> get translationLang =>
      $composableBuilder(column: $table.translationLang, builder: (column) => column);

  $SessionAnnotationComposer get sessionId {
    final $SessionAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionAnnotationComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MomentAnnotationComposer get momentId {
    final $MomentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentAnnotationComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerAnnotationComposer get speakerId {
    final $SpeakerAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerAnnotationComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> itemRefs<T extends Object>(Expression<T> Function($ItemAnnotationComposer a) f) {
    final $ItemAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.ownerFromUtteranceId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemAnnotationComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> itemSourceRefs<T extends Object>(Expression<T> Function($ItemSourceAnnotationComposer a) f) {
    final $ItemSourceAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itemSource,
      getReferencedColumn: (t) => t.utteranceId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemSourceAnnotationComposer(
            $db: $db,
            $table: $db.itemSource,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $UtteranceTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Utterance,
          UtteranceData,
          $UtteranceFilterComposer,
          $UtteranceOrderingComposer,
          $UtteranceAnnotationComposer,
          $UtteranceCreateCompanionBuilder,
          $UtteranceUpdateCompanionBuilder,
          (UtteranceData, $UtteranceReferences),
          UtteranceData,
          PrefetchHooks Function({bool sessionId, bool momentId, bool speakerId, bool itemRefs, bool itemSourceRefs})
        > {
  $UtteranceTableManager(_$AppDatabase db, Utterance table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $UtteranceFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $UtteranceOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $UtteranceAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> seq = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String?> momentId = const Value.absent(),
                Value<String?> speakerId = const Value.absent(),
                Value<int> speakerLocked = const Value.absent(),
                Value<int> startMs = const Value.absent(),
                Value<int> endMs = const Value.absent(),
                Value<String> text$ = const Value.absent(),
                Value<String?> textLive = const Value.absent(),
                Value<String?> lang = const Value.absent(),
                Value<double?> asrConfidence = const Value.absent(),
                Value<double?> speakerConfidence = const Value.absent(),
                Value<int> pass = const Value.absent(),
                Value<String?> translation = const Value.absent(),
                Value<String?> translationLang = const Value.absent(),
              }) => UtteranceCompanion(
                seq: seq,
                id: id,
                sessionId: sessionId,
                momentId: momentId,
                speakerId: speakerId,
                speakerLocked: speakerLocked,
                startMs: startMs,
                endMs: endMs,
                text$: text$,
                textLive: textLive,
                lang: lang,
                asrConfidence: asrConfidence,
                speakerConfidence: speakerConfidence,
                pass: pass,
                translation: translation,
                translationLang: translationLang,
              ),
          createCompanionCallback:
              ({
                Value<int> seq = const Value.absent(),
                required String id,
                required String sessionId,
                Value<String?> momentId = const Value.absent(),
                Value<String?> speakerId = const Value.absent(),
                Value<int> speakerLocked = const Value.absent(),
                required int startMs,
                required int endMs,
                required String text$,
                Value<String?> textLive = const Value.absent(),
                Value<String?> lang = const Value.absent(),
                Value<double?> asrConfidence = const Value.absent(),
                Value<double?> speakerConfidence = const Value.absent(),
                Value<int> pass = const Value.absent(),
                Value<String?> translation = const Value.absent(),
                Value<String?> translationLang = const Value.absent(),
              }) => UtteranceCompanion.insert(
                seq: seq,
                id: id,
                sessionId: sessionId,
                momentId: momentId,
                speakerId: speakerId,
                speakerLocked: speakerLocked,
                startMs: startMs,
                endMs: endMs,
                text$: text$,
                textLive: textLive,
                lang: lang,
                asrConfidence: asrConfidence,
                speakerConfidence: speakerConfidence,
                pass: pass,
                translation: translation,
                translationLang: translationLang,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable<Utterance, UtteranceData>(table), $UtteranceReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback:
              ({sessionId = false, momentId = false, speakerId = false, itemRefs = false, itemSourceRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (itemRefs) db.item, if (itemSourceRefs) db.itemSource],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sessionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.sessionId,
                            referencedTable: $UtteranceReferences._sessionIdTable(db),
                            referencedColumn: $UtteranceReferences._sessionIdTable(db).id,
                          ) as T;
                        }
                        if (momentId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.momentId,
                            referencedTable: $UtteranceReferences._momentIdTable(db),
                            referencedColumn: $UtteranceReferences._momentIdTable(db).id,
                          ) as T;
                        }
                        if (speakerId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.speakerId,
                            referencedTable: $UtteranceReferences._speakerIdTable(db),
                            referencedColumn: $UtteranceReferences._speakerIdTable(db).id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (itemRefs)
                        await $_getPrefetchedDataByColumns<UtteranceData, Utterance, ItemData, Item>(
                          currentTable: table,
                          referencedTable: $UtteranceReferences._itemRefsTable(db),
                          managerFromTypedResult: (p0) => $UtteranceReferences(db, table, p0).itemRefs,
                          currentColumn: 'id',
                          referencedColumn: 'owner_from_utterance_id',
                          typedResults: items,
                        ),
                      if (itemSourceRefs)
                        await $_getPrefetchedDataByColumns<UtteranceData, Utterance, ItemSourceData, ItemSource>(
                          currentTable: table,
                          referencedTable: $UtteranceReferences._itemSourceRefsTable(db),
                          managerFromTypedResult: (p0) => $UtteranceReferences(db, table, p0).itemSourceRefs,
                          currentColumn: 'id',
                          referencedColumn: 'utterance_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $UtteranceProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Utterance,
      UtteranceData,
      $UtteranceFilterComposer,
      $UtteranceOrderingComposer,
      $UtteranceAnnotationComposer,
      $UtteranceCreateCompanionBuilder,
      $UtteranceUpdateCompanionBuilder,
      (UtteranceData, $UtteranceReferences),
      UtteranceData,
      PrefetchHooks Function({bool sessionId, bool momentId, bool speakerId, bool itemRefs, bool itemSourceRefs})
    >;
typedef $UtteranceFtsCreateCompanionBuilder = UtteranceFtsCompanion Function({required String text$, Value<int> rowid});
typedef $UtteranceFtsUpdateCompanionBuilder = UtteranceFtsCompanion Function({Value<String> text$, Value<int> rowid});

class $UtteranceFtsFilterComposer extends Composer<_$AppDatabase, UtteranceFts> {
  $UtteranceFtsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get text$ =>
      $composableBuilder(column: $table.text$, builder: (column) => ColumnFilters(column));
}

class $UtteranceFtsOrderingComposer extends Composer<_$AppDatabase, UtteranceFts> {
  $UtteranceFtsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get text$ =>
      $composableBuilder(column: $table.text$, builder: (column) => ColumnOrderings(column));
}

class $UtteranceFtsAnnotationComposer extends Composer<_$AppDatabase, UtteranceFts> {
  $UtteranceFtsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get text$ => $composableBuilder(column: $table.text$, builder: (column) => column);
}

class $UtteranceFtsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          UtteranceFts,
          UtteranceFt,
          $UtteranceFtsFilterComposer,
          $UtteranceFtsOrderingComposer,
          $UtteranceFtsAnnotationComposer,
          $UtteranceFtsCreateCompanionBuilder,
          $UtteranceFtsUpdateCompanionBuilder,
          (UtteranceFt, BaseReferences<_$AppDatabase, UtteranceFts, UtteranceFt>),
          UtteranceFt,
          PrefetchHooks Function()
        > {
  $UtteranceFtsTableManager(_$AppDatabase db, UtteranceFts table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $UtteranceFtsFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $UtteranceFtsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $UtteranceFtsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> text$ = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => UtteranceFtsCompanion(text$: text$, rowid: rowid),
          createCompanionCallback: ({required String text$, Value<int> rowid = const Value.absent()}) =>
              UtteranceFtsCompanion.insert(text$: text$, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<UtteranceFts, UtteranceFt>(table),
                  BaseReferences<_$AppDatabase, UtteranceFts, UtteranceFt>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $UtteranceFtsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      UtteranceFts,
      UtteranceFt,
      $UtteranceFtsFilterComposer,
      $UtteranceFtsOrderingComposer,
      $UtteranceFtsAnnotationComposer,
      $UtteranceFtsCreateCompanionBuilder,
      $UtteranceFtsUpdateCompanionBuilder,
      (UtteranceFt, BaseReferences<_$AppDatabase, UtteranceFts, UtteranceFt>),
      UtteranceFt,
      PrefetchHooks Function()
    >;
typedef $ItemCreateCompanionBuilder = ItemCompanion Function({
  required String id,
  required String momentId,
  required String type,
  required String text$,
  Value<String?> ownerSpeakerId,
  Value<String?> ownerPersonId,
  Value<String?> ownerFromUtteranceId,
  Value<String?> counterpartSpeakerId,
  Value<String?> counterpartPersonId,
  Value<String?> dueDate,
  Value<String?> duePhrase,
  Value<String?> dueCheck,
  required double confidence,
  Value<String> status,
  required String origin,
  Value<int> userEdited,
  required int createdAt,
  required int updatedAt,
  Value<int> rowid,
});
typedef $ItemUpdateCompanionBuilder = ItemCompanion Function({
  Value<String> id,
  Value<String> momentId,
  Value<String> type,
  Value<String> text$,
  Value<String?> ownerSpeakerId,
  Value<String?> ownerPersonId,
  Value<String?> ownerFromUtteranceId,
  Value<String?> counterpartSpeakerId,
  Value<String?> counterpartPersonId,
  Value<String?> dueDate,
  Value<String?> duePhrase,
  Value<String?> dueCheck,
  Value<double> confidence,
  Value<String> status,
  Value<String> origin,
  Value<int> userEdited,
  Value<int> createdAt,
  Value<int> updatedAt,
  Value<int> rowid,
});

final class $ItemReferences extends BaseReferences<_$AppDatabase, Item, ItemData> {
  $ItemReferences(super.$_db, super.$_table, super.$_typedResult);

  static Moment _momentIdTable(_$AppDatabase db) => db.moment.createAlias('item__moment_id__moment__id');

  $MomentProcessedTableManager get momentId {
    final $_column = $_itemColumn<String>('moment_id')!;

    final manager = $MomentTableManager($_db, $_db.moment).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_momentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Speaker _ownerSpeakerIdTable(_$AppDatabase db) =>
      db.speaker.createAlias('item__owner_speaker_id__speaker__id');

  $SpeakerProcessedTableManager? get ownerSpeakerId {
    final $_column = $_itemColumn<String>('owner_speaker_id');
    if ($_column == null) return null;
    final manager = $SpeakerTableManager($_db, $_db.speaker).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerSpeakerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Person _ownerPersonIdTable(_$AppDatabase db) => db.person.createAlias('item__owner_person_id__person__id');

  $PersonProcessedTableManager? get ownerPersonId {
    final $_column = $_itemColumn<String>('owner_person_id');
    if ($_column == null) return null;
    final manager = $PersonTableManager($_db, $_db.person).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Utterance _ownerFromUtteranceIdTable(_$AppDatabase db) =>
      db.utterance.createAlias('item__owner_from_utterance_id__utterance__id');

  $UtteranceProcessedTableManager? get ownerFromUtteranceId {
    final $_column = $_itemColumn<String>('owner_from_utterance_id');
    if ($_column == null) return null;
    final manager = $UtteranceTableManager($_db, $_db.utterance).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerFromUtteranceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Speaker _counterpartSpeakerIdTable(_$AppDatabase db) =>
      db.speaker.createAlias('item__counterpart_speaker_id__speaker__id');

  $SpeakerProcessedTableManager? get counterpartSpeakerId {
    final $_column = $_itemColumn<String>('counterpart_speaker_id');
    if ($_column == null) return null;
    final manager = $SpeakerTableManager($_db, $_db.speaker).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_counterpartSpeakerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Person _counterpartPersonIdTable(_$AppDatabase db) =>
      db.person.createAlias('item__counterpart_person_id__person__id');

  $PersonProcessedTableManager? get counterpartPersonId {
    final $_column = $_itemColumn<String>('counterpart_person_id');
    if ($_column == null) return null;
    final manager = $PersonTableManager($_db, $_db.person).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_counterpartPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<ItemSource, List<ItemSourceData>> _itemSourceRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.itemSource, aliasName: 'item__id__item_source__item_id');

  $ItemSourceProcessedTableManager get itemSourceRefs {
    final manager = $ItemSourceTableManager(
      $_db,
      $_db.itemSource,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemSourceRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<RecapEntry, List<RecapEntryData>> _recapEntryRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.recapEntry, aliasName: 'item__id__recap_entry__item_id');

  $RecapEntryProcessedTableManager get recapEntryRefs {
    final manager = $RecapEntryTableManager(
      $_db,
      $_db.recapEntry,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recapEntryRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<Feedback, List<FeedbackData>> _feedbackRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.feedback, aliasName: 'item__id__feedback__item_id');

  $FeedbackProcessedTableManager get feedbackRefs {
    final manager = $FeedbackTableManager(
      $_db,
      $_db.feedback,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_feedbackRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $ItemFilterComposer extends Composer<_$AppDatabase, Item> {
  $ItemFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get text$ =>
      $composableBuilder(column: $table.text$, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get duePhrase =>
      $composableBuilder(column: $table.duePhrase, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dueCheck =>
      $composableBuilder(column: $table.dueCheck, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get confidence =>
      $composableBuilder(column: $table.confidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userEdited =>
      $composableBuilder(column: $table.userEdited, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $MomentFilterComposer get momentId {
    final $MomentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentFilterComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerFilterComposer get ownerSpeakerId {
    final $SpeakerFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerSpeakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerFilterComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonFilterComposer get ownerPersonId {
    final $PersonFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerPersonId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonFilterComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $UtteranceFilterComposer get ownerFromUtteranceId {
    final $UtteranceFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerFromUtteranceId,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceFilterComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerFilterComposer get counterpartSpeakerId {
    final $SpeakerFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.counterpartSpeakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerFilterComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonFilterComposer get counterpartPersonId {
    final $PersonFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.counterpartPersonId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonFilterComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> itemSourceRefs(Expression<bool> Function($ItemSourceFilterComposer f) f) {
    final $ItemSourceFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itemSource,
      getReferencedColumn: (t) => t.itemId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemSourceFilterComposer(
            $db: $db,
            $table: $db.itemSource,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recapEntryRefs(Expression<bool> Function($RecapEntryFilterComposer f) f) {
    final $RecapEntryFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recapEntry,
      getReferencedColumn: (t) => t.itemId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapEntryFilterComposer(
            $db: $db,
            $table: $db.recapEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> feedbackRefs(Expression<bool> Function($FeedbackFilterComposer f) f) {
    final $FeedbackFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.feedback,
      getReferencedColumn: (t) => t.itemId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $FeedbackFilterComposer(
            $db: $db,
            $table: $db.feedback,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $ItemOrderingComposer extends Composer<_$AppDatabase, Item> {
  $ItemOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get text$ =>
      $composableBuilder(column: $table.text$, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get duePhrase =>
      $composableBuilder(column: $table.duePhrase, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dueCheck =>
      $composableBuilder(column: $table.dueCheck, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get confidence =>
      $composableBuilder(column: $table.confidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userEdited =>
      $composableBuilder(column: $table.userEdited, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $MomentOrderingComposer get momentId {
    final $MomentOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentOrderingComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerOrderingComposer get ownerSpeakerId {
    final $SpeakerOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerSpeakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerOrderingComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonOrderingComposer get ownerPersonId {
    final $PersonOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerPersonId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonOrderingComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $UtteranceOrderingComposer get ownerFromUtteranceId {
    final $UtteranceOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerFromUtteranceId,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceOrderingComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerOrderingComposer get counterpartSpeakerId {
    final $SpeakerOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.counterpartSpeakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerOrderingComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonOrderingComposer get counterpartPersonId {
    final $PersonOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.counterpartPersonId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonOrderingComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ItemAnnotationComposer extends Composer<_$AppDatabase, Item> {
  $ItemAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type => $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get text$ => $composableBuilder(column: $table.text$, builder: (column) => column);

  GeneratedColumn<String> get dueDate => $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get duePhrase => $composableBuilder(column: $table.duePhrase, builder: (column) => column);

  GeneratedColumn<String> get dueCheck => $composableBuilder(column: $table.dueCheck, builder: (column) => column);

  GeneratedColumn<double> get confidence => $composableBuilder(column: $table.confidence, builder: (column) => column);

  GeneratedColumn<String> get status => $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get origin => $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<int> get userEdited => $composableBuilder(column: $table.userEdited, builder: (column) => column);

  GeneratedColumn<int> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $MomentAnnotationComposer get momentId {
    final $MomentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentAnnotationComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerAnnotationComposer get ownerSpeakerId {
    final $SpeakerAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerSpeakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerAnnotationComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonAnnotationComposer get ownerPersonId {
    final $PersonAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerPersonId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonAnnotationComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $UtteranceAnnotationComposer get ownerFromUtteranceId {
    final $UtteranceAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerFromUtteranceId,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceAnnotationComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $SpeakerAnnotationComposer get counterpartSpeakerId {
    final $SpeakerAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.counterpartSpeakerId,
      referencedTable: $db.speaker,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SpeakerAnnotationComposer(
            $db: $db,
            $table: $db.speaker,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PersonAnnotationComposer get counterpartPersonId {
    final $PersonAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.counterpartPersonId,
      referencedTable: $db.person,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $PersonAnnotationComposer(
            $db: $db,
            $table: $db.person,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> itemSourceRefs<T extends Object>(Expression<T> Function($ItemSourceAnnotationComposer a) f) {
    final $ItemSourceAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itemSource,
      getReferencedColumn: (t) => t.itemId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemSourceAnnotationComposer(
            $db: $db,
            $table: $db.itemSource,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recapEntryRefs<T extends Object>(Expression<T> Function($RecapEntryAnnotationComposer a) f) {
    final $RecapEntryAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recapEntry,
      getReferencedColumn: (t) => t.itemId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapEntryAnnotationComposer(
            $db: $db,
            $table: $db.recapEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> feedbackRefs<T extends Object>(Expression<T> Function($FeedbackAnnotationComposer a) f) {
    final $FeedbackAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.feedback,
      getReferencedColumn: (t) => t.itemId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $FeedbackAnnotationComposer(
            $db: $db,
            $table: $db.feedback,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $ItemTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Item,
          ItemData,
          $ItemFilterComposer,
          $ItemOrderingComposer,
          $ItemAnnotationComposer,
          $ItemCreateCompanionBuilder,
          $ItemUpdateCompanionBuilder,
          (ItemData, $ItemReferences),
          ItemData,
          PrefetchHooks Function({
            bool momentId,
            bool ownerSpeakerId,
            bool ownerPersonId,
            bool ownerFromUtteranceId,
            bool counterpartSpeakerId,
            bool counterpartPersonId,
            bool itemSourceRefs,
            bool recapEntryRefs,
            bool feedbackRefs,
          })
        > {
  $ItemTableManager(_$AppDatabase db, Item table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $ItemFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $ItemOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $ItemAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> momentId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> text$ = const Value.absent(),
                Value<String?> ownerSpeakerId = const Value.absent(),
                Value<String?> ownerPersonId = const Value.absent(),
                Value<String?> ownerFromUtteranceId = const Value.absent(),
                Value<String?> counterpartSpeakerId = const Value.absent(),
                Value<String?> counterpartPersonId = const Value.absent(),
                Value<String?> dueDate = const Value.absent(),
                Value<String?> duePhrase = const Value.absent(),
                Value<String?> dueCheck = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> origin = const Value.absent(),
                Value<int> userEdited = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemCompanion(
                id: id,
                momentId: momentId,
                type: type,
                text$: text$,
                ownerSpeakerId: ownerSpeakerId,
                ownerPersonId: ownerPersonId,
                ownerFromUtteranceId: ownerFromUtteranceId,
                counterpartSpeakerId: counterpartSpeakerId,
                counterpartPersonId: counterpartPersonId,
                dueDate: dueDate,
                duePhrase: duePhrase,
                dueCheck: dueCheck,
                confidence: confidence,
                status: status,
                origin: origin,
                userEdited: userEdited,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String momentId,
                required String type,
                required String text$,
                Value<String?> ownerSpeakerId = const Value.absent(),
                Value<String?> ownerPersonId = const Value.absent(),
                Value<String?> ownerFromUtteranceId = const Value.absent(),
                Value<String?> counterpartSpeakerId = const Value.absent(),
                Value<String?> counterpartPersonId = const Value.absent(),
                Value<String?> dueDate = const Value.absent(),
                Value<String?> duePhrase = const Value.absent(),
                Value<String?> dueCheck = const Value.absent(),
                required double confidence,
                Value<String> status = const Value.absent(),
                required String origin,
                Value<int> userEdited = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ItemCompanion.insert(
                id: id,
                momentId: momentId,
                type: type,
                text$: text$,
                ownerSpeakerId: ownerSpeakerId,
                ownerPersonId: ownerPersonId,
                ownerFromUtteranceId: ownerFromUtteranceId,
                counterpartSpeakerId: counterpartSpeakerId,
                counterpartPersonId: counterpartPersonId,
                dueDate: dueDate,
                duePhrase: duePhrase,
                dueCheck: dueCheck,
                confidence: confidence,
                status: status,
                origin: origin,
                userEdited: userEdited,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Item, ItemData>(table), $ItemReferences(db, table, e))).toList(),
          prefetchHooksCallback:
              ({
                momentId = false,
                ownerSpeakerId = false,
                ownerPersonId = false,
                ownerFromUtteranceId = false,
                counterpartSpeakerId = false,
                counterpartPersonId = false,
                itemSourceRefs = false,
                recapEntryRefs = false,
                feedbackRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (itemSourceRefs) db.itemSource,
                    if (recapEntryRefs) db.recapEntry,
                    if (feedbackRefs) db.feedback,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (momentId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.momentId,
                            referencedTable: $ItemReferences._momentIdTable(db),
                            referencedColumn: $ItemReferences._momentIdTable(db).id,
                          ) as T;
                        }
                        if (ownerSpeakerId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.ownerSpeakerId,
                            referencedTable: $ItemReferences._ownerSpeakerIdTable(db),
                            referencedColumn: $ItemReferences._ownerSpeakerIdTable(db).id,
                          ) as T;
                        }
                        if (ownerPersonId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.ownerPersonId,
                            referencedTable: $ItemReferences._ownerPersonIdTable(db),
                            referencedColumn: $ItemReferences._ownerPersonIdTable(db).id,
                          ) as T;
                        }
                        if (ownerFromUtteranceId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.ownerFromUtteranceId,
                            referencedTable: $ItemReferences._ownerFromUtteranceIdTable(db),
                            referencedColumn: $ItemReferences._ownerFromUtteranceIdTable(db).id,
                          ) as T;
                        }
                        if (counterpartSpeakerId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.counterpartSpeakerId,
                            referencedTable: $ItemReferences._counterpartSpeakerIdTable(db),
                            referencedColumn: $ItemReferences._counterpartSpeakerIdTable(db).id,
                          ) as T;
                        }
                        if (counterpartPersonId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.counterpartPersonId,
                            referencedTable: $ItemReferences._counterpartPersonIdTable(db),
                            referencedColumn: $ItemReferences._counterpartPersonIdTable(db).id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (itemSourceRefs)
                        await $_getPrefetchedDataByColumns<ItemData, Item, ItemSourceData, ItemSource>(
                          currentTable: table,
                          referencedTable: $ItemReferences._itemSourceRefsTable(db),
                          managerFromTypedResult: (p0) => $ItemReferences(db, table, p0).itemSourceRefs,
                          currentColumn: 'id',
                          referencedColumn: 'item_id',
                          typedResults: items,
                        ),
                      if (recapEntryRefs)
                        await $_getPrefetchedDataByColumns<ItemData, Item, RecapEntryData, RecapEntry>(
                          currentTable: table,
                          referencedTable: $ItemReferences._recapEntryRefsTable(db),
                          managerFromTypedResult: (p0) => $ItemReferences(db, table, p0).recapEntryRefs,
                          currentColumn: 'id',
                          referencedColumn: 'item_id',
                          typedResults: items,
                        ),
                      if (feedbackRefs)
                        await $_getPrefetchedDataByColumns<ItemData, Item, FeedbackData, Feedback>(
                          currentTable: table,
                          referencedTable: $ItemReferences._feedbackRefsTable(db),
                          managerFromTypedResult: (p0) => $ItemReferences(db, table, p0).feedbackRefs,
                          currentColumn: 'id',
                          referencedColumn: 'item_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $ItemProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Item,
      ItemData,
      $ItemFilterComposer,
      $ItemOrderingComposer,
      $ItemAnnotationComposer,
      $ItemCreateCompanionBuilder,
      $ItemUpdateCompanionBuilder,
      (ItemData, $ItemReferences),
      ItemData,
      PrefetchHooks Function({
        bool momentId,
        bool ownerSpeakerId,
        bool ownerPersonId,
        bool ownerFromUtteranceId,
        bool counterpartSpeakerId,
        bool counterpartPersonId,
        bool itemSourceRefs,
        bool recapEntryRefs,
        bool feedbackRefs,
      })
    >;
typedef $ItemSourceCreateCompanionBuilder = ItemSourceCompanion Function({
  required String itemId,
  required String utteranceId,
  Value<int> rowid,
});
typedef $ItemSourceUpdateCompanionBuilder = ItemSourceCompanion Function({
  Value<String> itemId,
  Value<String> utteranceId,
  Value<int> rowid,
});

final class $ItemSourceReferences extends BaseReferences<_$AppDatabase, ItemSource, ItemSourceData> {
  $ItemSourceReferences(super.$_db, super.$_table, super.$_typedResult);

  static Item _itemIdTable(_$AppDatabase db) => db.item.createAlias('item_source__item_id__item__id');

  $ItemProcessedTableManager get itemId {
    final $_column = $_itemColumn<String>('item_id')!;

    final manager = $ItemTableManager($_db, $_db.item).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Utterance _utteranceIdTable(_$AppDatabase db) =>
      db.utterance.createAlias('item_source__utterance_id__utterance__id');

  $UtteranceProcessedTableManager get utteranceId {
    final $_column = $_itemColumn<String>('utterance_id')!;

    final manager = $UtteranceTableManager($_db, $_db.utterance).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_utteranceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $ItemSourceFilterComposer extends Composer<_$AppDatabase, ItemSource> {
  $ItemSourceFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $ItemFilterComposer get itemId {
    final $ItemFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemFilterComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $UtteranceFilterComposer get utteranceId {
    final $UtteranceFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utteranceId,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceFilterComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ItemSourceOrderingComposer extends Composer<_$AppDatabase, ItemSource> {
  $ItemSourceOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $ItemOrderingComposer get itemId {
    final $ItemOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemOrderingComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $UtteranceOrderingComposer get utteranceId {
    final $UtteranceOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utteranceId,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceOrderingComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ItemSourceAnnotationComposer extends Composer<_$AppDatabase, ItemSource> {
  $ItemSourceAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $ItemAnnotationComposer get itemId {
    final $ItemAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemAnnotationComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $UtteranceAnnotationComposer get utteranceId {
    final $UtteranceAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utteranceId,
      referencedTable: $db.utterance,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $UtteranceAnnotationComposer(
            $db: $db,
            $table: $db.utterance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ItemSourceTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          ItemSource,
          ItemSourceData,
          $ItemSourceFilterComposer,
          $ItemSourceOrderingComposer,
          $ItemSourceAnnotationComposer,
          $ItemSourceCreateCompanionBuilder,
          $ItemSourceUpdateCompanionBuilder,
          (ItemSourceData, $ItemSourceReferences),
          ItemSourceData,
          PrefetchHooks Function({bool itemId, bool utteranceId})
        > {
  $ItemSourceTableManager(_$AppDatabase db, ItemSource table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $ItemSourceFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $ItemSourceOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $ItemSourceAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> itemId = const Value.absent(),
            Value<String> utteranceId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => ItemSourceCompanion(itemId: itemId, utteranceId: utteranceId, rowid: rowid),
          createCompanionCallback: ({
            required String itemId,
            required String utteranceId,
            Value<int> rowid = const Value.absent(),
          }) => ItemSourceCompanion.insert(itemId: itemId, utteranceId: utteranceId, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable<ItemSource, ItemSourceData>(table), $ItemSourceReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({itemId = false, utteranceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itemId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.itemId,
                        referencedTable: $ItemSourceReferences._itemIdTable(db),
                        referencedColumn: $ItemSourceReferences._itemIdTable(db).id,
                      ) as T;
                    }
                    if (utteranceId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.utteranceId,
                        referencedTable: $ItemSourceReferences._utteranceIdTable(db),
                        referencedColumn: $ItemSourceReferences._utteranceIdTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $ItemSourceProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      ItemSource,
      ItemSourceData,
      $ItemSourceFilterComposer,
      $ItemSourceOrderingComposer,
      $ItemSourceAnnotationComposer,
      $ItemSourceCreateCompanionBuilder,
      $ItemSourceUpdateCompanionBuilder,
      (ItemSourceData, $ItemSourceReferences),
      ItemSourceData,
      PrefetchHooks Function({bool itemId, bool utteranceId})
    >;
typedef $MediaCreateCompanionBuilder = MediaCompanion Function({
  required String id,
  required String sessionId,
  required String kind,
  required String relPath,
  required int startMs,
  required int endMs,
  required int bytes,
  required String codec,
  required int deleteAt,
  Value<int?> deletedAt,
  Value<int> rowid,
});
typedef $MediaUpdateCompanionBuilder = MediaCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<String> kind,
  Value<String> relPath,
  Value<int> startMs,
  Value<int> endMs,
  Value<int> bytes,
  Value<String> codec,
  Value<int> deleteAt,
  Value<int?> deletedAt,
  Value<int> rowid,
});

final class $MediaReferences extends BaseReferences<_$AppDatabase, Media, MediaData> {
  $MediaReferences(super.$_db, super.$_table, super.$_typedResult);

  static Session _sessionIdTable(_$AppDatabase db) => db.session.createAlias('media__session_id__session__id');

  $SessionProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $SessionTableManager($_db, $_db.session).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $MediaFilterComposer extends Composer<_$AppDatabase, Media> {
  $MediaFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relPath =>
      $composableBuilder(column: $table.relPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endMs => $composableBuilder(column: $table.endMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bytes => $composableBuilder(column: $table.bytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codec =>
      $composableBuilder(column: $table.codec, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deleteAt =>
      $composableBuilder(column: $table.deleteAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $SessionFilterComposer get sessionId {
    final $SessionFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionFilterComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MediaOrderingComposer extends Composer<_$AppDatabase, Media> {
  $MediaOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relPath =>
      $composableBuilder(column: $table.relPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startMs =>
      $composableBuilder(column: $table.startMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endMs =>
      $composableBuilder(column: $table.endMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bytes =>
      $composableBuilder(column: $table.bytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codec =>
      $composableBuilder(column: $table.codec, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deleteAt =>
      $composableBuilder(column: $table.deleteAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $SessionOrderingComposer get sessionId {
    final $SessionOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionOrderingComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MediaAnnotationComposer extends Composer<_$AppDatabase, Media> {
  $MediaAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get relPath => $composableBuilder(column: $table.relPath, builder: (column) => column);

  GeneratedColumn<int> get startMs => $composableBuilder(column: $table.startMs, builder: (column) => column);

  GeneratedColumn<int> get endMs => $composableBuilder(column: $table.endMs, builder: (column) => column);

  GeneratedColumn<int> get bytes => $composableBuilder(column: $table.bytes, builder: (column) => column);

  GeneratedColumn<String> get codec => $composableBuilder(column: $table.codec, builder: (column) => column);

  GeneratedColumn<int> get deleteAt => $composableBuilder(column: $table.deleteAt, builder: (column) => column);

  GeneratedColumn<int> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $SessionAnnotationComposer get sessionId {
    final $SessionAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionAnnotationComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MediaTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Media,
          MediaData,
          $MediaFilterComposer,
          $MediaOrderingComposer,
          $MediaAnnotationComposer,
          $MediaCreateCompanionBuilder,
          $MediaUpdateCompanionBuilder,
          (MediaData, $MediaReferences),
          MediaData,
          PrefetchHooks Function({bool sessionId})
        > {
  $MediaTableManager(_$AppDatabase db, Media table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $MediaFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $MediaOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $MediaAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> relPath = const Value.absent(),
                Value<int> startMs = const Value.absent(),
                Value<int> endMs = const Value.absent(),
                Value<int> bytes = const Value.absent(),
                Value<String> codec = const Value.absent(),
                Value<int> deleteAt = const Value.absent(),
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCompanion(
                id: id,
                sessionId: sessionId,
                kind: kind,
                relPath: relPath,
                startMs: startMs,
                endMs: endMs,
                bytes: bytes,
                codec: codec,
                deleteAt: deleteAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required String kind,
                required String relPath,
                required int startMs,
                required int endMs,
                required int bytes,
                required String codec,
                required int deleteAt,
                Value<int?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCompanion.insert(
                id: id,
                sessionId: sessionId,
                kind: kind,
                relPath: relPath,
                startMs: startMs,
                endMs: endMs,
                bytes: bytes,
                codec: codec,
                deleteAt: deleteAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Media, MediaData>(table), $MediaReferences(db, table, e))).toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.sessionId,
                        referencedTable: $MediaReferences._sessionIdTable(db),
                        referencedColumn: $MediaReferences._sessionIdTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $MediaProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Media,
      MediaData,
      $MediaFilterComposer,
      $MediaOrderingComposer,
      $MediaAnnotationComposer,
      $MediaCreateCompanionBuilder,
      $MediaUpdateCompanionBuilder,
      (MediaData, $MediaReferences),
      MediaData,
      PrefetchHooks Function({bool sessionId})
    >;
typedef $MarkCreateCompanionBuilder = MarkCompanion Function({
  required String id,
  required String sessionId,
  required int atMs,
  required String source,
  Value<int> rowid,
});
typedef $MarkUpdateCompanionBuilder = MarkCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<int> atMs,
  Value<String> source,
  Value<int> rowid,
});

final class $MarkReferences extends BaseReferences<_$AppDatabase, Mark, MarkData> {
  $MarkReferences(super.$_db, super.$_table, super.$_typedResult);

  static Session _sessionIdTable(_$AppDatabase db) => db.session.createAlias('mark__session_id__session__id');

  $SessionProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $SessionTableManager($_db, $_db.session).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $MarkFilterComposer extends Composer<_$AppDatabase, Mark> {
  $MarkFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get atMs => $composableBuilder(column: $table.atMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => ColumnFilters(column));

  $SessionFilterComposer get sessionId {
    final $SessionFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionFilterComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MarkOrderingComposer extends Composer<_$AppDatabase, Mark> {
  $MarkOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get atMs =>
      $composableBuilder(column: $table.atMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => ColumnOrderings(column));

  $SessionOrderingComposer get sessionId {
    final $SessionOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionOrderingComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MarkAnnotationComposer extends Composer<_$AppDatabase, Mark> {
  $MarkAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get atMs => $composableBuilder(column: $table.atMs, builder: (column) => column);

  GeneratedColumn<String> get source => $composableBuilder(column: $table.source, builder: (column) => column);

  $SessionAnnotationComposer get sessionId {
    final $SessionAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.session,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $SessionAnnotationComposer(
            $db: $db,
            $table: $db.session,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MarkTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Mark,
          MarkData,
          $MarkFilterComposer,
          $MarkOrderingComposer,
          $MarkAnnotationComposer,
          $MarkCreateCompanionBuilder,
          $MarkUpdateCompanionBuilder,
          (MarkData, $MarkReferences),
          MarkData,
          PrefetchHooks Function({bool sessionId})
        > {
  $MarkTableManager(_$AppDatabase db, Mark table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $MarkFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $MarkOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $MarkAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<int> atMs = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => MarkCompanion(id: id, sessionId: sessionId, atMs: atMs, source: source, rowid: rowid),
          createCompanionCallback: ({
            required String id,
            required String sessionId,
            required int atMs,
            required String source,
            Value<int> rowid = const Value.absent(),
          }) => MarkCompanion.insert(id: id, sessionId: sessionId, atMs: atMs, source: source, rowid: rowid),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Mark, MarkData>(table), $MarkReferences(db, table, e))).toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.sessionId,
                        referencedTable: $MarkReferences._sessionIdTable(db),
                        referencedColumn: $MarkReferences._sessionIdTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $MarkProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Mark,
      MarkData,
      $MarkFilterComposer,
      $MarkOrderingComposer,
      $MarkAnnotationComposer,
      $MarkCreateCompanionBuilder,
      $MarkUpdateCompanionBuilder,
      (MarkData, $MarkReferences),
      MarkData,
      PrefetchHooks Function({bool sessionId})
    >;
typedef $RecapCreateCompanionBuilder = RecapCompanion Function({
  required String id,
  required String day,
  required int cutoffAt,
  required int generatedAt,
  required String modelVersion,
  Value<int> quietDay,
  Value<String?> funLine,
  Value<int?> openedAt,
  Value<int> rowid,
});
typedef $RecapUpdateCompanionBuilder = RecapCompanion Function({
  Value<String> id,
  Value<String> day,
  Value<int> cutoffAt,
  Value<int> generatedAt,
  Value<String> modelVersion,
  Value<int> quietDay,
  Value<String?> funLine,
  Value<int?> openedAt,
  Value<int> rowid,
});

final class $RecapReferences extends BaseReferences<_$AppDatabase, Recap, RecapData> {
  $RecapReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<RecapEntry, List<RecapEntryData>> _recapEntryRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.recapEntry, aliasName: 'recap__id__recap_entry__recap_id');

  $RecapEntryProcessedTableManager get recapEntryRefs {
    final manager = $RecapEntryTableManager(
      $_db,
      $_db.recapEntry,
    ).filter((f) => f.recapId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recapEntryRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<Feedback, List<FeedbackData>> _feedbackRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.feedback, aliasName: 'recap__id__feedback__recap_id');

  $FeedbackProcessedTableManager get feedbackRefs {
    final manager = $FeedbackTableManager(
      $_db,
      $_db.feedback,
    ).filter((f) => f.recapId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_feedbackRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $RecapFilterComposer extends Composer<_$AppDatabase, Recap> {
  $RecapFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get day => $composableBuilder(column: $table.day, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cutoffAt =>
      $composableBuilder(column: $table.cutoffAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get generatedAt =>
      $composableBuilder(column: $table.generatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get modelVersion =>
      $composableBuilder(column: $table.modelVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quietDay =>
      $composableBuilder(column: $table.quietDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get funLine =>
      $composableBuilder(column: $table.funLine, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get openedAt =>
      $composableBuilder(column: $table.openedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> recapEntryRefs(Expression<bool> Function($RecapEntryFilterComposer f) f) {
    final $RecapEntryFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recapEntry,
      getReferencedColumn: (t) => t.recapId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapEntryFilterComposer(
            $db: $db,
            $table: $db.recapEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> feedbackRefs(Expression<bool> Function($FeedbackFilterComposer f) f) {
    final $FeedbackFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.feedback,
      getReferencedColumn: (t) => t.recapId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $FeedbackFilterComposer(
            $db: $db,
            $table: $db.feedback,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $RecapOrderingComposer extends Composer<_$AppDatabase, Recap> {
  $RecapOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cutoffAt =>
      $composableBuilder(column: $table.cutoffAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get generatedAt =>
      $composableBuilder(column: $table.generatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get modelVersion =>
      $composableBuilder(column: $table.modelVersion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quietDay =>
      $composableBuilder(column: $table.quietDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get funLine =>
      $composableBuilder(column: $table.funLine, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get openedAt =>
      $composableBuilder(column: $table.openedAt, builder: (column) => ColumnOrderings(column));
}

class $RecapAnnotationComposer extends Composer<_$AppDatabase, Recap> {
  $RecapAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get day => $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<int> get cutoffAt => $composableBuilder(column: $table.cutoffAt, builder: (column) => column);

  GeneratedColumn<int> get generatedAt => $composableBuilder(column: $table.generatedAt, builder: (column) => column);

  GeneratedColumn<String> get modelVersion =>
      $composableBuilder(column: $table.modelVersion, builder: (column) => column);

  GeneratedColumn<int> get quietDay => $composableBuilder(column: $table.quietDay, builder: (column) => column);

  GeneratedColumn<String> get funLine => $composableBuilder(column: $table.funLine, builder: (column) => column);

  GeneratedColumn<int> get openedAt => $composableBuilder(column: $table.openedAt, builder: (column) => column);

  Expression<T> recapEntryRefs<T extends Object>(Expression<T> Function($RecapEntryAnnotationComposer a) f) {
    final $RecapEntryAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recapEntry,
      getReferencedColumn: (t) => t.recapId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapEntryAnnotationComposer(
            $db: $db,
            $table: $db.recapEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> feedbackRefs<T extends Object>(Expression<T> Function($FeedbackAnnotationComposer a) f) {
    final $FeedbackAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.feedback,
      getReferencedColumn: (t) => t.recapId,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $FeedbackAnnotationComposer(
            $db: $db,
            $table: $db.feedback,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $RecapTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Recap,
          RecapData,
          $RecapFilterComposer,
          $RecapOrderingComposer,
          $RecapAnnotationComposer,
          $RecapCreateCompanionBuilder,
          $RecapUpdateCompanionBuilder,
          (RecapData, $RecapReferences),
          RecapData,
          PrefetchHooks Function({bool recapEntryRefs, bool feedbackRefs})
        > {
  $RecapTableManager(_$AppDatabase db, Recap table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $RecapFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $RecapOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $RecapAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<int> cutoffAt = const Value.absent(),
                Value<int> generatedAt = const Value.absent(),
                Value<String> modelVersion = const Value.absent(),
                Value<int> quietDay = const Value.absent(),
                Value<String?> funLine = const Value.absent(),
                Value<int?> openedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecapCompanion(
                id: id,
                day: day,
                cutoffAt: cutoffAt,
                generatedAt: generatedAt,
                modelVersion: modelVersion,
                quietDay: quietDay,
                funLine: funLine,
                openedAt: openedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String day,
                required int cutoffAt,
                required int generatedAt,
                required String modelVersion,
                Value<int> quietDay = const Value.absent(),
                Value<String?> funLine = const Value.absent(),
                Value<int?> openedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecapCompanion.insert(
                id: id,
                day: day,
                cutoffAt: cutoffAt,
                generatedAt: generatedAt,
                modelVersion: modelVersion,
                quietDay: quietDay,
                funLine: funLine,
                openedAt: openedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Recap, RecapData>(table), $RecapReferences(db, table, e))).toList(),
          prefetchHooksCallback: ({recapEntryRefs = false, feedbackRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (recapEntryRefs) db.recapEntry, if (feedbackRefs) db.feedback],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recapEntryRefs)
                    await $_getPrefetchedDataByColumns<RecapData, Recap, RecapEntryData, RecapEntry>(
                      currentTable: table,
                      referencedTable: $RecapReferences._recapEntryRefsTable(db),
                      managerFromTypedResult: (p0) => $RecapReferences(db, table, p0).recapEntryRefs,
                      currentColumn: 'id',
                      referencedColumn: 'recap_id',
                      typedResults: items,
                    ),
                  if (feedbackRefs)
                    await $_getPrefetchedDataByColumns<RecapData, Recap, FeedbackData, Feedback>(
                      currentTable: table,
                      referencedTable: $RecapReferences._feedbackRefsTable(db),
                      managerFromTypedResult: (p0) => $RecapReferences(db, table, p0).feedbackRefs,
                      currentColumn: 'id',
                      referencedColumn: 'recap_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $RecapProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Recap,
      RecapData,
      $RecapFilterComposer,
      $RecapOrderingComposer,
      $RecapAnnotationComposer,
      $RecapCreateCompanionBuilder,
      $RecapUpdateCompanionBuilder,
      (RecapData, $RecapReferences),
      RecapData,
      PrefetchHooks Function({bool recapEntryRefs, bool feedbackRefs})
    >;
typedef $RecapEntryCreateCompanionBuilder = RecapEntryCompanion Function({
  required String recapId,
  required int position,
  required String section,
  Value<String?> itemId,
  Value<String?> momentId,
  Value<int> rowid,
});
typedef $RecapEntryUpdateCompanionBuilder = RecapEntryCompanion Function({
  Value<String> recapId,
  Value<int> position,
  Value<String> section,
  Value<String?> itemId,
  Value<String?> momentId,
  Value<int> rowid,
});

final class $RecapEntryReferences extends BaseReferences<_$AppDatabase, RecapEntry, RecapEntryData> {
  $RecapEntryReferences(super.$_db, super.$_table, super.$_typedResult);

  static Recap _recapIdTable(_$AppDatabase db) => db.recap.createAlias('recap_entry__recap_id__recap__id');

  $RecapProcessedTableManager get recapId {
    final $_column = $_itemColumn<String>('recap_id')!;

    final manager = $RecapTableManager($_db, $_db.recap).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Item _itemIdTable(_$AppDatabase db) => db.item.createAlias('recap_entry__item_id__item__id');

  $ItemProcessedTableManager? get itemId {
    final $_column = $_itemColumn<String>('item_id');
    if ($_column == null) return null;
    final manager = $ItemTableManager($_db, $_db.item).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Moment _momentIdTable(_$AppDatabase db) => db.moment.createAlias('recap_entry__moment_id__moment__id');

  $MomentProcessedTableManager? get momentId {
    final $_column = $_itemColumn<String>('moment_id');
    if ($_column == null) return null;
    final manager = $MomentTableManager($_db, $_db.moment).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_momentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $RecapEntryFilterComposer extends Composer<_$AppDatabase, RecapEntry> {
  $RecapEntryFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => ColumnFilters(column));

  $RecapFilterComposer get recapId {
    final $RecapFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recapId,
      referencedTable: $db.recap,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapFilterComposer(
            $db: $db,
            $table: $db.recap,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $ItemFilterComposer get itemId {
    final $ItemFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemFilterComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MomentFilterComposer get momentId {
    final $MomentFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentFilterComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $RecapEntryOrderingComposer extends Composer<_$AppDatabase, RecapEntry> {
  $RecapEntryOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => ColumnOrderings(column));

  $RecapOrderingComposer get recapId {
    final $RecapOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recapId,
      referencedTable: $db.recap,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapOrderingComposer(
            $db: $db,
            $table: $db.recap,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $ItemOrderingComposer get itemId {
    final $ItemOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemOrderingComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MomentOrderingComposer get momentId {
    final $MomentOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentOrderingComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $RecapEntryAnnotationComposer extends Composer<_$AppDatabase, RecapEntry> {
  $RecapEntryAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get position => $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get section => $composableBuilder(column: $table.section, builder: (column) => column);

  $RecapAnnotationComposer get recapId {
    final $RecapAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recapId,
      referencedTable: $db.recap,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapAnnotationComposer(
            $db: $db,
            $table: $db.recap,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $ItemAnnotationComposer get itemId {
    final $ItemAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemAnnotationComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MomentAnnotationComposer get momentId {
    final $MomentAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moment,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $MomentAnnotationComposer(
            $db: $db,
            $table: $db.moment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $RecapEntryTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          RecapEntry,
          RecapEntryData,
          $RecapEntryFilterComposer,
          $RecapEntryOrderingComposer,
          $RecapEntryAnnotationComposer,
          $RecapEntryCreateCompanionBuilder,
          $RecapEntryUpdateCompanionBuilder,
          (RecapEntryData, $RecapEntryReferences),
          RecapEntryData,
          PrefetchHooks Function({bool recapId, bool itemId, bool momentId})
        > {
  $RecapEntryTableManager(_$AppDatabase db, RecapEntry table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $RecapEntryFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $RecapEntryOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $RecapEntryAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> recapId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<String?> itemId = const Value.absent(),
                Value<String?> momentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecapEntryCompanion(
                recapId: recapId,
                position: position,
                section: section,
                itemId: itemId,
                momentId: momentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String recapId,
                required int position,
                required String section,
                Value<String?> itemId = const Value.absent(),
                Value<String?> momentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecapEntryCompanion.insert(
                recapId: recapId,
                position: position,
                section: section,
                itemId: itemId,
                momentId: momentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable<RecapEntry, RecapEntryData>(table), $RecapEntryReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({recapId = false, itemId = false, momentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recapId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.recapId,
                        referencedTable: $RecapEntryReferences._recapIdTable(db),
                        referencedColumn: $RecapEntryReferences._recapIdTable(db).id,
                      ) as T;
                    }
                    if (itemId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.itemId,
                        referencedTable: $RecapEntryReferences._itemIdTable(db),
                        referencedColumn: $RecapEntryReferences._itemIdTable(db).id,
                      ) as T;
                    }
                    if (momentId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.momentId,
                        referencedTable: $RecapEntryReferences._momentIdTable(db),
                        referencedColumn: $RecapEntryReferences._momentIdTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $RecapEntryProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      RecapEntry,
      RecapEntryData,
      $RecapEntryFilterComposer,
      $RecapEntryOrderingComposer,
      $RecapEntryAnnotationComposer,
      $RecapEntryCreateCompanionBuilder,
      $RecapEntryUpdateCompanionBuilder,
      (RecapEntryData, $RecapEntryReferences),
      RecapEntryData,
      PrefetchHooks Function({bool recapId, bool itemId, bool momentId})
    >;
typedef $FeedbackCreateCompanionBuilder = FeedbackCompanion Function({
  required String id,
  required String itemId,
  Value<String?> recapId,
  required String verdict,
  required int at,
  Value<int> rowid,
});
typedef $FeedbackUpdateCompanionBuilder = FeedbackCompanion Function({
  Value<String> id,
  Value<String> itemId,
  Value<String?> recapId,
  Value<String> verdict,
  Value<int> at,
  Value<int> rowid,
});

final class $FeedbackReferences extends BaseReferences<_$AppDatabase, Feedback, FeedbackData> {
  $FeedbackReferences(super.$_db, super.$_table, super.$_typedResult);

  static Item _itemIdTable(_$AppDatabase db) => db.item.createAlias('feedback__item_id__item__id');

  $ItemProcessedTableManager get itemId {
    final $_column = $_itemColumn<String>('item_id')!;

    final manager = $ItemTableManager($_db, $_db.item).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }

  static Recap _recapIdTable(_$AppDatabase db) => db.recap.createAlias('feedback__recap_id__recap__id');

  $RecapProcessedTableManager? get recapId {
    final $_column = $_itemColumn<String>('recap_id');
    if ($_column == null) return null;
    final manager = $RecapTableManager($_db, $_db.recap).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $FeedbackFilterComposer extends Composer<_$AppDatabase, Feedback> {
  $FeedbackFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get verdict =>
      $composableBuilder(column: $table.verdict, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get at => $composableBuilder(column: $table.at, builder: (column) => ColumnFilters(column));

  $ItemFilterComposer get itemId {
    final $ItemFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemFilterComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $RecapFilterComposer get recapId {
    final $RecapFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recapId,
      referencedTable: $db.recap,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapFilterComposer(
            $db: $db,
            $table: $db.recap,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $FeedbackOrderingComposer extends Composer<_$AppDatabase, Feedback> {
  $FeedbackOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get verdict =>
      $composableBuilder(column: $table.verdict, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get at => $composableBuilder(column: $table.at, builder: (column) => ColumnOrderings(column));

  $ItemOrderingComposer get itemId {
    final $ItemOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemOrderingComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $RecapOrderingComposer get recapId {
    final $RecapOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recapId,
      referencedTable: $db.recap,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapOrderingComposer(
            $db: $db,
            $table: $db.recap,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $FeedbackAnnotationComposer extends Composer<_$AppDatabase, Feedback> {
  $FeedbackAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get verdict => $composableBuilder(column: $table.verdict, builder: (column) => column);

  GeneratedColumn<int> get at => $composableBuilder(column: $table.at, builder: (column) => column);

  $ItemAnnotationComposer get itemId {
    final $ItemAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.item,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $ItemAnnotationComposer(
            $db: $db,
            $table: $db.item,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $RecapAnnotationComposer get recapId {
    final $RecapAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recapId,
      referencedTable: $db.recap,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
          $RecapAnnotationComposer(
            $db: $db,
            $table: $db.recap,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $FeedbackTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Feedback,
          FeedbackData,
          $FeedbackFilterComposer,
          $FeedbackOrderingComposer,
          $FeedbackAnnotationComposer,
          $FeedbackCreateCompanionBuilder,
          $FeedbackUpdateCompanionBuilder,
          (FeedbackData, $FeedbackReferences),
          FeedbackData,
          PrefetchHooks Function({bool itemId, bool recapId})
        > {
  $FeedbackTableManager(_$AppDatabase db, Feedback table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $FeedbackFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $FeedbackOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $FeedbackAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<String?> recapId = const Value.absent(),
            Value<String> verdict = const Value.absent(),
            Value<int> at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => FeedbackCompanion(id: id, itemId: itemId, recapId: recapId, verdict: verdict, at: at, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String itemId,
                Value<String?> recapId = const Value.absent(),
                required String verdict,
                required int at,
                Value<int> rowid = const Value.absent(),
              }) => FeedbackCompanion.insert(
                id: id,
                itemId: itemId,
                recapId: recapId,
                verdict: verdict,
                at: at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable<Feedback, FeedbackData>(table), $FeedbackReferences(db, table, e))).toList(),
          prefetchHooksCallback: ({itemId = false, recapId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itemId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.itemId,
                        referencedTable: $FeedbackReferences._itemIdTable(db),
                        referencedColumn: $FeedbackReferences._itemIdTable(db).id,
                      ) as T;
                    }
                    if (recapId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.recapId,
                        referencedTable: $FeedbackReferences._recapIdTable(db),
                        referencedColumn: $FeedbackReferences._recapIdTable(db).id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $FeedbackProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Feedback,
      FeedbackData,
      $FeedbackFilterComposer,
      $FeedbackOrderingComposer,
      $FeedbackAnnotationComposer,
      $FeedbackCreateCompanionBuilder,
      $FeedbackUpdateCompanionBuilder,
      (FeedbackData, $FeedbackReferences),
      FeedbackData,
      PrefetchHooks Function({bool itemId, bool recapId})
    >;
typedef $PauseZoneCreateCompanionBuilder = PauseZoneCompanion Function({
  required String id,
  required String name,
  required double lat,
  required double lng,
  required int radiusM,
  Value<int> rowid,
});
typedef $PauseZoneUpdateCompanionBuilder = PauseZoneCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<double> lat,
  Value<double> lng,
  Value<int> radiusM,
  Value<int> rowid,
});

class $PauseZoneFilterComposer extends Composer<_$AppDatabase, PauseZone> {
  $PauseZoneFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lat => $composableBuilder(column: $table.lat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lng => $composableBuilder(column: $table.lng, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get radiusM =>
      $composableBuilder(column: $table.radiusM, builder: (column) => ColumnFilters(column));
}

class $PauseZoneOrderingComposer extends Composer<_$AppDatabase, PauseZone> {
  $PauseZoneOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get radiusM =>
      $composableBuilder(column: $table.radiusM, builder: (column) => ColumnOrderings(column));
}

class $PauseZoneAnnotationComposer extends Composer<_$AppDatabase, PauseZone> {
  $PauseZoneAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name => $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get lat => $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng => $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<int> get radiusM => $composableBuilder(column: $table.radiusM, builder: (column) => column);
}

class $PauseZoneTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          PauseZone,
          PauseZoneData,
          $PauseZoneFilterComposer,
          $PauseZoneOrderingComposer,
          $PauseZoneAnnotationComposer,
          $PauseZoneCreateCompanionBuilder,
          $PauseZoneUpdateCompanionBuilder,
          (PauseZoneData, BaseReferences<_$AppDatabase, PauseZone, PauseZoneData>),
          PauseZoneData,
          PrefetchHooks Function()
        > {
  $PauseZoneTableManager(_$AppDatabase db, PauseZone table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $PauseZoneFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $PauseZoneOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $PauseZoneAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> lat = const Value.absent(),
            Value<double> lng = const Value.absent(),
            Value<int> radiusM = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => PauseZoneCompanion(id: id, name: name, lat: lat, lng: lng, radiusM: radiusM, rowid: rowid),
          createCompanionCallback: ({
            required String id,
            required String name,
            required double lat,
            required double lng,
            required int radiusM,
            Value<int> rowid = const Value.absent(),
          }) => PauseZoneCompanion.insert(id: id, name: name, lat: lat, lng: lng, radiusM: radiusM, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<PauseZone, PauseZoneData>(table),
                  BaseReferences<_$AppDatabase, PauseZone, PauseZoneData>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $PauseZoneProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      PauseZone,
      PauseZoneData,
      $PauseZoneFilterComposer,
      $PauseZoneOrderingComposer,
      $PauseZoneAnnotationComposer,
      $PauseZoneCreateCompanionBuilder,
      $PauseZoneUpdateCompanionBuilder,
      (PauseZoneData, BaseReferences<_$AppDatabase, PauseZone, PauseZoneData>),
      PauseZoneData,
      PrefetchHooks Function()
    >;
typedef $CloudJobCreateCompanionBuilder = CloudJobCompanion Function({
  required String id,
  required String kind,
  required String targetId,
  required String status,
  Value<int> attempts,
  required int nextAttemptAt,
  Value<String?> lastError,
  Value<int> rowid,
});
typedef $CloudJobUpdateCompanionBuilder = CloudJobCompanion Function({
  Value<String> id,
  Value<String> kind,
  Value<String> targetId,
  Value<String> status,
  Value<int> attempts,
  Value<int> nextAttemptAt,
  Value<String?> lastError,
  Value<int> rowid,
});

class $CloudJobFilterComposer extends Composer<_$AppDatabase, CloudJob> {
  $CloudJobFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get nextAttemptAt =>
      $composableBuilder(column: $table.nextAttemptAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => ColumnFilters(column));
}

class $CloudJobOrderingComposer extends Composer<_$AppDatabase, CloudJob> {
  $CloudJobOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get nextAttemptAt =>
      $composableBuilder(column: $table.nextAttemptAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => ColumnOrderings(column));
}

class $CloudJobAnnotationComposer extends Composer<_$AppDatabase, CloudJob> {
  $CloudJobAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get targetId => $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<String> get status => $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get attempts => $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<int> get nextAttemptAt =>
      $composableBuilder(column: $table.nextAttemptAt, builder: (column) => column);

  GeneratedColumn<String> get lastError => $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $CloudJobTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CloudJob,
          CloudJobData,
          $CloudJobFilterComposer,
          $CloudJobOrderingComposer,
          $CloudJobAnnotationComposer,
          $CloudJobCreateCompanionBuilder,
          $CloudJobUpdateCompanionBuilder,
          (CloudJobData, BaseReferences<_$AppDatabase, CloudJob, CloudJobData>),
          CloudJobData,
          PrefetchHooks Function()
        > {
  $CloudJobTableManager(_$AppDatabase db, CloudJob table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $CloudJobFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $CloudJobOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $CloudJobAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> targetId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<int> nextAttemptAt = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CloudJobCompanion(
                id: id,
                kind: kind,
                targetId: targetId,
                status: status,
                attempts: attempts,
                nextAttemptAt: nextAttemptAt,
                lastError: lastError,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                required String targetId,
                required String status,
                Value<int> attempts = const Value.absent(),
                required int nextAttemptAt,
                Value<String?> lastError = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CloudJobCompanion.insert(
                id: id,
                kind: kind,
                targetId: targetId,
                status: status,
                attempts: attempts,
                nextAttemptAt: nextAttemptAt,
                lastError: lastError,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<CloudJob, CloudJobData>(table),
                  BaseReferences<_$AppDatabase, CloudJob, CloudJobData>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CloudJobProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CloudJob,
      CloudJobData,
      $CloudJobFilterComposer,
      $CloudJobOrderingComposer,
      $CloudJobAnnotationComposer,
      $CloudJobCreateCompanionBuilder,
      $CloudJobUpdateCompanionBuilder,
      (CloudJobData, BaseReferences<_$AppDatabase, CloudJob, CloudJobData>),
      CloudJobData,
      PrefetchHooks Function()
    >;
typedef $TelemetryOutboxCreateCompanionBuilder = TelemetryOutboxCompanion Function({
  Value<int> seq,
  required String name,
  required String props,
  required int occurredAt,
});
typedef $TelemetryOutboxUpdateCompanionBuilder = TelemetryOutboxCompanion Function({
  Value<int> seq,
  Value<String> name,
  Value<String> props,
  Value<int> occurredAt,
});

class $TelemetryOutboxFilterComposer extends Composer<_$AppDatabase, TelemetryOutbox> {
  $TelemetryOutboxFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get seq => $composableBuilder(column: $table.seq, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get props =>
      $composableBuilder(column: $table.props, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get occurredAt =>
      $composableBuilder(column: $table.occurredAt, builder: (column) => ColumnFilters(column));
}

class $TelemetryOutboxOrderingComposer extends Composer<_$AppDatabase, TelemetryOutbox> {
  $TelemetryOutboxOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get seq => $composableBuilder(column: $table.seq, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get props =>
      $composableBuilder(column: $table.props, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get occurredAt =>
      $composableBuilder(column: $table.occurredAt, builder: (column) => ColumnOrderings(column));
}

class $TelemetryOutboxAnnotationComposer extends Composer<_$AppDatabase, TelemetryOutbox> {
  $TelemetryOutboxAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get seq => $composableBuilder(column: $table.seq, builder: (column) => column);

  GeneratedColumn<String> get name => $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get props => $composableBuilder(column: $table.props, builder: (column) => column);

  GeneratedColumn<int> get occurredAt => $composableBuilder(column: $table.occurredAt, builder: (column) => column);
}

class $TelemetryOutboxTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          TelemetryOutbox,
          TelemetryOutboxData,
          $TelemetryOutboxFilterComposer,
          $TelemetryOutboxOrderingComposer,
          $TelemetryOutboxAnnotationComposer,
          $TelemetryOutboxCreateCompanionBuilder,
          $TelemetryOutboxUpdateCompanionBuilder,
          (TelemetryOutboxData, BaseReferences<_$AppDatabase, TelemetryOutbox, TelemetryOutboxData>),
          TelemetryOutboxData,
          PrefetchHooks Function()
        > {
  $TelemetryOutboxTableManager(_$AppDatabase db, TelemetryOutbox table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $TelemetryOutboxFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $TelemetryOutboxOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $TelemetryOutboxAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> seq = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> props = const Value.absent(),
            Value<int> occurredAt = const Value.absent(),
          }) => TelemetryOutboxCompanion(seq: seq, name: name, props: props, occurredAt: occurredAt),
          createCompanionCallback: ({
            Value<int> seq = const Value.absent(),
            required String name,
            required String props,
            required int occurredAt,
          }) => TelemetryOutboxCompanion.insert(seq: seq, name: name, props: props, occurredAt: occurredAt),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<TelemetryOutbox, TelemetryOutboxData>(table),
                  BaseReferences<_$AppDatabase, TelemetryOutbox, TelemetryOutboxData>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TelemetryOutboxProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      TelemetryOutbox,
      TelemetryOutboxData,
      $TelemetryOutboxFilterComposer,
      $TelemetryOutboxOrderingComposer,
      $TelemetryOutboxAnnotationComposer,
      $TelemetryOutboxCreateCompanionBuilder,
      $TelemetryOutboxUpdateCompanionBuilder,
      (TelemetryOutboxData, BaseReferences<_$AppDatabase, TelemetryOutbox, TelemetryOutboxData>),
      TelemetryOutboxData,
      PrefetchHooks Function()
    >;
typedef $SettingCreateCompanionBuilder = SettingCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $SettingUpdateCompanionBuilder = SettingCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $SettingFilterComposer extends Composer<_$AppDatabase, Setting> {
  $SettingFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => ColumnFilters(column));
}

class $SettingOrderingComposer extends Composer<_$AppDatabase, Setting> {
  $SettingOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $SettingAnnotationComposer extends Composer<_$AppDatabase, Setting> {
  $SettingAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key => $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value => $composableBuilder(column: $table.value, builder: (column) => column);
}

class $SettingTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Setting,
          SettingData,
          $SettingFilterComposer,
          $SettingOrderingComposer,
          $SettingAnnotationComposer,
          $SettingCreateCompanionBuilder,
          $SettingUpdateCompanionBuilder,
          (SettingData, BaseReferences<_$AppDatabase, Setting, SettingData>),
          SettingData,
          PrefetchHooks Function()
        > {
  $SettingTableManager(_$AppDatabase db, Setting table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $SettingFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $SettingOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $SettingAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => SettingCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) => SettingCompanion.insert(key: key, value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<Setting, SettingData>(table),
                  BaseReferences<_$AppDatabase, Setting, SettingData>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $SettingProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Setting,
      SettingData,
      $SettingFilterComposer,
      $SettingOrderingComposer,
      $SettingAnnotationComposer,
      $SettingCreateCompanionBuilder,
      $SettingUpdateCompanionBuilder,
      (SettingData, BaseReferences<_$AppDatabase, Setting, SettingData>),
      SettingData,
      PrefetchHooks Function()
    >;
typedef $FlagCreateCompanionBuilder = FlagCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $FlagUpdateCompanionBuilder = FlagCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $FlagFilterComposer extends Composer<_$AppDatabase, Flag> {
  $FlagFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => ColumnFilters(column));
}

class $FlagOrderingComposer extends Composer<_$AppDatabase, Flag> {
  $FlagOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $FlagAnnotationComposer extends Composer<_$AppDatabase, Flag> {
  $FlagAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key => $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value => $composableBuilder(column: $table.value, builder: (column) => column);
}

class $FlagTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Flag,
          FlagData,
          $FlagFilterComposer,
          $FlagOrderingComposer,
          $FlagAnnotationComposer,
          $FlagCreateCompanionBuilder,
          $FlagUpdateCompanionBuilder,
          (FlagData, BaseReferences<_$AppDatabase, Flag, FlagData>),
          FlagData,
          PrefetchHooks Function()
        > {
  $FlagTableManager(_$AppDatabase db, Flag table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $FlagFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $FlagOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $FlagAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => FlagCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) => FlagCompanion.insert(key: key, value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable<Flag, FlagData>(table), BaseReferences<_$AppDatabase, Flag, FlagData>(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $FlagProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Flag,
      FlagData,
      $FlagFilterComposer,
      $FlagOrderingComposer,
      $FlagAnnotationComposer,
      $FlagCreateCompanionBuilder,
      $FlagUpdateCompanionBuilder,
      (FlagData, BaseReferences<_$AppDatabase, Flag, FlagData>),
      FlagData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $SessionTableManager get session => $SessionTableManager(_db, _db.session);
  $CaptureGapTableManager get captureGap => $CaptureGapTableManager(_db, _db.captureGap);
  $PersonTableManager get person => $PersonTableManager(_db, _db.person);
  $SpeakerTableManager get speaker => $SpeakerTableManager(_db, _db.speaker);
  $ConsentRecordTableManager get consentRecord => $ConsentRecordTableManager(_db, _db.consentRecord);
  $VoiceSignatureTableManager get voiceSignature => $VoiceSignatureTableManager(_db, _db.voiceSignature);
  $MomentTableManager get moment => $MomentTableManager(_db, _db.moment);
  $UtteranceTableManager get utterance => $UtteranceTableManager(_db, _db.utterance);
  $UtteranceFtsTableManager get utteranceFts => $UtteranceFtsTableManager(_db, _db.utteranceFts);
  $ItemTableManager get item => $ItemTableManager(_db, _db.item);
  $ItemSourceTableManager get itemSource => $ItemSourceTableManager(_db, _db.itemSource);
  $MediaTableManager get media => $MediaTableManager(_db, _db.media);
  $MarkTableManager get mark => $MarkTableManager(_db, _db.mark);
  $RecapTableManager get recap => $RecapTableManager(_db, _db.recap);
  $RecapEntryTableManager get recapEntry => $RecapEntryTableManager(_db, _db.recapEntry);
  $FeedbackTableManager get feedback => $FeedbackTableManager(_db, _db.feedback);
  $PauseZoneTableManager get pauseZone => $PauseZoneTableManager(_db, _db.pauseZone);
  $CloudJobTableManager get cloudJob => $CloudJobTableManager(_db, _db.cloudJob);
  $TelemetryOutboxTableManager get telemetryOutbox => $TelemetryOutboxTableManager(_db, _db.telemetryOutbox);
  $SettingTableManager get setting => $SettingTableManager(_db, _db.setting);
  $FlagTableManager get flag => $FlagTableManager(_db, _db.flag);
}
