import 'package:flutter/material.dart';

import 'app_pallete.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppPallete.prayerBarActive),
    scaffoldBackgroundColor: AppPallete.panelGrey,
    useMaterial3: true,
  );
}
