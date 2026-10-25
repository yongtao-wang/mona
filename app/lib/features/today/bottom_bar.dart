import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../theme/icons.dart';
import '../theme/tokens.dart';

/// Bottom bar (ui-design §4): 今天, 日曆, record button, 回顧, 我.
class MonaBottomBar extends StatelessWidget {
  const MonaBottomBar({
    super.key,
    required this.capturing,
    required this.onRecord,
    required this.onCalendar,
    required this.onRecap,
    required this.onMe,
  });

  final bool capturing;
  final VoidCallback onRecord;
  final VoidCallback onCalendar;
  final VoidCallback onRecap;
  final VoidCallback onMe;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Container(
        color: MonaColors.bgBar,
        padding: EdgeInsets.only(top: 10, bottom: MediaQuery.paddingOf(context).bottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Tab(icon: MonaIcon.home, label: l.tabToday, selected: true, onTap: () {}),
            _Tab(icon: MonaIcon.calendar, label: l.tabCalendar, onTap: onCalendar),
            Semantics(
              button: true,
              label: capturing ? l.stopRecording : l.startRecording,
              excludeSemantics: true,
              child: InkWell(
                key: const Key('record-button'),
                onTap: onRecord,
                borderRadius: BorderRadius.circular(MonaSpace.chipRadius),
                child: SizedBox(
                  width: 64,
                  height: MonaSpace.minTouch,
                  child: Center(
                    child: Container(
                      width: 52,
                      height: 40,
                      decoration: BoxDecoration(
                        color: MonaColors.text,
                        borderRadius: BorderRadius.circular(MonaSpace.chipRadius),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: capturing ? 16 : 20,
                        height: capturing ? 16 : 20,
                        decoration: BoxDecoration(
                          color: MonaColors.rec,
                          borderRadius: BorderRadius.circular(capturing ? 4 : 10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _Tab(icon: MonaIcon.star, label: l.tabRecap, onTap: onRecap),
            _Tab(icon: MonaIcon.person, label: l.tabMe, onTap: onMe),
          ],
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({required this.icon, required this.label, required this.onTap, this.selected = false});

  final MonaIcon icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final color = selected ? MonaColors.text : MonaColors.text2;
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 64,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MonaIconView(icon, color: color),
              const SizedBox(height: 3),
              Text(
                label,
                maxLines: 1,
                style: TextStyle(fontSize: 11, color: color, fontWeight: selected ? FontWeight.w600 : FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
