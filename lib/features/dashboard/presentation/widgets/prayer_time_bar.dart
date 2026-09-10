import 'package:flutter/material.dart';
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/prayer_slot.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/vertical_dotted_divider.dart';

class PrayerTimeBar extends StatelessWidget {
  const PrayerTimeBar({super.key, required this.prayers});

  final List<PrayerTime> prayers;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Row(
        children: [
          PrayerSlot(prayer: prayers[0]),
          PrayerSlot(prayer: prayers[1]),
          PrayerSlot(prayer: prayers[2]),
          PrayerSlot(prayer: prayers[3]),
          PrayerSlot(prayer: prayers[4]),
          PrayerSlot(prayer: prayers[5]),
        ],
      ),
      Row(
        children: [
          SizedBox(height: 75, width: MediaQuery.of(context).size.width / 3, child: const VerticalDottedDivider()),
          SizedBox(height: 75, width: MediaQuery.of(context).size.width / 3, child: const VerticalDottedDivider()),
          SizedBox(height: 75, width: MediaQuery.of(context).size.width / 3, child: const VerticalDottedDivider()),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 75,
            width: (MediaQuery.of(context).size.width / 3) + 2,
            child: const Row(children: [VerticalDottedDivider(), Spacer(), VerticalDottedDivider()]),
          ),
        ],
      ),
    ],
  );
}
