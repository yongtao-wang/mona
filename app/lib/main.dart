import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'bootstrap.dart';
import 'core/flavor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await bootstrap(env: AppEnv.fromEnvironment());
  const localeTag = String.fromEnvironment('LOCALE');
  final parts = localeTag.split('_');
  final locale = localeTag.isEmpty
      ? null
      : Locale.fromSubtags(
          languageCode: parts[0],
          scriptCode: parts.length > 1 ? parts[1] : null,
          countryCode: parts.length > 2 ? parts[2] : null,
        );
  runApp(
    ProviderScope(
      overrides: app.overrides,
      child: MonaApp(locale: locale),
    ),
  );
}
