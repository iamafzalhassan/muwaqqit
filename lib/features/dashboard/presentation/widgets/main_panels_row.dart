import 'package:flutter/material.dart';
import 'time_panel.dart';
import 'jumuah_panel.dart';
import 'manners_panel.dart';

class MainPanelsRow extends StatelessWidget {
  const MainPanelsRow({
    super.key,
    required this.now,
    required this.jumuahCountdown,
  });

  final DateTime now;
  final Duration jumuahCountdown;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: TimePanel(now: now)),
          Expanded(child: JumuahPanel(countdown: jumuahCountdown)),
          Expanded(child: MannersPanel()),
        ],
      ),
    );
  }
}