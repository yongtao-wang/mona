import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:cloud_contracts/cloud_contracts.dart';

import '../core/result.dart';
import '../data/database.dart';
import 'gateway_client.dart';

/// Remote config (spec §12.5), fetched at launch and every 6 hours and cached in the
/// `setting` table. Offline, the last copy (or the defaults) applies.
class ConfigRepository {
  ConfigRepository(this._db, this._clock);

  final AppDatabase _db;
  final Clock _clock;

  static const refreshEvery = Duration(hours: 6);
  static const _key = 'cloud_config';
  static const _fetchedKey = 'cloud_config_fetched_at';

  static final defaults = ConfigResponse(
    minAppVersion: '0.0.0',
    analysisEnabled: true,
    recapEnabled: true,
    promptVersions: PromptVersions(label: 'none', recap: 'none'),
    maxBodyKb: 256,
  );

  Future<ConfigResponse> current() async {
    final raw = await _get(_key);
    return raw == null ? defaults : ConfigResponse.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  /// Fetches when the cached copy is older than [refreshEvery]. Returns the config in force.
  Future<ConfigResponse> refreshIfStale(GatewayClient client) async {
    final fetched = int.tryParse(await _get(_fetchedKey) ?? '');
    final now = _clock.now();
    if (fetched != null && now.difference(DateTime.fromMillisecondsSinceEpoch(fetched)) < refreshEvery) {
      return current();
    }
    final res = await client.get('/v1/config');
    if (res case Ok(:final value)) {
      final config = ConfigResponse.fromJson(value);
      await _set(_key, jsonEncode(config.toJson()));
      await _set(_fetchedKey, '${now.millisecondsSinceEpoch}');
      return config;
    }
    return current();
  }

  Future<String?> _get(String key) async =>
      (await (_db.select(_db.setting)..where((s) => s.key.equals(key))).getSingleOrNull())?.value;

  Future<void> _set(String key, String value) =>
      _db.into(_db.setting).insertOnConflictUpdate(SettingCompanion.insert(key: key, value: value));
}
