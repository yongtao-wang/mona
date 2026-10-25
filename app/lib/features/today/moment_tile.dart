import 'package:flutter/material.dart';

import '../../domain/today.dart';
import '../../l10n/app_localizations.dart';
import '../theme/icons.dart';
import '../theme/tokens.dart';

/// Moment tile (ui-design §4): Scene ground, type icon and duration on top; quote and
/// meta (time, item badge, mark star) at the bottom. One button whose accessible name
/// is time + quote.
class MomentTileView extends StatelessWidget {
  const MomentTileView({super.key, required this.tile, this.onTap});

  final MomentTile tile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final time = '${tile.startAt.hour.toString().padLeft(2, '0')}:${tile.startAt.minute.toString().padLeft(2, '0')}';
    final quote = tile.quote ?? l.notAnalyzed(sceneName(l, tile.scene));
    final minutes = tile.duration.inMinutes < 1 ? 1 : tile.duration.inMinutes;
    return Semantics(
      button: true,
      label: '$time $quote',
      excludeSemantics: true,
      child: Material(
        color: MonaColors.sceneGround(tile.scene),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MonaIconView(MonaIcon.waveform, size: 16, color: MonaColors.text),
                    Text(l.durationMinutes(minutes), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: tile.analyzed ? 1 : 0.6,
                      child: Text(
                        quote,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13, height: 1.35, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(time, style: const TextStyle(fontSize: 11, color: MonaColors.tileMeta)),
                        if (tile.itemCount > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(
                              color: MonaColors.promise,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              l.itemCount(tile.itemCount),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: MonaColors.promiseInk,
                              ),
                            ),
                          ),
                        if (tile.marked) const MonaIconView(MonaIcon.star, size: 12, color: MonaColors.mark),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String sceneName(AppLocalizations l, String? scene) => switch (scene) {
  'meeting' => l.sceneMeeting,
  'call' => l.sceneCall,
  'social' => l.sceneSocial,
  'show' => l.sceneShow,
  'commute' => l.sceneCommute,
  'solo' => l.sceneSolo,
  _ => l.sceneUnknown,
};
