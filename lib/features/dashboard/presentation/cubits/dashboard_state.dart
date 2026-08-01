import '../../domain/entities/prayer_time.dart';

class DashboardState {
  final String gregorianDate;
  final String hijriDate;
  final String masjidName;
  final DateTime now;
  final List<PrayerTime> prayerTimes;
  final DateTime nextPrayerTime;
  final String nextLabel;
  final bool ready;

  const DashboardState({
    required this.gregorianDate,
    required this.hijriDate,
    required this.masjidName,
    required this.now,
    required this.prayerTimes,
    required this.nextPrayerTime,
    required this.nextLabel,
    this.ready = true,
  });

  factory DashboardState.loading() {
    final now = DateTime.now();
    return DashboardState(
      gregorianDate: '',
      hijriDate: '',
      masjidName: 'MUHIYYADDEEN MASJID',
      now: now,
      prayerTimes: const [],
      nextPrayerTime: now,
      nextLabel: '',
      ready: false,
    );
  }

  Duration get nextPrayerCountdown => nextPrayerTime.difference(now);
}
