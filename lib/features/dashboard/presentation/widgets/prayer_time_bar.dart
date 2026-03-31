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
    return Row(children: _buildSlots());
  }

  List<Widget> _buildSlots() {
    final widgets = <Widget>[];
    for (int i = 0; i < prayers.length; i++) {
      widgets.add(Expanded(child: _PrayerSlot(prayer: prayers[i])));
      if (i < prayers.length - 1) {
        widgets.add(const _DashedDivider());
      }
    }
    return widgets;
  }
}

class _PrayerSlot extends StatelessWidget {
  const _PrayerSlot({required this.prayer});

  final PrayerTime prayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
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
              fontSize: 28,
              color: AppPallete.textDark,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            du.DateUtils.formatPrayerTime(prayer.time),
            style: const TextStyle(
              fontFamily: AppFont.googleSans,
              fontSize: 38,
              color: AppPallete.textDark,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2,
      height: 143,
      child: CustomPaint(painter: _DashedLinePainter()),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashHeight = 8.0;
    const dashSpace = 5.0;
    final paint = Paint()
      ..color = AppPallete.textDark.withOpacity(0.35)
      ..strokeWidth = 2;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter _) => false;
}