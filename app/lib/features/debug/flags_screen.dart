import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/flags.dart';
import '../../l10n/app_localizations.dart';
import '../../providers.dart';

/// Hidden flag overrides (spec §5.2). Dev flavor only.
class FlagsScreen extends ConsumerWidget {
  const FlagsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(flagValuesProvider).value ?? const {};
    final flags = ref.watch(flagsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).debugFlags)),
      body: ListView(
        children: [
          for (final key in Flags.defaults.keys)
            if (values[key] == 'true' || values[key] == 'false')
              SwitchListTile(title: Text(key), value: values[key] == 'true', onChanged: (v) => flags.set(key, '$v'))
            else
              ListTile(title: Text(key), trailing: Text(values[key] ?? '')),
        ],
      ),
    );
  }
}
