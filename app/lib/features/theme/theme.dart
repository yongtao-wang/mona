import 'package:flutter/material.dart';

import 'tokens.dart';

/// Dark only in Phase 1 (ui-design §2).
ThemeData monaTheme() {
  final base = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: monaFontFamily,
    fontFamilyFallback: monaFontFallback,
    scaffoldBackgroundColor: MonaColors.bg,
    colorScheme: const ColorScheme.dark(
      surface: MonaColors.bg,
      onSurface: MonaColors.text,
      primary: MonaColors.text,
      onPrimary: MonaColors.bg,
      secondary: MonaColors.text2,
      error: MonaColors.rec,
      outline: MonaColors.divider,
    ),
    dividerColor: MonaColors.divider,
  );
  return base.copyWith(
    textTheme: base.textTheme.apply(bodyColor: MonaColors.text, displayColor: MonaColors.text),
    appBarTheme: const AppBarTheme(
      backgroundColor: MonaColors.bg,
      foregroundColor: MonaColors.text,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: MonaColors.text),
    ),
    listTileTheme: const ListTileThemeData(textColor: MonaColors.text, iconColor: MonaColors.text2),
  );
}
