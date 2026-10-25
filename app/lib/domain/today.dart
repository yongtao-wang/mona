import 'package:clock/clock.dart';
import 'package:drift/drift.dart';

import '../data/database.dart';

/// One tile on the Today grid (ui-design §4, Moment tile).
class MomentTile {
  const MomentTile({
    required this.id,
    required this.scene,
    required this.startAt,
    required this.duration,
    required this.quote,
    required this.analyzed,
    required this.itemCount,
    required this.marked,
  });

  final String id;

  /// Cloud label if analyzed, else the on-device hint; null when neither is known.
  final String? scene;
  final DateTime startAt;
  final Duration duration;

  /// Title, or the first line; null for a moment that was never analyzed and has no line.
  final String? quote;
  final bool analyzed;
  final int itemCount;
  final bool marked;
}

class TodaySummary {
  const TodaySummary(this.tiles, {required this.promises});

  final List<MomentTile> tiles;
  final int promises;

  Duration get talkTime => tiles.fold(Duration.zero, (a, t) => a + t.duration);
}

/// Today's moments, newest first, as a live query.
class TodayQuery {
  TodayQuery(this._db, this._clock);

  final AppDatabase _db;
  final Clock _clock;

  Stream<TodaySummary> watch() {
    final now = _clock.now();
    final from = DateTime(now.year, now.month, now.day);
    final to = from.add(const Duration(days: 1));
    return _db
        .customSelect(
          '''
SELECT m.id, COALESCE(m.scene_label, m.scene_hint) AS scene, m.analysis_status,
  s.started_at + m.start_ms AS start_at,
  COALESCE(m.end_ms, m.start_ms) - m.start_ms AS dur_ms,
  COALESCE(m.title, (SELECT u.text FROM utterance u WHERE u.moment_id = m.id ORDER BY u.start_ms LIMIT 1)) AS quote,
  (SELECT count(*) FROM item i WHERE i.moment_id = m.id AND i.status <> 'wrong') AS items,
  (SELECT count(*) FROM item i WHERE i.moment_id = m.id AND i.status <> 'wrong' AND i.type = 'promise') AS promises,
  EXISTS (SELECT 1 FROM mark k WHERE k.session_id = m.session_id
          AND k.at_ms >= m.start_ms AND k.at_ms <= COALESCE(m.end_ms, k.at_ms)) AS marked
FROM moment m JOIN session s ON s.id = m.session_id
WHERE s.started_at + m.start_ms >= ? AND s.started_at + m.start_ms < ?
ORDER BY start_at DESC
''',
          variables: [Variable(from.millisecondsSinceEpoch), Variable(to.millisecondsSinceEpoch)],
          readsFrom: {_db.moment, _db.session, _db.utterance, _db.item, _db.mark},
        )
        .watch()
        .map((rows) {
          var promises = 0;
          final tiles = [
            for (final r in rows)
              MomentTile(
                id: r.read<String>('id'),
                scene: r.readNullable<String>('scene'),
                startAt: DateTime.fromMillisecondsSinceEpoch(r.read<int>('start_at')),
                duration: Duration(milliseconds: r.read<int>('dur_ms')),
                quote: r.readNullable<String>('quote'),
                analyzed: r.read<String>('analysis_status') == 'done',
                itemCount: r.read<int>('items'),
                marked: r.read<bool>('marked'),
              ),
          ];
          for (final r in rows) {
            promises += r.read<int>('promises');
          }
          return TodaySummary(tiles, promises: promises);
        });
  }
}
