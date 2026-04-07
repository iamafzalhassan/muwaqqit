import 'package:flutter/material.dart';
import 'package:muwaqqit/core/theme/app_font.dart';
import 'package:muwaqqit/core/theme/app_pallete.dart';
import 'package:muwaqqit/core/utils/date_utils.dart' as du;
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';

class PrayerTimeBar extends StatelessWidget {
  const PrayerTimeBar({super.key, required this.prayers});

  final List<PrayerTime> prayers;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            _PrayerSlot(prayer: prayers[0]),
            _PrayerSlot(prayer: prayers[1]),
            _PrayerSlot(prayer: prayers[2]),
            _PrayerSlot(prayer: prayers[3]),
            _PrayerSlot(prayer: prayers[4]),
            _PrayerSlot(prayer: prayers[5]),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 75,
              width: MediaQuery.of(context).size.width / 3,
              child: const VerticalDottedDivider(),
            ),
            SizedBox(
              height: 75,
              width: MediaQuery.of(context).size.width / 3,
              child: const VerticalDottedDivider(),
            ),
            SizedBox(
              height: 75,
              width: MediaQuery.of(context).size.width / 3,
              child: const VerticalDottedDivider(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
              width: (MediaQuery.of(context).size.width / 3) + 2,
              child: const Row(
                children: [
                  VerticalDottedDivider(),
                  Spacer(),
                  VerticalDottedDivider(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PrayerSlot extends StatelessWidget {
  const _PrayerSlot({required this.prayer});

  final PrayerTime prayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width / 6,
      color: prayer.isActive
          ? AppPallete.prayerBarActive
          : AppPallete.prayerBarInactive,
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

class VerticalDottedDivider extends StatelessWidget {
  final double height;
  final double dotHeight;
  final double spacing;
  final Color color;

  const VerticalDottedDivider({
    super.key,
    this.height = 75,
    this.dotHeight = 4,
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