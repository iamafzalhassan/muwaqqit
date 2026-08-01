import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/core/utils/date_utils.dart' as du;
import 'time_display_panel.dart';

class MainPanelsRow extends StatelessWidget {
  const MainPanelsRow({
    super.key,
    required this.countdown,
    required this.countdownLabel,
    required this.now,
  });

  final Duration countdown;
  final String countdownLabel;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final int countdownSeconds = countdown.isNegative ? 0 : countdown.inSeconds.remainder(60);

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
              secondsValue: now.second,
              dotColor: AppPallete.dotActiveGreen,
              clockwise: true,
            ),
          ),
          Expanded(
            child: TimeDisplayPanel(
              color: AppPallete.panelYellow,
              labelText: countdownLabel,
              primary: du.DateUtils.countdownHours(countdown),
              secondary: du.DateUtils.countdownMinutes(countdown),
              secondsValue: countdownSeconds,
              dotColor: AppPallete.dotActiveRed,
              clockwise: false,
            ),
          ),
        ],
      ),
    );
  }
}