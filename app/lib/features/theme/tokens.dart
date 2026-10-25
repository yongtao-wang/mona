import 'package:flutter/painting.dart';

/// Design tokens from docs/design/ui-design.md §3. Add a token there before using a new one.
abstract final class MonaColors {
  static const bg = Color(0xFF0B0B0F);
  static const bgBar = Color(0xFF000000);
  static const surface = Color(0xFF1A1A22);
  static const overlay = Color(0x73000000);
  static const divider = Color(0xFF23232B);
  static const text = Color(0xFFFFFFFF);
  static const text2 = Color(0xFFA8A8B3);
  static const rec = Color(0xFFFF4D5E);
  static const promise = Color(0xFFFFB37A);
  static const mark = Color(0xFFFFD66B);
  static const recPill = Color(0xFF26141A);

  /// Tile meta text and the item badge's text, as drawn on the Today canvas.
  static const tileMeta = Color(0xFFD5D5DC);
  static const promiseInk = Color(0xFF2A1608);

  static const sceneGrounds = {
    'meeting': Color(0xFF1C2740),
    'call': Color(0xFF173238),
    'social': Color(0xFF3A2416),
    'show': Color(0xFF2A1A3A),
    'commute': Color(0xFF23262E),
    'solo': Color(0xFF2E2A16),
  };

  static Color sceneGround(String? scene) => sceneGrounds[scene] ?? sceneGrounds['commute']!;

  /// Speaker colors: You, B, C, D (lanes and avatars).
  static const speakers = [Color(0xFF5B8CFF), Color(0xFFFFB37A), Color(0xFF7ED6C1), Color(0xFFC9A6FF)];
}

abstract final class MonaSpace {
  static const side = 16.0;
  static const gridGap = 2.0;
  static const chipRadius = 12.0;
  static const sourceCardRadius = 14.0;
  static const minTouch = 44.0;
}

const monaFontFamily = 'Inter';
const monaFontFallback = ['Noto Sans TC', 'system-ui'];
