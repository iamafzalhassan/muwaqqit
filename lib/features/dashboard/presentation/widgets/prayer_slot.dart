import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/core/utils/date_utils.dart' as du;
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';

class PrayerSlot extends StatelessWidget {
  const PrayerSlot({required this.prayer});

  final PrayerTime prayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width / 6,
      color: prayer.isActive ? AppPallete.prayerBarActive : AppPallete.prayerBarInactive,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            prayer.name,
            style: const TextStyle(
              fontFamily: AppFont.productSansThin,
              fontSize: 25,
              color: AppPallete.textDark,
              letterSpacing: 1.5,
              height: 1.15,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            du.DateUtils.formatPrayerTime(prayer.time),
            style: const TextStyle(
              fontFamily: AppFont.googleSansRegular,
              fontSize: 25,
              height: 1.15,
              color: AppPallete.textDark,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}