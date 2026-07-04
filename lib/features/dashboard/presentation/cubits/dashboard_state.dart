import '../../domain/entities/prayer_time.dart';

class DashboardState {
  final String gregorianDate;
  final String hijriDate;
  final String masjidName;
  final DateTime jumuahTime;
  final DateTime now;
  final List<PrayerTime> prayerTimes;

  const DashboardState({
    required this.gregorianDate,
    required this.hijriDate,
    required this.masjidName,
    required this.jumuahTime,
    required this.now,
    required this.prayerTimes,
  });

  Duration get jumuahCountdown => jumuahTime.difference(now);

  DashboardState copyWith({
    String? gregorianDate,
    String? hijriDate,
    String? masjidName,
    DateTime? jumuahTime,
    DateTime? now,
    List<PrayerTime>? prayerTimes,
  }) {
    return DashboardState(
      gregorianDate: gregorianDate ?? this.gregorianDate,
      hijriDate: hijriDate ?? this.hijriDate,
      masjidName: masjidName ?? this.masjidName,
      jumuahTime: jumuahTime ?? this.jumuahTime,
      now: now ?? this.now,
      prayerTimes: prayerTimes ?? this.prayerTimes,
    );
  }
}