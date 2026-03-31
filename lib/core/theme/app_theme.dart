import 'package:flutter/material.dart';
import 'app_pallete.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: AppPallete.panelGrey,
    colorScheme: ColorScheme.fromSeed(seedColor: AppPallete.prayerBarActive),
    useMaterial3: true,
  );
}