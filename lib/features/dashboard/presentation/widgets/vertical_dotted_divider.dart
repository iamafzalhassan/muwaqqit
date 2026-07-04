import 'package:flutter/material.dart';

class VerticalDottedDivider extends StatelessWidget {
  final double dotHeight;
  final double height;
  final double spacing;
  final Color color;

  const VerticalDottedDivider({
    super.key,
    this.dotHeight = 4,
    this.height = 75,
    this.spacing = 4,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          (height / (dotHeight + spacing)).floor(),
          (_) => Container(width: 2, height: dotHeight, color: color),
        ),
      ),
    );
  }
}
