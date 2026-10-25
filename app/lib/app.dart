import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'features/debug/flags_screen.dart';
import 'features/me/me_screen.dart';
import 'features/privacy/privacy_center_screen.dart';
import 'features/theme/theme.dart';
import 'features/today/today_screen.dart';
import 'l10n/app_localizations.dart';

GoRouter buildRouter() => GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, _) => const TodayScreen()),
    GoRoute(
      path: '/me',
      builder: (_, _) => const MeScreen(),
      routes: [
        GoRoute(path: 'privacy', builder: (_, _) => const PrivacyCenterScreen()),
        GoRoute(path: 'debug', builder: (_, _) => const FlagsScreen()),
      ],
    ),
  ],
);

class MonaApp extends StatefulWidget {
  const MonaApp({super.key, this.locale});

  /// Forces a locale (`--dart-define=LOCALE=zh_Hant_TW`); null follows the device.
  final Locale? locale;

  @override
  State<MonaApp> createState() => _MonaAppState();
}

class _MonaAppState extends State<MonaApp> {
  final _router = buildRouter();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
    theme: monaTheme(),
    darkTheme: monaTheme(),
    themeMode: ThemeMode.dark,
    locale: widget.locale,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    routerConfig: _router,
  );
}
