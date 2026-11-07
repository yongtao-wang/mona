import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'bootstrap.dart';
import 'core/flavor.dart';
import 'features/startup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // LOCALE overrides the device language (e.g. zh_Hant_TW); English is the fallback (D30).
  const localeTag = String.fromEnvironment('LOCALE');
  final parts = localeTag.split('_');
  final locale = localeTag.isEmpty
      ? null
      : Locale.fromSubtags(
          languageCode: parts[0],
          scriptCode: parts.length > 1 ? parts[1] : null,
          countryCode: parts.length > 2 ? parts[2] : null,
        );

  // Draw something at once, so a slow or failing start is never a blank screen.
  final step = ValueNotifier<String>('starting');
  runApp(StartupScreen(step: step));

  try {
    final app = await bootstrap(
      env: AppEnv.fromEnvironment(),
      language: locale?.languageCode ?? PlatformDispatcher.instance.locale.languageCode,
      onStep: (s) => step.value = s,
    ).timeout(const Duration(seconds: 30));
    runApp(
      ProviderScope(
        overrides: app.overrides,
        child: MonaApp(locale: locale),
      ),
    );
  } catch (e, st) {
    // Startup runs before any user content exists, so debug builds may show the
    // message; release builds show the error type only (spec §15).
    final detail = kDebugMode ? '$e' : e.runtimeType.toString();
    debugPrint('startup failed at ${step.value}: $e\n$st');
    runApp(StartupScreen(step: step, error: detail));
  }
}
