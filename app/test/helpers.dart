import 'package:drift/native.dart';
import 'package:mona/data/connection/native.dart';
import 'package:mona/data/database.dart';

/// An in-memory SQLCipher database with the full schema.
AppDatabase openTestDb() => AppDatabase(NativeDatabase.memory(setup: (db) => applyCipher(db, 'test-key')));
