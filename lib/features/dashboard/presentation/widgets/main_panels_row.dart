import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/core/utils/date_utils.dart' as du;
import 'time_display_panel.dart';
import 'manners_panel.dart';

class MainPanelsRow extends StatelessWidget {
  const MainPanelsRow({
    super.key,
    required this.jumuahCountdown,
    required this.now,
  });

  final Duration jumuahCountdown;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TimeDisplayPanel(
              color: AppPallete.panelGrey,
              labelLetterSpacing: 2,
              labelText: 'TIME',
              primary: du.DateUtils.formatHours(now),
              secondary: du.DateUtils.formatMinutes(now),
              seconds: du.DateUtils.formatSeconds(now),
            ),
          ),
          Expanded(
            child: TimeDisplayPanel(
              color: AppPallete.panelYellow,
              labelText: "JUMU'AH IN",
              primary: du.DateUtils.countdownHours(jumuahCountdown),
              secondary: du.DateUtils.countdownMinutes(jumuahCountdown),
              seconds: du.DateUtils.countdownSeconds(jumuahCountdown),
            ),
          ),
          Expanded(child: MannersPanel()),
        ],
      ),
    );
  }
}