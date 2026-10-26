import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/database.dart';
import 'package:mona/domain/placeholders.dart';

import '../helpers.dart';

void main() {
  test('placeholders render current names, the user, unnamed speakers and merges', () async {
    final db = openTestDb();
    addTearDown(db.close);
    await db.customStatement(
      'INSERT INTO session (id, run_id, scene, start_trigger, started_at, tz, status) '
      "VALUES ('s', 'r', 'day', 'in_app', 0, 'Asia/Taipei', 'closed')",
    );
    await db.into(db.person).insert(PersonCompanion.insert(id: 'p1', displayName: 'Alex Chen', createdAt: 0));
    for (final (id, label, self, person, merged) in [
      ('me', 'You', 1, null, null),
      ('b', 'B', 0, 'p1', null),
      ('c', 'C', 0, null, null),
      ('d', 'D', 0, null, 'c'),
    ]) {
      await db
          .into(db.speaker)
          .insert(
            SpeakerCompanion.insert(
              id: id,
              sessionId: 's',
              label: label,
              isSelf: Value(self),
              personId: Value(person),
              mergedInto: Value(merged),
              colorIndex: 0,
            ),
          );
    }
    final r = await PlaceholderRenderer.load(db);
    String render(String t) => r.render(t, you: 'You', speaker: (l) => 'Speaker $l');
    expect(render('{{spk:me}} sends {{spk:b}} the draft'), 'You sends Alex Chen the draft');
    expect(
      render('{{spk:c}} and {{spk:d}} agree; {{per:p1}} decides'),
      'Speaker C and Speaker C agree; Alex Chen decides',
    );
    expect(render('{{spk:gone}}'), '?');
  });
}
