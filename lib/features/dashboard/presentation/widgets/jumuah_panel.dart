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
          const Spacer(),
          _bigNumber(du.DateUtils.countdownHours(countdown)),
          _bigNumber(du.DateUtils.countdownMinutes(countdown)),
          _secondsNumber(du.DateUtils.countdownSeconds(countdown)),
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 20,
      color: AppPallete.textDark,
      letterSpacing: 2,
      fontWeight: FontWeight.w300,
    ),
  );

  Widget _bigNumber(String text) => Text(
    text,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 50,
      color: AppPallete.textDark,
      height: 0.95,
      fontWeight: FontWeight.w300,
    ),
  );

  Widget _secondsNumber(String text) => Text(
    text,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 50,
      color: AppPallete.textDark,
      fontWeight: FontWeight.w300,
    ),
  );
}