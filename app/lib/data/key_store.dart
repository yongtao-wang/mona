import 'dart:convert';
import 'dart:math';

/// Holds the 256-bit database key (spec §10.1). On iOS this is a Keychain item with
/// `kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly`; that implementation comes with
/// the native work. The in-memory store is for tests and the dev web preview.
abstract interface class DbKeyStore {
  /// The stored key, or a new random one stored for next time.
  Future<String> readOrCreate();
}

class InMemoryKeyStore implements DbKeyStore {
  String? _key;

  @override
  Future<String> readOrCreate() async => _key ??= newKey();

  static String newKey() {
    final rnd = Random.secure();
    return base64Url.encode(List<int>.generate(32, (_) => rnd.nextInt(256)));
  }
}
