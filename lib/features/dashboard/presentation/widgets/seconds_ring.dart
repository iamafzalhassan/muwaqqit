import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';

class SecondsRing extends StatelessWidget {
  const SecondsRing({
    super.key,
    required this.activeSeconds,
    required this.diameter,
    required this.child,
    this.dotSize = 14,
    this.activeColor = AppPallete.textDark,
    this.inactiveColor = const Color(0x33212529),
    this.clockwise = true,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  final bool clockwise;

  final int activeSeconds;
  final int dotCount = 60;

  final double diameter;
  final double dotSize;

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
            duration: animationDuration,
            curve: Curves.easeOut,
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i < activeSeconds ? activeColor : inactiveColor,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: diameter,
      height: diameter,
      child: Stack(alignment: Alignment.center, children: [...dots, child]),
    );
  }
}