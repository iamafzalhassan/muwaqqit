import 'package:intl/intl.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';
import 'package:muwaqqit/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl();

  @override
  DashboardState getInitialState() {
    final now = DateTime.now();
    return buildState(now);
  }

  @override
  DashboardState tick(DashboardState current) {
    final now = DateTime.now();
    return buildState(now);
  }

  DashboardState buildState(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final prayers = buildPrayerTimes(today, now);
    final jumuah = today.add(const Duration(hours: 12, minutes: 3));

    return DashboardState(
      gregorianDate: formatGregorian(now),
      hijriDate: '05 RABI AL AKHIR 1447',
      masjidName: 'MUHIYYADDEEN MASJID',
      jumuahTime: jumuah,
      now: now,
      prayerTimes: prayers,
    );
  }

  List<PrayerTime> buildPrayerTimes(DateTime today, DateTime now) {
    MapEntry<String, Duration>? active;

    final times = <String, Duration>{
      'FAJR': const Duration(hours: 4, minutes: 44),
      'SUNRISE': const Duration(hours: 5, minutes: 59),
      "JUMU'AH": const Duration(hours: 12, minutes: 3),
      'ASR': const Duration(hours: 15, minutes: 16),
      'MAGHRIB': const Duration(hours: 18, minutes: 5),
      'ISHA': const Duration(hours: 19, minutes: 14),
    };

    for (final entry in times.entries) {
      if (!now.isBefore(today.add(entry.value))) active = entry;
    }

    return times.entries.map((e) {
      final time = today.add(e.value);
      return PrayerTime(isActive: e.key == active?.key, name: e.key, time: time);
    }).toList();
  }

  String formatGregorian(DateTime date) {
    return DateFormat('d MMMM yyyy').format(date).toUpperCase();
  }
}