import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// Ids are UUIDv7 strings (spec §10.2).
String newId() => _uuid.v7();
