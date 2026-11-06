import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/key_store.dart';

class MapStorage implements SecretStorage {
  final values = <String, String>{};
  int writes = 0;

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async {
    writes++;
    values[key] = value;
  }
}

void main() {
  test('the database key is created once and the same key comes back on the next launch', () async {
    final storage = MapStorage();
    final first = await KeychainKeyStore(storage).readOrCreate();
    final second = await KeychainKeyStore(storage).readOrCreate();
    expect(second, first);
    expect(storage.writes, 1);
    expect(first.length, 44); // 32 random bytes, base64url
  });

  test('two installs get different keys', () async {
    final a = await KeychainKeyStore(MapStorage()).readOrCreate();
    final b = await KeychainKeyStore(MapStorage()).readOrCreate();
    expect(a, isNot(b));
  });
}
