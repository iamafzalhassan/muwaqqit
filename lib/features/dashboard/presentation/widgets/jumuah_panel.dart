import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/core/utils/date_utils.dart' as du;

class JumuahPanel extends StatelessWidget {
  const JumuahPanel({super.key, required this.countdown});

  final Duration countdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.panelYellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _label("JUMU'AH IN"),
          const SizedBox(height: 4),
          _bigNumber(du.DateUtils.countdownHours(countdown)),
          _bigNumber(du.DateUtils.countdownMinutes(countdown)),
          _secondsNumber(du.DateUtils.countdownSeconds(countdown)),
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