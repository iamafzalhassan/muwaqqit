import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';

import 'seconds_ring.dart';

class TimeDisplayPanel extends StatelessWidget {
  const TimeDisplayPanel({super.key, this.clockwise = true, this.labelLetterSpacing, required this.secondsValue, required this.labelText, required this.primary, required this.secondary, required this.color, required this.dotColor});

  final bool clockwise;

  final double? labelLetterSpacing;

  final int secondsValue;

  final String labelText;
  final String primary;
  final String secondary;

  final Color color;
  final Color dotColor;

  Widget label(String text) => Text(
    text,
    style: TextStyle(color: AppPallete.textDark, fontFamily: AppFont.productSansThin, fontSize: 35, fontWeight: FontWeight.w300, letterSpacing: labelLetterSpacing),
    textAlign: TextAlign.center,
  );

  Widget bigNumber(String text) => Stack(
    children: [
      Text(
        text,
        style: const TextStyle(color: AppPallete.textDark, fontFamily: AppFont.googleSansRegular, fontSize: 160, fontWeight: FontWeight.w300, height: 1.0),
      ),
      Text(
        text,
        style: TextStyle(
          fontFamily: AppFont.googleSansRegular,
          fontSize: 160,
          fontWeight: FontWeight.w300,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 8
            ..color = AppPallete.textDark,
          height: 1.0,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        label(labelText),
        const SizedBox(height: 15),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double h = constraints.maxHeight;
              final double w = constraints.maxWidth;

              final double gap = h * 0.03;

              final double diameter = ((h - gap) / 1.5).clamp(0.0, w * 0.78);
              final double numberHeight = diameter * 0.5;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: numberHeight,
                    child: FittedBox(fit: BoxFit.contain, child: bigNumber(primary)),
                  ),
                  SizedBox(height: gap),
                  SecondsRing(
                    activeColor: dotColor,
                    activeSeconds: secondsValue,
                    clockwise: clockwise,
                    diameter: diameter,
                    dotSize: diameter * 0.035,
                    child: SizedBox(
                      height: numberHeight,
                      child: FittedBox(fit: BoxFit.contain, child: bigNumber(secondary)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 15),
      ],
    ),
  );
}
