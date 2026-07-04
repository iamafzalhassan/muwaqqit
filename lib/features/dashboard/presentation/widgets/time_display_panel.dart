import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';

class TimeDisplayPanel extends StatelessWidget {
  const TimeDisplayPanel({
    super.key,
    this.labelLetterSpacing,
    required this.labelText,
    required this.primary,
    required this.secondary,
    required this.seconds,
    required this.color,
  });

  final double? labelLetterSpacing;
  final String labelText;
  final String primary;
  final String secondary;
  final String seconds;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          label(labelText),
          SizedBox(height: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bigNumber(primary),
                bigNumber(secondary),
                SizedBox(height: 15),
                secondsNumber(seconds),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget label(String text) => Text(
    text,
    style: TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 35,
      color: AppPallete.textDark,
      letterSpacing: labelLetterSpacing,
      fontWeight: FontWeight.w300,
    ),
    textAlign: TextAlign.center,
  );

  Widget bigNumber(String text) => Stack(
    children: [
      Text(
        text,
        style: TextStyle(
          fontFamily: AppFont.googleSansRegular,
          fontSize: 220,
          color: AppPallete.textDark,
          height: 0.85,
          fontWeight: FontWeight.w300,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontFamily: AppFont.googleSansRegular,
          fontSize: 220,
          height: 0.85,
          fontWeight: FontWeight.w300,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 10
            ..color = AppPallete.textDark,
        ),
      ),
    ],
  );

  Widget secondsNumber(String text) => Text(
    text,
    style: const TextStyle(
      fontFamily: AppFont.productSansThin,
      fontSize: 80,
      height: 0.85,
      color: AppPallete.textDark,
      fontWeight: FontWeight.w300,
    ),
  );
}