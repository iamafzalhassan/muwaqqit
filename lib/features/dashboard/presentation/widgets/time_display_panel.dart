import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'seconds_ring.dart';

class TimeDisplayPanel extends StatelessWidget {
  const TimeDisplayPanel({
    super.key,
    this.labelLetterSpacing,
    required this.labelText,
    required this.primary,
    required this.secondary,
    required this.secondsValue,
    required this.color,
    required this.dotColor,
    this.clockwise = true,
  });

  final double? labelLetterSpacing;

  final String labelText;
  final String primary;
  final String secondary;

  final int secondsValue;

  final Color color;

  /// Active-dot color for the seconds ring.
  final Color dotColor;

  /// Direction the ring fills.
  final bool clockwise;

  @override
  Widget build(BuildContext context) {
    return Container(
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

                // Hours and the ring stack as: number(N) + gap + ring(D), where
                // the minutes number inside the ring is the same height N, so
                // hours and minutes render at an identical size. N = 0.5 * D.
                final double diameter =
                    ((h - gap) / 1.5).clamp(0.0, w * 0.78);
                final double numberHeight = diameter * 0.5;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: numberHeight,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: bigNumber(primary),
                      ),
                    ),
                    SizedBox(height: gap),
                    SecondsRing(
                      activeSeconds: secondsValue,
                      diameter: diameter,
                      dotSize: diameter * 0.035,
                      activeColor: dotColor,
                      clockwise: clockwise,
                      // Same height as the hours → matching text size, and it
                      // stays comfortably inside the ring of dots.
                      child: SizedBox(
                        height: numberHeight,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: bigNumber(secondary),
                        ),
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
        style: const TextStyle(
          fontFamily: AppFont.googleSansRegular,
          fontSize: 160,
          color: AppPallete.textDark,
          height: 1.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontFamily: AppFont.googleSansRegular,
          fontSize: 160,
          height: 1.0,
          fontWeight: FontWeight.w300,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 8
            ..color = AppPallete.textDark,
        ),
      ),
    ],
  );
}