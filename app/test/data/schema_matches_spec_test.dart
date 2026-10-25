import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The local schema is copied from spec §10.2; change the spec first, then the copy.
void main() {
  test('lib/data/schema.drift matches spec §10.2', () {
    final spec = File('../docs/implementation-spec.md').readAsStringSync();
    final section = spec.substring(spec.indexOf('### 10.2 Schema'), spec.indexOf('### 10.3 Migrations'));
    final start = section.indexOf('```sql\n') + 7;
    final fromSpec = section.substring(start, section.indexOf('\n```', start)).trim();
    final drift = File('lib/data/schema.drift').readAsLinesSync().skip(3).join('\n');
    // The copy quotes "key", because drift's parser drops an unquoted column named key.
    expect(drift.replaceAll('("key" TEXT', '(key TEXT').trim(), fromSpec);
  });
}
