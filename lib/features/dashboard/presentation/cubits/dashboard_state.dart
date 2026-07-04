import '../../domain/entities/prayer_time.dart';

class DashboardState {
  final String gregorianDate;
  final String hijriDate;
  final String masjidName;
  final DateTime now;
  final DateTime jumuahTime;
  final List<PrayerTime> prayerTimes;

  const DashboardState({
    required this.gregorianDate,
    required this.hijriDate,
    required this.masjidName,
    required this.now,
    required this.jumuahTime,
    required this.prayerTimes,
  });

  Duration get jumuahCountdown => jumuahTime.difference(now);

  DashboardState copyWith({
    String? gregorianDate,
    String? hijriDate,
    String? masjidName,
    DateTime? now,
    DateTime? jumuahTime,
    List<PrayerTime>? prayerTimes,
  }) {
    return DashboardState(
      gregorianDate: gregorianDate ?? this.gregorianDate,
      hijriDate: hijriDate ?? this.hijriDate,
      masjidName: masjidName ?? this.masjidName,
      now: now ?? this.now,
      jumuahTime: jumuahTime ?? this.jumuahTime,
      prayerTimes: prayerTimes ?? this.prayerTimes,
    );
  }
}