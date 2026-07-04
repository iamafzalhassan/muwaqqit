import 'package:flutter/material.dart';

class MannerIcon extends StatelessWidget {
  const MannerIcon({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(path, fit: BoxFit.contain),
    );
  }
}