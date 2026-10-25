import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/connection/native.dart';
import 'package:mona/data/database.dart';
import 'package:sqlite3/sqlite3.dart';

import '../helpers.dart';

Future<void> insertSession(AppDatabase db, {String id = 's1', String scene = 'day', int? consentShownAt}) {
  return db.customStatement(
    'INSERT INTO session (id, run_id, scene, start_trigger, started_at, tz, status, consent_shown_at) '
    "VALUES (?, 'r1', ?, 'in_app', 0, 'Asia/Taipei', 'recording', ?)",
    [id, scene, consentShownAt],
  );
}

void main() {
  late AppDatabase db;
  setUp(() => db = openTestDb());
  tearDown(() => db.close());

  test('the linked SQLite is SQLCipher with a recent enough SQLite', () async {
    final cipher = await db.customSelect('PRAGMA cipher_version').getSingle();
    expect(cipher.data.values.first, isNotNull);
    final version = await db.customSelect('SELECT sqlite_version() AS v').getSingle();
    final parts = (version.data['v'] as String).split('.').map(int.parse).toList();
    // FTS5 secure-delete needs 3.44+ (§10.1).
    expect(parts[0] * 100 + parts[1], greaterThanOrEqualTo(344));
  });

  test('applyCipher refuses plain SQLite', () {
    final plain = sqlite3.openInMemory();
    // The test process links SQLCipher, so simulate a plain build with a stub.
    expect(() => applyCipher(_PlainSqlite(plain), 'k'), throwsStateError);
    plain.close();
  });

  test('schema v1 creates every table from spec §10.2', () async {
    final rows = await db
        .customSelect("SELECT name FROM sqlite_master WHERE type IN ('table','view') ORDER BY name")
        .get();
    final names = rows.map((r) => r.read<String>('name')).toSet();
    expect(
      names,
      containsAll([
        'session',
        'capture_gap',
        'person',
        'speaker',
        'consent_record',
        'voice_signature',
        'moment',
        'utterance',
        'utterance_fts',
        'item',
        'item_view',
        'item_source',
        'media',
        'mark',
        'recap',
        'recap_entry',
        'feedback',
        'pause_zone',
        'cloud_job',
        'telemetry_outbox',
        'setting',
        'flag',
      ]),
    );
  });

  test('I10: a meeting cannot be stored without the consent card', () async {
    await expectLater(insertSession(db, scene: 'meeting'), throwsA(isA<SqliteException>()));
    await insertSession(db, scene: 'meeting', consentShownAt: 1);
    await insertSession(db, id: 's2', scene: 'day');
  });

  test('I6: a voice signature needs a granted consent record, and withdrawal deletes it', () async {
    Future<void> insertSignature(String consentId) => db.customStatement(
      'INSERT INTO voice_signature (id, is_self, model_id, embedding, consent_record_id, created_at) '
      "VALUES (lower(hex(randomblob(8))), 1, 'emb-v1', x'00', ?, 0)",
      [consentId],
    );
    await db.customStatement('PRAGMA foreign_keys = OFF');
    await expectLater(insertSignature('missing'), throwsA(isA<SqliteException>()));
    await db.customStatement('PRAGMA foreign_keys = ON');

    await db.customStatement(
      "INSERT INTO consent_record (id, kind, text_version, granted_at) VALUES ('c1', 'self_voice', 'v1', 0)",
    );
    await insertSignature('c1');
    await db.customStatement("UPDATE consent_record SET withdrawn_at = 1 WHERE id = 'c1'");
    final left = await db.customSelect('SELECT count(*) AS n FROM voice_signature').getSingle();
    expect(left.read<int>('n'), 0);
    await expectLater(insertSignature('c1'), throwsA(isA<SqliteException>()));
  });

  test('I9: a model item goes when its last source goes; a user item stays', () async {
    await insertSession(db);
    await db.batch((b) {
      b.customStatement("INSERT INTO moment (id, session_id, start_ms, tz) VALUES ('m1', 's1', 0, 'Asia/Taipei')");
      for (final u in ['u1', 'u2']) {
        b.customStatement(
          'INSERT INTO utterance (id, session_id, moment_id, start_ms, end_ms, text) '
          "VALUES (?, 's1', 'm1', 0, 1000, 'line')",
          [u],
        );
      }
      for (final (id, origin) in [('i1', 'model'), ('i2', 'user')]) {
        b.customStatement(
          'INSERT INTO item (id, moment_id, type, text, confidence, origin, created_at, updated_at) '
          "VALUES (?, 'm1', 'promise', 'Send the draft', 0.9, ?, 0, 0)",
          [id, origin],
        );
      }
      b.customStatement("INSERT INTO item_source VALUES ('i1', 'u1'), ('i1', 'u2'), ('i2', 'u2')");
    });
    await db.customStatement("DELETE FROM utterance WHERE id = 'u1'");
    expect(await _ids(db, 'item'), ['i1', 'i2']);
    await db.customStatement("DELETE FROM utterance WHERE id = 'u2'");
    expect(await _ids(db, 'item'), ['i2']);
  });

  test('FTS trigram index follows inserts and deletes, including Chinese text', () async {
    await insertSession(db);
    await db.customStatement(
      'INSERT INTO utterance (id, session_id, start_ms, end_ms, text) '
      "VALUES ('u1', 's1', 0, 1, '好，那我們禮拜五前定案')",
    );
    Future<int> hits(String q) async =>
        (await db
                .customSelect(
                  'SELECT count(*) AS n FROM utterance_fts WHERE utterance_fts MATCH ?',
                  variables: [Variable(q)],
                )
                .getSingle())
            .read<int>('n');
    expect(await hits('禮拜五'), 1);
    await db.customStatement("DELETE FROM utterance WHERE id = 'u1'");
    expect(await hits('禮拜五'), 0);
  });
}

Future<List<String>> _ids(AppDatabase db, String table) async =>
    (await db.customSelect('SELECT id FROM $table ORDER BY id').get()).map((r) => r.read<String>('id')).toList();

/// A database whose `PRAGMA cipher_version` returns nothing, as plain SQLite does.
class _PlainSqlite implements Database {
  _PlainSqlite(this._inner);
  final Database _inner;

  @override
  ResultSet select(String sql, [List<Object?> parameters = const []]) =>
      sql.contains('cipher_version') ? ResultSet([], null, []) : _inner.select(sql, parameters);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
