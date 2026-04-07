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
          SizedBox(height: 15),
          _label("JUMU'AH IN"),
          SizedBox(height: 15),
          _bigNumber(du.DateUtils.countdownHours(countdown)),
          _bigNumber(du.DateUtils.countdownMinutes(countdown)),
          _secondsNumber(du.DateUtils.countdownSeconds(countdown)),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 35,
      color: AppPallete.textDark,
      fontWeight: FontWeight.w300,
    ),
  );

  Widget _bigNumber(String text) => Stack(
    children: [
      Text(
        text,
        style: TextStyle(
          fontFamily: AppFont.googleSansRegular,
          fontSize: 170,
          color: AppPallete.textDark,
          height: 0.85,
          fontWeight: FontWeight.w300,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontFamily: AppFont.googleSansRegular,
          fontSize: 170,
          height: 0.85,
          fontWeight: FontWeight.w300,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 10
            ..color = AppPallete.textDark,
        ),
      )
    ],
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