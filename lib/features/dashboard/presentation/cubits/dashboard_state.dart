import '../../domain/entities/prayer_time.dart';

class DashboardState {
  final bool ready;

  final String gregorianDate;
  final String hijriDate;
  final String masjidName;
  final String nextLabel;

  final List<PrayerTime> prayerTimes;

  final DateTime nextPrayerTime;
  final DateTime now;

  const DashboardState({this.ready = true, required this.gregorianDate, required this.hijriDate, required this.masjidName, required this.nextLabel, required this.prayerTimes, required this.nextPrayerTime, required this.now});

  factory DashboardState.loading() {
    final now = DateTime.now();
    return DashboardState(ready: false, gregorianDate: '', hijriDate: '', masjidName: 'MUHIYYADDEEN MASJID', nextLabel: '', prayerTimes: const [], nextPrayerTime: now, now: now);
  }

  Duration get nextPrayerCountdown => nextPrayerTime.difference(now);
}
