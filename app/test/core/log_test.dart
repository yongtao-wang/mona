import 'package:flutter_test/flutter_test.dart';
import 'package:mona/core/log.dart';

void main() {
  test('only allowlisted fields with code-like values are logged', () {
    final lines = <String>[];
    Log(lines.add).event('cloud_job_failed', {
      'code': 'model_refused',
      'attempt': 2,
      'text': 'I will send the draft to Alex',
      'reason': 'Alex said so',
    });
    expect(lines.single, contains('model_refused'));
    expect(lines.single, contains('attempt: 2'));
    expect(lines.single, isNot(contains('Alex')));
  });

  test('errors log their type, never their message', () {
    final lines = <String>[];
    Log(lines.add).error('parse', const FormatException('陳怡君 said hi'), StackTrace.current);
    expect(lines.join('\n'), contains('FormatException'));
    expect(lines.join('\n'), isNot(contains('陳怡君')));
  });
}
