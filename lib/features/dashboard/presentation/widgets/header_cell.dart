import 'package:flutter/material.dart';

class HeaderCell extends StatelessWidget {
  const HeaderCell({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 50,
      alignment: Alignment.center,
      child: child,
    );
  }
}