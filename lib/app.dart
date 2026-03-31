import 'package:flutter/material.dart';
import 'package:muwaqqit/features/dashboard/presentation/screens/Dashboard.dart';

class Muwaqqit extends StatelessWidget {
  const Muwaqqit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Dashboard(),
    );
  }
}