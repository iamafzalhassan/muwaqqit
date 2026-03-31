import 'package:intl/intl.dart';
import 'package:muwaqqit/core/constants/app_constants.dart';
import 'package:muwaqqit/features/dashboard/domain/entities/dashboard_state.dart';
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';
import 'package:muwaqqit/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl();

  @override
  DashboardState getInitialState() {
    final now = DateTime.now();
    return _buildState(now);
  }

  @override
  DashboardState tick(DashboardState current) {
    final now = DateTime.now();
    return _buildState(now);
  }

  DashboardState _buildState(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);

    final prayers = _buildPrayerTimes(today, now);
    final jumuah = today.add(const Duration(hours: 12, minutes: 3));

    return DashboardState(
      now: now,
      jumuahTime: jumuah,
      prayerTimes: prayers,
      gregorianDate: _formatGregorian(now),
      hijriDate: '05 RABI AL AKHIR 1447',
      masjidName: AppConstants.masjidName,
    );
  }

  List<PrayerTime> _buildPrayerTimes(DateTime today, DateTime now) {
    final rawTimes = <String, Duration>{
      'FAJR': const Duration(hours: 4, minutes: 44),
      'SUNRISE': const Duration(hours: 5, minutes: 59),
      "JUMU'AH": const Duration(hours: 12, minutes: 3),
      'ASR': const Duration(hours: 15, minutes: 16),
      'MAGHRIB': const Duration(hours: 18, minutes: 5),
      'ISHA': const Duration(hours: 19, minutes: 14),
    };

    String? activeName;
    DateTime? activePrayer;
    for (final entry in rawTimes.entries) {
      final t = today.add(entry.value);
      if (!now.isBefore(t)) {
        if (activePrayer == null || t.isAfter(activePrayer)) {
          activePrayer = t;
          activeName = entry.key;
        }
      }
    }

    return rawTimes.entries.map((e) {
      final time = today.add(e.value);
      return PrayerTime(name: e.key, time: time, isActive: e.key == activeName);
    }).toList();
  }

  String _formatGregorian(DateTime date) {
    return DateFormat('d MMMM yyyy').format(date).toUpperCase();
  }
}