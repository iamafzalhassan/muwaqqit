import 'package:intl/intl.dart';
import 'package:muwaqqit/core/constants/iqamah_gaps.dart';
import 'package:muwaqqit/features/dashboard/data/services/location_service.dart';
import 'package:muwaqqit/features/dashboard/data/services/prayer_time_service.dart';
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';
import 'package:muwaqqit/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final LocationService locationService;

  final PrayerTimeService prayerTimeService;

  double? lat;
  double? lng;

  List<PrayerTime>? cachedPrayers;

  DateTime? cachedDay;
  DateTime? cachedNextFajr;

  DashboardRepositoryImpl({this.locationService = const LocationService(), this.prayerTimeService = const PrayerTimeService()});

  DashboardState buildState(DateTime now) {
    final latitude = lat;
    final longitude = lng;
    if (latitude == null || longitude == null) return DashboardState.loading();

    final today = DateTime(now.year, now.month, now.day);
    if (cachedDay != today) {
      cachedDay = today;
      cachedPrayers = prayerTimeService.forDate(date: today, lat: latitude, lng: longitude);
      cachedNextFajr = prayerTimeService.nextFajr(date: today, lat: latitude, lng: longitude);
    }

    final prayers = withActive(cachedPrayers!, now);
    final next = nextEvent(prayers, now, cachedNextFajr!);

    return DashboardState(gregorianDate: formatGregorian(now), hijriDate: '05 RABI AL AKHIR 1447', masjidName: 'MUHIYYADDEEN MASJID', nextLabel: next.label, prayerTimes: prayers, nextPrayerTime: next.time, now: now);
  }

  List<PrayerTime> withActive(List<PrayerTime> prayers, DateTime now) {
    String? activeName;
    for (final prayer in prayers) {
      if (!now.isBefore(prayer.time)) activeName = prayer.name;
    }
    return prayers.map((p) => p.copyWith(isActive: p.name == activeName)).toList();
  }

  ({String label, DateTime time}) nextEvent(List<PrayerTime> prayers, DateTime now, DateTime nextFajr) {
    final events = <({String label, DateTime time})>[];
    for (final prayer in prayers) {
      if (prayer.name == 'SUNRISE') {
        events.add((label: 'FAJR ENDS IN', time: prayer.time));
      } else {
        events.add((label: '${prayer.name} AZAN IN', time: prayer.time));
        events.add((label: '${prayer.name} IQAMAH IN', time: prayer.time.add(IqamahGaps.forPrayer(prayer.name))));
      }
    }
    events.sort((a, b) => a.time.compareTo(b.time));

    for (final event in events) {
      if (event.time.isAfter(now)) return event;
    }
    return (label: 'FAJR AZAN IN', time: nextFajr);
  }

  String formatGregorian(DateTime date) => DateFormat('d MMMM yyyy').format(date).toUpperCase();

  @override
  Future<DashboardState> load() async {
    final location = await locationService.current();
    lat = location.lat;
    lng = location.lng;
    return buildState(DateTime.now());
  }

  @override
  DashboardState tick(DashboardState current) => buildState(DateTime.now());
}
