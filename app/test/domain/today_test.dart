import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/domain/sample_day.dart';
import 'package:mona/domain/today.dart';

import '../helpers.dart';

void main() {
  test('the sample day fills Today like the design: 8 moments, 3 promises', () async {
    final db = openTestDb();
    addTearDown(db.close);
    final clock = Clock.fixed(DateTime(2026, 10, 27, 21, 30));
    await SampleDay(db, clock).seedIfEmpty();
    await SampleDay(db, clock).seedIfEmpty(); // idempotent

    final today = await TodayQuery(db, clock).watch().first;
    expect(today.tiles, hasLength(8));
    expect(today.promises, 3);
    expect(today.tiles.first.startAt, DateTime(2026, 10, 27, 20, 41)); // newest first
    expect(today.tiles.first.marked, isTrue);

    final meeting = today.tiles.firstWhere((t) => t.scene == 'meeting');
    expect((meeting.quote, meeting.itemCount, meeting.duration), ('API 先照 v2 走', 3, const Duration(minutes: 24)));

    final commute = today.tiles.last;
    expect((commute.scene, commute.analyzed, commute.quote), ('commute', false, null));
  });

  test('moments from yesterday are not on Today', () async {
    final db = openTestDb();
    addTearDown(db.close);
    await SampleDay(db, Clock.fixed(DateTime(2026, 10, 26, 12))).seedIfEmpty();
    final today = await TodayQuery(db, Clock.fixed(DateTime(2026, 10, 27, 9))).watch().first;
    expect(today.tiles, isEmpty);
  });
}
