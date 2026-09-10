import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';

class SecondsRing extends StatelessWidget {
  const SecondsRing({
    super.key,
    this.clockwise = true,
    required this.diameter,
    this.dotSize = 14,
    required this.activeSeconds,
    this.activeColor = AppPallete.textDark,
    this.inactiveColor = const Color(0x33212529),
    this.animationDuration = const Duration(milliseconds: 300),
    required this.child,
  });

  final bool clockwise;

  final double diameter;
  final double dotSize;

  final int activeSeconds;
  final int dotCount = 60;

  final Color activeColor;
  final Color inactiveColor;

  final Duration animationDuration;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double radius = (diameter - dotSize) / 2;
    final double center = diameter / 2;

    final dots = <Widget>[];
    for (int i = 0; i < dotCount; i++) {
      final double step = i * 2 * math.pi / dotCount;
      final double angle = -math.pi / 2 + (clockwise ? step : -step);
      final double dx = center + radius * math.cos(angle) - dotSize / 2;
      final double dy = center + radius * math.sin(angle) - dotSize / 2;
      dots.add(
        Positioned(
          left: dx,
          top: dy,
          child: AnimatedContainer(
            curve: Curves.easeOut,
            decoration: BoxDecoration(shape: BoxShape.circle, color: i < activeSeconds ? activeColor : inactiveColor),
            duration: animationDuration,
            height: dotSize,
            width: dotSize,
          ),
        ),
      );
    }

    return SizedBox(
      height: diameter,
      width: diameter,
      child: Stack(alignment: Alignment.center, children: [...dots, child]),
    );
  }
}
