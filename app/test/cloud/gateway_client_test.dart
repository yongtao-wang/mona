import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:cloud_contracts/cloud_contracts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mona/cloud/config_repository.dart';
import 'package:mona/cloud/device_registrar.dart';
import 'package:mona/cloud/gateway_client.dart';
import 'package:mona/core/result.dart';

import '../helpers.dart';

class FakeTokens implements TokenSource {
  String token = 'stale';
  int refreshes = 0;

  @override
  Future<String?> accessToken() async => token;

  @override
  Future<bool> refresh() async {
    refreshes++;
    token = 'fresh';
    return true;
  }
}

http.Response error(int status, String code, {bool retryable = false, Map<String, String> headers = const {}}) =>
    http.Response(
      jsonEncode({
        'error': {'code': code, 'retryable': retryable, 'request_id': 'r1'},
      }),
      status,
      headers: {'content-type': 'application/json', ...headers},
    );

const configJson = {
  'min_app_version': '0.1.0',
  'analysis_enabled': false,
  'recap_enabled': true,
  'prompt_versions': {'label': 'label-v0', 'recap': 'recap-v0'},
  'max_body_kb': 256,
};

void main() {
  final base = Uri.parse('https://x.supabase.co/functions/v1/gateway');

  GatewayClient client(
    MockClient mock,
    FakeTokens tokens, {
    String? device = 'd1',
    Future<String?> Function()? register,
  }) => GatewayClient(
    base: base,
    httpClient: mock,
    tokens: tokens,
    appVersion: '0.1.0',
    deviceId: () async => device,
    registerDevice: register ?? () async => null,
  );

  test('sends version, token and device headers to the route under the function', () async {
    late http.Request seen;
    final mock = MockClient((req) async {
      seen = req;
      return http.Response(jsonEncode(configJson), 200);
    });
    final res = await client(mock, FakeTokens()).get('/v1/config');
    expect(res, isA<Ok<Map<String, dynamic>, GatewayFailure>>());
    expect(seen.url.path, '/functions/v1/gateway/v1/config');
    expect(seen.headers['x-app-version'], '0.1.0');
    expect(seen.headers['authorization'], 'Bearer stale');
    expect(seen.headers['x-device-id'], 'd1');
  });

  test('401 refreshes the token and retries once', () async {
    final tokens = FakeTokens();
    final mock = MockClient(
      (req) async => req.headers['authorization'] == 'Bearer fresh'
          ? http.Response(jsonEncode(configJson), 200)
          : error(401, 'unauthorized', retryable: true),
    );
    expect(await client(mock, tokens).get('/v1/config'), isA<Ok<Map<String, dynamic>, GatewayFailure>>());
    expect(tokens.refreshes, 1);
  });

  test('401 after a refresh is returned, not retried forever', () async {
    final tokens = FakeTokens();
    var calls = 0;
    final mock = MockClient((_) async {
      calls++;
      return error(401, 'unauthorized', retryable: true);
    });
    final res = await client(mock, tokens).get('/v1/config');
    expect((res as Err<Map<String, dynamic>, GatewayFailure>).error.code, 'unauthorized');
    expect(calls, 2);
  });

  test('403 device_unknown registers the device and retries once', () async {
    var device = 'old';
    var registrations = 0;
    final mock = MockClient(
      (req) async => req.headers['x-device-id'] == 'new'
          ? http.Response(jsonEncode(configJson), 200)
          : error(403, 'device_unknown'),
    );
    final c = GatewayClient(
      base: base,
      httpClient: mock,
      tokens: FakeTokens(),
      appVersion: '0.1.0',
      deviceId: () async => device,
      registerDevice: () async {
        registrations++;
        return device = 'new';
      },
    );
    expect(await c.get('/v1/config'), isA<Ok<Map<String, dynamic>, GatewayFailure>>());
    expect(registrations, 1);
  });

  test('429 carries Retry-After; network errors are retryable', () async {
    final limited = MockClient(
      (_) async => error(429, 'rate_limited', retryable: true, headers: {'retry-after': '17'}),
    );
    final res = await client(limited, FakeTokens()).get('/v1/config');
    final failure = (res as Err<Map<String, dynamic>, GatewayFailure>).error;
    expect((failure.code, failure.retryAfter), ('rate_limited', const Duration(seconds: 17)));

    final down = MockClient((_) async => throw const SocketLikeException());
    final net = await client(down, FakeTokens()).get('/v1/config');
    expect((net as Err<Map<String, dynamic>, GatewayFailure>).error.code, 'network');
  });

  test('device registration is stored and reused until the app version changes', () async {
    final db = openTestDb();
    addTearDown(db.close);
    final bodies = <Map<String, dynamic>>[];
    final mock = MockClient((req) async {
      bodies.add(jsonDecode(req.body) as Map<String, dynamic>);
      return http.Response(jsonEncode({'device_id': '00000000-0000-4000-8000-000000000001'}), 200);
    });
    final registrar = DeviceRegistrar(db, platform: Platform.WEB, appVersion: '0.1.0', osVersion: 'web');
    expect(await registrar.needsRegistration(), isTrue);
    final id = await registrar.register(client(mock, FakeTokens(), device: null));
    expect(id, '00000000-0000-4000-8000-000000000001');
    expect(await registrar.deviceId(), id);
    expect(await registrar.needsRegistration(), isFalse);
    expect(bodies.single['platform'], 'web');
    expect(bodies.single['schema_version'], 1);

    final upgraded = DeviceRegistrar(db, platform: Platform.WEB, appVersion: '0.2.0', osVersion: 'web');
    expect(await upgraded.needsRegistration(), isTrue);
    await upgraded.register(client(mock, FakeTokens(), device: null));
    expect(bodies[1]['install_id'], bodies[0]['install_id']);
  });

  test('config is cached for 6 hours and the kill switch applies', () async {
    final db = openTestDb();
    addTearDown(db.close);
    var now = DateTime(2026, 10, 27, 9);
    var fetches = 0;
    final mock = MockClient((_) async {
      fetches++;
      return http.Response(jsonEncode(configJson), 200);
    });
    final repo = ConfigRepository(db, Clock(() => now));
    expect((await repo.current()).analysisEnabled, isTrue); // defaults before the first fetch
    expect((await repo.refreshIfStale(client(mock, FakeTokens()))).analysisEnabled, isFalse);
    now = now.add(const Duration(hours: 5));
    await repo.refreshIfStale(client(mock, FakeTokens()));
    expect(fetches, 1);
    now = now.add(const Duration(hours: 2));
    await repo.refreshIfStale(client(mock, FakeTokens()));
    expect(fetches, 2);
  });
}

class SocketLikeException implements Exception {
  const SocketLikeException();
}
