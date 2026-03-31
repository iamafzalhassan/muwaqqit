import 'package:flutter/material.dart';
import 'package:muwaqqit/features/dashboard/presentation/screens/Dashboard.dart';

import 'core/theme/app_theme.dart';

class Muwaqqit extends StatelessWidget {
  const Muwaqqit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muwaqqit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Dashboard(),
    );
  }
}