import 'package:cloud_contracts/cloud_contracts.dart';

import '../core/ids.dart';
import '../core/result.dart';
import '../data/database.dart';
import 'gateway_client.dart';

/// Registers this install with the gateway (spec §12.4): after sign-in and when the app
/// version changes. The install id is random per install; on iOS it moves to the
/// Keychain with the native work (§11.3), here it lives in the `setting` table.
class DeviceRegistrar {
  DeviceRegistrar(this._db, {required this.platform, required this.appVersion, required this.osVersion, this.model});

  final AppDatabase _db;
  final Platform platform;
  final String appVersion;
  final String osVersion;
  final String? model;

  static const installIdKey = 'install_id';
  static const deviceIdKey = 'device_id';
  static const registeredVersionKey = 'device_registered_version';

  Future<String?> deviceId() => _get(deviceIdKey);

  Future<bool> needsRegistration() async =>
      await _get(deviceIdKey) == null || await _get(registeredVersionKey) != appVersion;

  Future<String?> register(GatewayClient client) async {
    final request = DeviceRequest(
      schemaVersion: 1,
      installId: await _installId(),
      platform: platform,
      appVersion: appVersion,
      osVersion: osVersion,
      model: model,
    );
    final res = await client.post('/v1/device', request.toJson());
    if (res case Ok(:final value)) {
      final id = DeviceResponse.fromJson(value).deviceId;
      await _set(deviceIdKey, id);
      await _set(registeredVersionKey, appVersion);
      return id;
    }
    return null;
  }

  Future<String> _installId() async {
    final existing = await _get(installIdKey);
    if (existing != null) return existing;
    final id = newId();
    await _set(installIdKey, id);
    return id;
  }

  Future<String?> _get(String key) async =>
      (await (_db.select(_db.setting)..where((s) => s.key.equals(key))).getSingleOrNull())?.value;

  Future<void> _set(String key, String value) =>
      _db.into(_db.setting).insertOnConflictUpdate(SettingCompanion.insert(key: key, value: value));
}
