import 'package:flutter/foundation.dart';

/// Structured logging with an allowlist of fields (spec §18). Values are limited to
/// numbers, booleans and short codes, so transcript text has nowhere to go. Errors are
/// logged as their type and stack, never their message (§15: a FormatException quotes
/// its input).
class Log {
  Log([void Function(String)? sink]) : sink = sink ?? debugPrint;

  final void Function(String) sink;

  static const allowedFields = {
    'event',
    'code',
    'status',
    'state',
    'reason',
    'scene',
    'route',
    'latency_ms',
    'attempt',
    'count',
    'flavor',
  };

  void event(String name, [Map<String, Object> fields = const {}]) {
    final out = <String, Object>{'event': name};
    fields.forEach((k, v) {
      if (allowedFields.contains(k) && (v is num || v is bool || (v is String && _isCode(v)))) out[k] = v;
    });
    sink(out.toString());
  }

  void error(String where, Object error, StackTrace stack) {
    sink({'event': 'error', 'where': where, 'type': error.runtimeType.toString()}.toString());
    sink(stack.toString());
  }

  static bool _isCode(String v) => v.length <= 40 && RegExp(r'^[a-z0-9_.:/-]*$').hasMatch(v);
}
