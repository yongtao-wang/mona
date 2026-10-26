import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/flags.dart';
import '../../domain/sample_day.dart';
import '../../l10n/app_localizations.dart';
import '../../providers.dart';

/// Hidden flag overrides (spec §5.2). Dev flavor only.
class FlagsScreen extends ConsumerWidget {
  const FlagsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(flagValuesProvider).value ?? const {};
    final flags = ref.watch(flagsProvider);
    final cloud = ref.watch(cloudProvider);
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.debugFlags)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l.debugAnalyzeSample),
            subtitle: cloud == null ? Text(l.debugNoGateway) : null,
            enabled: cloud != null,
            onTap: () => _analyzeSample(context, ref),
          ),
          const Divider(),
          for (final key in Flags.defaults.keys)
            if (values[key] == 'true' || values[key] == 'false')
              SwitchListTile(title: Text(key), value: values[key] == 'true', onChanged: (v) => flags.set(key, '$v'))
            else
              ListTile(title: Text(key), trailing: Text(values[key] ?? '')),
        ],
      ),
    );
  }

  /// Adds an unanalyzed sample meeting and runs it through the whole pipeline:
  /// pseudonymizer, gateway, model, citation checks, items on the phone.
  Future<void> _analyzeSample(BuildContext context, WidgetRef ref) async {
    final cloud = ref.read(cloudProvider)!;
    final db = ref.read(databaseProvider);
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    final momentId = await SampleDay(db, ref.read(clockProvider)).addMeetingToAnalyze();
    await cloud.queue.enqueue(momentId);
    await cloud.queue.runDue();
    final job = await db.select(db.cloudJob).get();
    final status = job.where((j) => j.targetId == momentId).map((j) => j.lastError ?? j.status).firstOrNull;
    messenger.showSnackBar(SnackBar(content: Text(l.debugAnalysisResult(status ?? '?'))));
  }
}
