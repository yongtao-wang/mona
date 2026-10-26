import 'dart:convert';

import 'package:cloud_contracts/cloud_contracts.dart';
import 'package:drift/drift.dart';

import '../cloud/pseudonymizer.dart';
import '../data/database.dart';

/// What a label request is built from, read fresh at every attempt (spec §8.8: the
/// payload is rebuilt each time, never stored).
class MomentSnapshot {
  const MomentSnapshot({required this.moment, required this.people, required this.purpose, required this.lines});

  final MomentForLabel moment;
  final List<NamedPerson> people;
  final LabelPurpose purpose;

  /// Utterance rows by id, for confidence and the client citation re-check.
  final Map<String, UtteranceData> lines;
}

class MomentLoader {
  MomentLoader(this._db, {this.uncertainBelow = 0.6});

  final AppDatabase _db;

  /// `τ_uncertain`: lines whose speaker confidence is below it are sent with "?" (§7.6).
  final double uncertainBelow;

  Future<MomentSnapshot?> load(String momentId) async {
    final moment = await (_db.select(_db.moment)..where((m) => m.id.equals(momentId))).getSingleOrNull();
    if (moment == null) return null;
    final session = await (_db.select(_db.session)..where((s) => s.id.equals(moment.sessionId))).getSingle();
    final speakers = await (_db.select(_db.speaker)..where((s) => s.sessionId.equals(session.id))).get();
    final utterances =
        await (_db.select(_db.utterance)
              ..where((u) => u.momentId.equals(momentId))
              ..orderBy([(u) => OrderingTerm(expression: u.startMs)]))
            .get();
    final people = await _db.select(_db.person).get();

    // Local date and time of the moment's start. The phone's zone is used until a
    // time zone database is added; it matches `session.tz` unless the user travelled.
    final start = DateTime.fromMillisecondsSinceEpoch(session.startedAt + moment.startMs);
    String two(int n) => n.toString().padLeft(2, '0');
    final languages = {for (final u in utterances) ?u.lang}.toList();

    return MomentSnapshot(
      moment: MomentForLabel(
        id: moment.id,
        localDate: '${start.year}-${two(start.month)}-${two(start.day)}',
        localStart: '${two(start.hour)}:${two(start.minute)}',
        tz: moment.tz,
        durationS: ((moment.endMs ?? moment.startMs) - moment.startMs) ~/ 1000,
        languages: languages.isEmpty ? const ['en'] : languages,
        sceneHint: sceneHintValues.map[moment.sceneHint],
        speakers: [
          // A merged speaker's lines already point at the survivor (§8.7).
          for (final s in speakers)
            if (s.mergedInto == null) MomentSpeaker(id: s.id, isSelf: s.isSelf == 1, personId: s.personId),
        ],
        lines: [
          for (final u in utterances)
            MomentLine(
              id: u.id,
              speakerId: u.speakerId,
              startMs: u.startMs - moment.startMs,
              text: u.text$,
              uncertain: (u.speakerConfidence ?? 1) < uncertainBelow,
            ),
        ],
      ),
      people: [
        for (final p in people)
          NamedPerson(
            id: p.id,
            displayName: p.displayName,
            aliases: p.aliases == null ? const [] : (jsonDecode(p.aliases!) as List).cast<String>(),
            isSelf: p.isSelf == 1,
          ),
      ],
      purpose: session.scene == 'meeting' ? LabelPurpose.MINUTES : LabelPurpose.LABEL,
      lines: {for (final u in utterances) u.id: u},
    );
  }
}
