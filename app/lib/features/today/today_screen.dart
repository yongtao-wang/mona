import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/today.dart';
import '../../engines/capture_engine.dart';
import '../../l10n/app_localizations.dart';
import '../../providers.dart';
import '../theme/icons.dart';
import '../theme/tokens.dart';
import 'bottom_bar.dart';
import 'moment_tile.dart';
import 'state_pill.dart';

/// Today (spec §5.4; canvas Main.dc.html): state pill, date, the day's numbers, view
/// tabs, the moment grid and the bottom bar.
class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final state = ref.watch(captureStateProvider).value ?? const CaptureIdle();
    final today = ref.watch(todayProvider).value ?? const TodaySummary([], promises: 0);
    final engine = ref.watch(captureEngineProvider);
    final liveActivitiesOff =
        ref.watch(flagValuesProvider).value?['dev.live_activities_off'] == 'true' || !engine.liveActivitiesEnabled;
    final capturing = state is! CaptureIdle;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _Header(state: state)),
            if (liveActivitiesOff) SliverToBoxAdapter(child: _Banner(text: l.liveActivitiesOff)),
            SliverToBoxAdapter(child: _Stats(today: today)),
            const SliverToBoxAdapter(child: _ViewTabs()),
            if (today.tiles.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text(
                      l.emptyToday,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: MonaColors.text2),
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.only(top: MonaSpace.gridGap),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: MonaSpace.gridGap,
                    crossAxisSpacing: MonaSpace.gridGap,
                    // 162 at default text size; taller tiles at larger sizes so text reflows (§5.5).
                    mainAxisExtent: math.max(162, MediaQuery.textScalerOf(context).scale(162)),
                  ),
                  itemCount: today.tiles.length,
                  itemBuilder: (context, i) => MomentTileView(tile: today.tiles[i], onTap: () => _comingSoon(context)),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: MonaBottomBar(
        capturing: capturing,
        onRecord: () => capturing ? engine.stop() : _start(context, engine, l),
        onCalendar: () => _comingSoon(context),
        onRecap: () => _comingSoon(context),
        onMe: () => context.push('/me'),
      ),
    );
  }

  Future<void> _start(BuildContext context, CaptureEngine engine, AppLocalizations l) async {
    final messenger = ScaffoldMessenger.of(context);
    final result = await engine.start(Scene.day, const UserIntent.fromUserAction(StartTrigger.inApp));
    if (result is Refused && result.reason == StartRefusal.liveActivitiesOff) {
      messenger.showSnackBar(SnackBar(content: Text(l.liveActivitiesOff)));
    }
  }
}

void _comingSoon(BuildContext context) => ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).comingSoon)));

class _Header extends ConsumerWidget {
  const _Header({required this.state});

  final CaptureState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final now = ref.watch(clockProvider).now();
    final date = DateFormat('M/d EEE', locale.languageCode == 'zh' ? 'zh_TW' : locale.toLanguageTag()).format(now);
    return Padding(
      padding: const EdgeInsets.fromLTRB(MonaSpace.side, 8, MonaSpace.side, 0),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: StatePill(
                state: state,
                onTap: state is CaptureIdle ? null : () => showCaptureControls(context, ref),
              ),
            ),
          ),
          Text(date, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Semantics(
                button: true,
                label: l.search,
                excludeSemantics: true,
                child: Material(
                  color: MonaColors.surface,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => _comingSoon(context),
                    child: const SizedBox.square(
                      dimension: MonaSpace.minTouch,
                      child: Center(child: MonaIconView(MonaIcon.search, size: 20, color: MonaColors.text)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Stand-in for the Day-mode live view (ui-design screen 7, still open): pause,
/// private and resume, so every capture state can be reached.
Future<void> showCaptureControls(BuildContext context, WidgetRef ref) {
  final l = AppLocalizations.of(context);
  final engine = ref.read(captureEngineProvider);
  final state = engine.state;
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: MonaColors.surface,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (state is CaptureRecording) ...[
            ListTile(
              title: Text(l.pause),
              onTap: () {
                engine.pause(PauseReason.user);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(l.goPrivate),
              onTap: () {
                engine.goPrivate(const Duration(minutes: 30));
                Navigator.pop(context);
              },
            ),
          ] else
            ListTile(
              title: Text(l.resume),
              onTap: () {
                engine.resume(const UserIntent.fromUserAction(StartTrigger.inApp));
                Navigator.pop(context);
              },
            ),
          ListTile(
            title: Text(l.stopRecording, style: const TextStyle(color: MonaColors.rec)),
            onTap: () {
              engine.stop();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

class _Banner extends StatelessWidget {
  const _Banner({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.fromLTRB(MonaSpace.side, 12, MonaSpace.side, 0),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: MonaColors.recPill, borderRadius: BorderRadius.circular(MonaSpace.chipRadius)),
    child: Text(text, style: const TextStyle(fontSize: 13)),
  );
}

class _Stats extends StatelessWidget {
  const _Stats({required this.today});

  final TodaySummary today;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final hours = (today.talkTime.inMinutes / 60).toStringAsFixed(1);
    Widget stat(String value, String label) => Expanded(
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 12, color: MonaColors.text2)),
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(MonaSpace.side, 16, MonaSpace.side, 12),
      child: Row(
        children: [
          stat('${today.tiles.length}', l.statMoments),
          stat('${today.promises}', l.statPromises),
          stat(l.talkHours(hours), l.statTalk),
        ],
      ),
    );
  }
}

class _ViewTabs extends StatelessWidget {
  const _ViewTabs();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    Widget tab(MonaIcon icon, String label, bool selected) => Expanded(
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        excludeSemantics: true,
        child: InkWell(
          onTap: selected ? null : () => _comingSoon(context),
          child: Container(
            height: MonaSpace.minTouch,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: selected ? MonaColors.text : Colors.transparent, width: 2)),
            ),
            alignment: Alignment.center,
            child: MonaIconView(icon, size: 22, color: selected ? MonaColors.text : MonaColors.text2),
          ),
        ),
      ),
    );
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: MonaColors.divider)),
      ),
      child: Row(
        children: [
          tab(MonaIcon.grid, l.viewGrid, true),
          tab(MonaIcon.items, l.viewItems, false),
          tab(MonaIcon.star, l.viewMarked, false),
        ],
      ),
    );
  }
}
