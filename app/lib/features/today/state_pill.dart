import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../engines/capture_engine.dart';
import '../../l10n/app_localizations.dart';
import '../../providers.dart';
import '../theme/tokens.dart';

/// The capture state pill (ui-design §3 Capture states, §4). Each state has a color and
/// a label, never color alone; VoiceOver reads the label (spec §5.5). Visible on every
/// screen shown while capturing (I2).
class StatePill extends ConsumerWidget {
  const StatePill({super.key, required this.state, this.onTap});

  final CaptureState state;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final now = ref.watch(tickerProvider).value ?? ref.watch(clockProvider).now();
    final (dot, background, label) = switch (state) {
      CaptureIdle() => (MonaColors.text2, MonaColors.surface, l.stateIdle),
      CaptureRecording(:final since) => (MonaColors.rec, MonaColors.recPill, l.stateRecording(_elapsed(now, since))),
      CapturePrivate(:final until) => (MonaColors.mark, MonaColors.surface, l.statePrivate(_hhmm(until))),
      CapturePaused(:final reason) => (
        MonaColors.text2,
        MonaColors.surface,
        l.statePaused(pauseReasonLabel(l, reason)),
      ),
    };
    return Semantics(
      button: onTap != null,
      liveRegion: true,
      label: label,
      excludeSemantics: true,
      child: Material(
        color: background,
        shape: const StadiumBorder(),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 32, minWidth: MonaSpace.minTouch),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static String _elapsed(DateTime now, DateTime since) {
    final d = now.difference(since);
    final m = d.inMinutes;
    final s = d.inSeconds % 60;
    return d.inHours > 0
        ? '${d.inHours}:${(m % 60).toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}'
        : '$m:${s.toString().padLeft(2, '0')}';
  }

  static String _hhmm(DateTime t) => '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
}

String pauseReasonLabel(AppLocalizations l, PauseReason r) => switch (r) {
  PauseReason.zone => l.pauseReasonZone,
  PauseReason.battery => l.pauseReasonBattery,
  PauseReason.storage => l.pauseReasonStorage,
  PauseReason.thermal => l.pauseReasonThermal,
  PauseReason.interruption => l.pauseReasonInterruption,
  PauseReason.indicator => l.pauseReasonIndicator,
  PauseReason.user => l.pauseReasonUser,
};
