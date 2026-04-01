import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/core/utils/date_utils.dart' as du;

class TimePanel extends StatelessWidget {
  const TimePanel({super.key, required this.now});

  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.panelGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _label('TIME'),
          const SizedBox(height: 4),
          _bigNumber(du.DateUtils.formatHours(now)),
          _bigNumber(du.DateUtils.formatMinutes(now)),
          _secondsNumber(du.DateUtils.formatSeconds(now)),
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 35,
      color: AppPallete.textDark,
      letterSpacing: 3.5,
      fontWeight: FontWeight.w300,
    ),
  );

  Widget _bigNumber(String text) => Text(
    text,
    style: const TextStyle(
      fontFamily: AppFont.googleSans,
      fontSize: 180,
      color: AppPallete.textDark,
      height: 0.95,
      fontWeight: FontWeight.w400,
    ),
  );

  Widget _secondsNumber(String text) => Text(
    text,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 100,
      color: AppPallete.textDark,
      fontWeight: FontWeight.w300,
    ),
  );
}