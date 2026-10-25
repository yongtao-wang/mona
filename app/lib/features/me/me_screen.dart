import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/flavor.dart';
import '../../engines/capture_engine.dart';
import '../../l10n/app_localizations.dart';
import '../../providers.dart';
import '../theme/tokens.dart';
import '../today/state_pill.dart';
import '../today/today_screen.dart';

/// 我 (ui-design screen 16, still open). For now: the way into the privacy center, two
/// taps from Today (spec §5.4), and the debug flags in dev builds.
class MeScreen extends ConsumerWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final env = ref.watch(envProvider);
    final state = ref.watch(captureStateProvider).value ?? const CaptureIdle();
    return Scaffold(
      appBar: AppBar(
        title: Text(l.tabMe),
        actions: [
          // I2: the pill stays visible on every screen while capturing.
          if (state is! CaptureIdle)
            Padding(
              padding: const EdgeInsets.only(right: MonaSpace.side),
              child: StatePill(state: state, onTap: () => showCaptureControls(context, ref)),
            ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l.privacyCenter),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/me/privacy'),
          ),
          if (env.flavor == Flavor.dev)
            ListTile(
              title: Text(l.debugFlags),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/me/debug'),
            ),
          Padding(
            padding: const EdgeInsets.all(MonaSpace.side),
            child: Text(
              l.flavorLabel('${env.flavor.name} ${env.appVersion}'),
              style: const TextStyle(fontSize: 12, color: MonaColors.text2),
            ),
          ),
        ],
      ),
    );
  }
}
