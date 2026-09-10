import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/core/utils/date_utils.dart' as du;
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';

class PrayerSlot extends StatelessWidget {
  const PrayerSlot({required this.prayer});

  final PrayerTime prayer;

  @override
  Widget build(BuildContext context) => Container(
    color: prayer.isActive ? AppPallete.prayerBarActive : AppPallete.prayerBarInactive,
    height: 75,
    width: MediaQuery.of(context).size.width / 6,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prayer.name,
          style: const TextStyle(color: AppPallete.textDark, fontFamily: AppFont.productSansThin, fontSize: 25, fontWeight: FontWeight.w300, height: 1.15, letterSpacing: 1.5),
        ),
        Text(
          du.DateUtils.formatPrayerTime(prayer.time),
          style: const TextStyle(color: AppPallete.textDark, fontFamily: AppFont.googleSansRegular, fontSize: 25, fontWeight: FontWeight.w300, height: 1.15),
        ),
      ],
    ),
  );
}
