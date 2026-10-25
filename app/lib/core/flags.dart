import 'package:drift/drift.dart';

import '../data/database.dart';
import 'flavor.dart';

/// Feature flags (spec §5.2): stored in the `flag` table, seeded per flavor, overridable
/// from the debug screen. Only kill switches come from `/v1/config`.
class Flags {
  Flags(this._db, this._flavor);

  final AppDatabase _db;
  final Flavor _flavor;

  /// Known flags and their default per flavor.
  static const Map<String, Map<Flavor, String>> defaults = {
    // Dev preview: seed the Mia day from the user-value doc so screens have content.
    'dev.sample_day': {Flavor.dev: 'true', Flavor.alpha: 'false', Flavor.beta: 'false'},
    // Simulates Live Activities turned off (capture cannot start, §6.6).
    'dev.live_activities_off': {Flavor.dev: 'false', Flavor.alpha: 'false', Flavor.beta: 'false'},
    // Calibrated thresholds (§7.6, §9.4); placeholders until S2 and S4 set them.
    'tau_uncertain': {Flavor.dev: '0.6', Flavor.alpha: '0.6', Flavor.beta: '0.6'},
    'tau_nudge': {Flavor.dev: '0.8', Flavor.alpha: '0.8', Flavor.beta: '0.8'},
  };

  /// Inserts defaults for flags that have no row yet; never overwrites an override.
  Future<void> seed() async {
    await _db.batch((b) {
      b.insertAll(_db.flag, [
        for (final e in defaults.entries) FlagCompanion.insert(key: e.key, value: e.value[_flavor]!),
      ], mode: InsertMode.insertOrIgnore);
    });
  }

  Future<String?> _get(String key) async =>
      (await (_db.select(_db.flag)..where((f) => f.key.equals(key))).getSingleOrNull())?.value ??
      defaults[key]?[_flavor];

  Future<bool> boolFlag(String key) async => await _get(key) == 'true';

  Future<double> doubleFlag(String key) async => double.parse(await _get(key) ?? 'nan');

  Future<void> set(String key, String value) =>
      _db.into(_db.flag).insertOnConflictUpdate(FlagCompanion.insert(key: key, value: value));

  Stream<Map<String, String>> watchAll() =>
      _db.select(_db.flag).watch().map((rows) => {for (final r in rows) r.key: r.value});
}
