import 'package:drift/drift.dart';

part 'database.g.dart';

/// The local database (spec §10). Dart is its only writer; the native engines
/// write to their journal instead (§6.8).
@DriftDatabase(include: {'schema.drift'})
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      // §10.1: overwrite deleted index content too (needs SQLite 3.44+).
      await customStatement("INSERT INTO utterance_fts(utterance_fts, rank) VALUES ('secure-delete', 1)");
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      await customStatement('PRAGMA secure_delete = ON');
    },
  );

  /// After a user-initiated deletion, so deleted rows do not linger in the WAL (§10.1).
  Future<void> checkpoint() => customStatement('PRAGMA wal_checkpoint(TRUNCATE)');
}
