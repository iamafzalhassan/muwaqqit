import '../../domain/entities/prayer_time.dart';

class DashboardState {
  final DateTime now;
  final DateTime jumuahTime;
  final List<PrayerTime> prayerTimes;
  final String gregorianDate;
  final String hijriDate;
  final String masjidName;

  const DashboardState({
    required this.now,
    required this.jumuahTime,
    required this.prayerTimes,
    required this.gregorianDate,
    required this.hijriDate,
    required this.masjidName,
  });

  Duration get jumuahCountdown => jumuahTime.difference(now);

  DashboardState copyWith({
    DateTime? now,
    DateTime? jumuahTime,
    List<PrayerTime>? prayerTimes,
    String? gregorianDate,
    String? hijriDate,
    String? masjidName,
  }) {
    return DashboardState(
      now: now ?? this.now,
      jumuahTime: jumuahTime ?? this.jumuahTime,
      prayerTimes: prayerTimes ?? this.prayerTimes,
      gregorianDate: gregorianDate ?? this.gregorianDate,
      hijriDate: hijriDate ?? this.hijriDate,
      masjidName: masjidName ?? this.masjidName,
    );
  }
}