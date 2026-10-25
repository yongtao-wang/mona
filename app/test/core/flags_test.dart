import 'package:flutter_test/flutter_test.dart';
import 'package:mona/core/flags.dart';
import 'package:mona/core/flavor.dart';

import '../helpers.dart';

void main() {
  test('flags are seeded per flavor and overrides survive a re-seed', () async {
    final db = openTestDb();
    addTearDown(db.close);
    final dev = Flags(db, Flavor.dev);
    await dev.seed();
    expect(await dev.boolFlag('dev.sample_day'), isTrue);
    expect(await dev.doubleFlag('tau_nudge'), 0.8);

    await dev.set('dev.sample_day', 'false');
    await dev.seed();
    expect(await dev.boolFlag('dev.sample_day'), isFalse);
  });

  test('alpha builds never seed the sample day', () async {
    final db = openTestDb();
    addTearDown(db.close);
    final alpha = Flags(db, Flavor.alpha);
    await alpha.seed();
    expect(await alpha.boolFlag('dev.sample_day'), isFalse);
  });
}
