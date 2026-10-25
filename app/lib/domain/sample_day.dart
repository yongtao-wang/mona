import 'package:clock/clock.dart';
import 'package:drift/drift.dart';

import '../core/ids.dart';
import '../data/database.dart';

/// Mia's day from the user-value doc, as on the Today design (docs/design/canvas
/// Main.dc.html). Dev flavor only (flag `dev.sample_day`); never in alpha or beta.
class SampleDay {
  SampleDay(this._db, this._clock);

  final AppDatabase _db;
  final Clock _clock;

  static const _moments = [
    // (local start, minutes, scene, title or null, analyzed, items, marked)
    ('08:40', 20, 'commute', null, false, <(String, String)>[], false),
    ('09:05', 6, 'social', '咖啡店閒聊', true, <(String, String)>[], false),
    ('09:40', 1, 'solo', '「記得打給銀行」', true, [('promise', '打給銀行')], false),
    (
      '10:00',
      24,
      'meeting',
      'API 先照 v2 走',
      true,
      [('decision', 'API 先照 v2 走'), ('promise', '週四前寄出 spec 草稿'), ('question', '週五前能不能定案？')],
      false,
    ),
    ('12:30', 52, 'social', '她換工作了，推薦《原子習慣》', true, [('fact', '她換工作了'), ('fact', '推薦《原子習慣》')], false),
    ('14:00', 38, 'call', '「週四前寄 spec 給你」', true, [('promise', '週四前寄 spec')], false),
    ('18:05', 12, 'commute', null, false, <(String, String)>[], false),
    ('20:41', 2, 'show', '[PLACEHOLDER 演出片段]', true, <(String, String)>[], true),
  ];

  /// Seeds today's sample moments unless today already has some.
  Future<void> seedIfEmpty() async {
    final now = _clock.now();
    final midnight = DateTime(now.year, now.month, now.day);
    final existing = await _db
        .customSelect(
          'SELECT count(*) AS n FROM moment m JOIN session s ON s.id = m.session_id '
          'WHERE s.started_at + m.start_ms >= ?',
          variables: [Variable(midnight.millisecondsSinceEpoch)],
        )
        .getSingle();
    if (existing.read<int>('n') > 0) return;

    final sessionStart = midnight.add(const Duration(hours: 8, minutes: 40));
    final sessionId = newId();
    final ts = sessionStart.millisecondsSinceEpoch;
    await _db.transaction(() async {
      await _db
          .into(_db.session)
          .insert(
            SessionCompanion.insert(
              id: sessionId,
              runId: newId(),
              scene: 'day',
              startTrigger: 'in_app',
              startedAt: ts,
              endedAt: Value(midnight.add(const Duration(hours: 21)).millisecondsSinceEpoch),
              endReason: const Value('user'),
              tz: 'Asia/Taipei',
              status: 'closed',
            ),
          );
      for (final (start, minutes, scene, title, analyzed, items, marked) in _moments) {
        final [h, m] = start.split(':').map(int.parse).toList();
        final startMs = midnight.add(Duration(hours: h, minutes: m)).millisecondsSinceEpoch - ts;
        final endMs = startMs + minutes * 60000;
        final momentId = newId();
        await _db
            .into(_db.moment)
            .insert(
              MomentCompanion.insert(
                id: momentId,
                sessionId: sessionId,
                state: const Value('closed'),
                startMs: startMs,
                endMs: Value(endMs),
                tz: 'Asia/Taipei',
                sceneHint: Value(scene == 'commute' ? 'commute' : null),
                sceneLabel: Value(analyzed ? scene : null),
                title: Value(title),
                flagged: Value(analyzed ? 1 : 0),
                excludedReason: Value(analyzed ? null : 'scene_excluded'),
                analysisStatus: Value(analyzed ? 'done' : 'skipped'),
              ),
            );
        for (final (type, text) in items) {
          final utteranceId = newId();
          await _db
              .into(_db.utterance)
              .insert(
                UtteranceCompanion.insert(
                  id: utteranceId,
                  sessionId: sessionId,
                  momentId: Value(momentId),
                  startMs: startMs,
                  endMs: startMs + 4000,
                  text$: text,
                ),
              );
          final itemId = newId();
          await _db
              .into(_db.item)
              .insert(
                ItemCompanion.insert(
                  id: itemId,
                  momentId: momentId,
                  type: type,
                  text$: text,
                  confidence: 0.9,
                  origin: 'model',
                  createdAt: ts,
                  updatedAt: ts,
                ),
              );
          await _db.into(_db.itemSource).insert(ItemSourceCompanion.insert(itemId: itemId, utteranceId: utteranceId));
        }
        if (marked) {
          await _db
              .into(_db.mark)
              .insert(MarkCompanion.insert(id: newId(), sessionId: sessionId, atMs: startMs + 1000, source: 'button'));
        }
      }
    });
  }
}
