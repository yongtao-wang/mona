import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../engines/capture_engine.dart';
import '../../l10n/app_localizations.dart';
import '../../providers.dart';
import '../theme/tokens.dart';
import '../today/state_pill.dart';
import '../today/today_screen.dart';

/// Counts of what is stored on this phone, by kind (spec §13.5 storage summary).
final storageSummaryProvider = StreamProvider<Map<String, int>>((ref) {
  final db = ref.watch(databaseProvider);
  return db
      .customSelect(
        'SELECT (SELECT count(*) FROM session) AS sessions, (SELECT count(*) FROM moment) AS moments, '
        '(SELECT count(*) FROM media WHERE deleted_at IS NULL AND kind = \'audio\') AS audio',
        readsFrom: {db.session, db.moment, db.media},
      )
      .watch()
      .map((rows) => {for (final e in rows.single.data.entries) e.key: e.value as int});
});

/// Privacy center (spec §13.5; ui-design screen 14, still open). First piece: the
/// storage summary and the plain-language notes. Timers, zones, permissions, export and
/// deletion come with their features.
class PrivacyCenterScreen extends ConsumerWidget {
  const PrivacyCenterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final counts = ref.watch(storageSummaryProvider).value ?? const {};
    final state = ref.watch(captureStateProvider).value ?? const CaptureIdle();
    return Scaffold(
      appBar: AppBar(
        title: Text(l.privacyCenter),
        actions: [
          if (state is! CaptureIdle)
            Padding(
              padding: const EdgeInsets.only(right: MonaSpace.side),
              child: StatePill(state: state, onTap: () => showCaptureControls(context, ref)),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(MonaSpace.side),
        children: [
          Text(l.privacyStaysOnPhone, style: const TextStyle(fontSize: 15, height: 1.4)),
          const SizedBox(height: 8),
          Text(l.privacyNoMove, style: const TextStyle(fontSize: 13, color: MonaColors.text2, height: 1.4)),
          const SizedBox(height: 24),
          Text(l.privacyStorage, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          for (final (label, key) in [
            (l.privacySessions, 'sessions'),
            (l.privacyMoments, 'moments'),
            (l.privacyAudioFiles, 'audio'),
          ])
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(label),
              trailing: Text('${counts[key] ?? 0}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
        ],
      ),
    );
  }
}
