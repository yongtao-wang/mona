import 'dart:convert';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Holds the 256-bit database key (spec §10.1).
abstract interface class DbKeyStore {
  /// The stored key, or a new random one stored for next time.
  Future<String> readOrCreate();
}

/// For tests and the web dev preview (D26): the key lives only as long as the process.
class InMemoryKeyStore implements DbKeyStore {
  String? _key;

  @override
  Future<String> readOrCreate() async => _key ??= newKey();

  static String newKey() {
    final rnd = Random.secure();
    return base64Url.encode(List<int>.generate(32, (_) => rnd.nextInt(256)));
  }
}

/// Where a [KeychainKeyStore] keeps its value; the default is the platform keystore.
abstract interface class SecretStorage {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
}

/// The iOS Keychain (Android Keystore on Android). On iOS the item is readable after
/// the first unlock, so capture can write while the phone is locked, and never syncs to
/// another device (`kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly`, spec §10.1).
class KeychainKeyStore implements DbKeyStore {
  KeychainKeyStore([SecretStorage? storage]) : _storage = storage ?? _PlatformStorage();

  static const itemName = 'mona.db_key.v1';

  final SecretStorage _storage;

  @override
  Future<String> readOrCreate() async {
    final existing = await _storage.read(itemName);
    if (existing != null && existing.isNotEmpty) return existing;
    final key = InMemoryKeyStore.newKey();
    await _storage.write(itemName, key);
    return key;
  }
}

class _PlatformStorage implements SecretStorage {
  static const _storage = FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device, synchronizable: false),
  );

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) => _storage.write(key: key, value: value);
}
