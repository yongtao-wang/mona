import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

import '../key_store.dart';

/// SQLCipher database under Application Support/db (spec §10.1, §10.4).
QueryExecutor openConnection({required DbKeyStore keys}) {
  return LazyDatabase(() async {
    final support = await getApplicationSupportDirectory();
    final dir = Directory('${support.path}/db');
    await dir.create(recursive: true);
    final key = await keys.readOrCreate();
    return NativeDatabase.createInBackground(File('${dir.path}/mona.sqlite'), setup: (db) => applyCipher(db, key));
  });
}

/// Fails closed if the linked SQLite is not SQLCipher, then keys the database.
void applyCipher(Database db, String key) {
  final version = db.select('PRAGMA cipher_version');
  if (version.isEmpty || version.first.values.first == null) {
    throw StateError('SQLCipher is not linked; refusing to open the database');
  }
  db.execute("PRAGMA key = '${key.replaceAll("'", "''")}'");
  db.execute('PRAGMA journal_mode = WAL');
}
