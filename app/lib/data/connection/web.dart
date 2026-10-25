import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

import '../key_store.dart';

/// Web is a dev preview only (D26): the database is not encrypted and holds sample data.
QueryExecutor openConnection({required DbKeyStore keys}) {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: 'mona_preview',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );
    return result.resolvedExecutor;
  });
}
