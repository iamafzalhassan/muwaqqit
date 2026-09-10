import 'package:flutter/material.dart';

class VerticalDottedDivider extends StatelessWidget {
  const VerticalDottedDivider({super.key, this.dotHeight = 4, this.height = 75, this.spacing = 4, this.color = Colors.white});

  final double dotHeight;
  final double height;
  final double spacing;

  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate((height / (dotHeight + spacing)).floor(), (_) => Container(color: color, height: dotHeight, width: 2)),
    ),
  );
}
