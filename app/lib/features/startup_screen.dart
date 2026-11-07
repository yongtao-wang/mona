import 'package:flutter/material.dart';

import 'theme/theme.dart';
import 'theme/tokens.dart';

/// Shown while the app starts, and with the reason if starting fails. It runs before
/// localization is loaded, so its few words are plain English.
class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key, required this.step, this.error});

  final ValueNotifier<String> step;
  final String? error;

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: monaTheme(),
    home: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(MonaSpace.side),
          child: ValueListenableBuilder<String>(
            valueListenable: step,
            builder: (context, current, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (error == null) ...[
                  const CircularProgressIndicator(color: MonaColors.text2),
                  const SizedBox(height: 16),
                  Text('Starting… ($current)', style: const TextStyle(color: MonaColors.text2)),
                ] else ...[
                  const Text("Couldn't start", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('Step: $current', style: const TextStyle(color: MonaColors.text2)),
                  const SizedBox(height: 8),
                  SelectableText(error!, style: const TextStyle(fontSize: 13)),
                ],
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
