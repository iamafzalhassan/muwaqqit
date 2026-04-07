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
          SizedBox(height: 15),
          _label('TIME'),
          SizedBox(height: 15),
          _bigNumber(du.DateUtils.formatHours(now)),
          _bigNumber(du.DateUtils.formatMinutes(now)),
          _secondsNumber(du.DateUtils.formatSeconds(now)),
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
      letterSpacing: 2,
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