import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/result.dart';

/// A gateway failure (spec §12.7). [code] is the server's code, or `network` when the
/// request never got an answer.
class GatewayFailure {
  const GatewayFailure(this.code, {required this.retryable, this.status, this.retryAfter});

  final String code;
  final bool retryable;
  final int? status;
  final Duration? retryAfter;

  bool get upgradeRequired => code == 'upgrade_required';

  @override
  String toString() => 'GatewayFailure($code)';
}

/// Supplies the user's access token; refreshes it when the gateway says 401.
abstract interface class TokenSource {
  Future<String?> accessToken();
  Future<bool> refresh();
}

/// Calls the gateway and applies the client actions of §12.7: refresh the JWT and
/// retry once on 401, register the device and retry once on 403. Everything else is
/// returned to the caller, which owns backoff and the job queue (§8.8).
class GatewayClient {
  GatewayClient({
    required this.base,
    required this.httpClient,
    required this.tokens,
    required this.appVersion,
    required this.deviceId,
    required this.registerDevice,
  });

  final Uri base;
  final http.Client httpClient;
  final TokenSource tokens;
  final String appVersion;
  final Future<String?> Function() deviceId;

  /// Registers this install and returns the new device id, or null on failure.
  final Future<String?> Function() registerDevice;

  Future<Result<Map<String, dynamic>, GatewayFailure>> get(String path) => _send('GET', path, null);

  Future<Result<Map<String, dynamic>, GatewayFailure>> post(String path, Map<String, dynamic> body) =>
      _send('POST', path, body);

  Future<Result<Map<String, dynamic>, GatewayFailure>> _send(
    String method,
    String path,
    Map<String, dynamic>? body, {
    bool refreshed = false,
    bool registered = false,
  }) async {
    final http.Response res;
    try {
      final req = http.Request(method, base.replace(path: '${base.path}$path'))
        ..headers.addAll({
          'x-app-version': appVersion,
          if (await tokens.accessToken() case final t?) 'authorization': 'Bearer $t',
          'x-device-id': ?await deviceId(),
          if (body != null) 'content-type': 'application/json',
        });
      if (body != null) req.body = jsonEncode(body);
      res = await http.Response.fromStream(await httpClient.send(req));
    } on Exception {
      return const Err(GatewayFailure('network', retryable: true));
    }

    if (res.statusCode == 200) return Ok(jsonDecode(res.body) as Map<String, dynamic>);

    final failure = _parse(res);
    if (failure.code == 'unauthorized' && !refreshed && await tokens.refresh()) {
      return _send(method, path, body, refreshed: true, registered: registered);
    }
    if (failure.code == 'device_unknown' && !registered && path != '/v1/device' && await registerDevice() != null) {
      return _send(method, path, body, refreshed: refreshed, registered: true);
    }
    return Err(failure);
  }

  static GatewayFailure _parse(http.Response res) {
    final retryAfter = int.tryParse(res.headers['retry-after'] ?? '');
    try {
      final error = (jsonDecode(res.body) as Map<String, dynamic>)['error'] as Map<String, dynamic>;
      return GatewayFailure(
        error['code'] as String,
        retryable: error['retryable'] as bool,
        status: res.statusCode,
        retryAfter: retryAfter == null ? null : Duration(seconds: retryAfter),
      );
    } on Object {
      return GatewayFailure('http_${res.statusCode}', retryable: res.statusCode >= 500, status: res.statusCode);
    }
  }
}
