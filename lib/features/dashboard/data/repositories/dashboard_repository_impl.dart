import 'package:intl/intl.dart';
import 'package:muwaqqit/core/constants/iqamah_gaps.dart';
import 'package:muwaqqit/features/dashboard/data/services/location_service.dart';
import 'package:muwaqqit/features/dashboard/data/services/prayer_time_service.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';
import 'package:muwaqqit/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({
    this.locationService = const LocationService(),
    this.prayerTimeService = const PrayerTimeService(),
  });

  final LocationService locationService;
  final PrayerTimeService prayerTimeService;

  double? _lat;
  double? _lng;

  DateTime? _cachedDay;
  DateTime? _cachedNextFajr;

  List<PrayerTime>? _cachedPrayers;

  @override
  Future<DashboardState> load() async {
    final location = await locationService.current();
    _lat = location.lat;
    _lng = location.lng;
    return buildState(DateTime.now());
  }

  @override
  DashboardState tick(DashboardState current) => buildState(DateTime.now());

  DashboardState buildState(DateTime now) {
    final lat = _lat;
    final lng = _lng;
    if (lat == null || lng == null) return DashboardState.loading();

    final today = DateTime(now.year, now.month, now.day);
    if (_cachedDay != today) {
      _cachedDay = today;
      _cachedPrayers = prayerTimeService.forDate(date: today, lat: lat, lng: lng);
      _cachedNextFajr = prayerTimeService.nextFajr(date: today, lat: lat, lng: lng);
    }

    final prayers = _withActive(_cachedPrayers!, now);
    final next = _nextEvent(prayers, now, _cachedNextFajr!);

    return DashboardState(
      gregorianDate: _formatGregorian(now),
      hijriDate: '05 RABI AL AKHIR 1447',
      masjidName: 'MUHIYYADDEEN MASJID',
      now: now,
      prayerTimes: prayers,
      nextPrayerTime: next.time,
      nextLabel: next.label,
    );
  }

  List<PrayerTime> _withActive(List<PrayerTime> prayers, DateTime now) {
    String? activeName;
    for (final prayer in prayers) {
      if (!now.isBefore(prayer.time)) activeName = prayer.name;
    }
    return prayers.map((p) => p.copyWith(isActive: p.name == activeName)).toList();
  }

  ({String label, DateTime time}) _nextEvent(
    List<PrayerTime> prayers,
    DateTime now,
    DateTime nextFajr,
  ) {
    final events = <({String label, DateTime time})>[];
    for (final prayer in prayers) {
      if (prayer.name == 'SUNRISE') {
        events.add((label: 'FAJR ENDS IN', time: prayer.time));
      } else {
        events.add((label: '${prayer.name} AZAN IN', time: prayer.time));
        events.add((
          label: '${prayer.name} IQAMAH IN',
          time: prayer.time.add(IqamahGaps.forPrayer(prayer.name)),
        ));
      }
    }
    events.sort((a, b) => a.time.compareTo(b.time));

    for (final event in events) {
      if (event.time.isAfter(now)) return event;
    }
    return (label: 'FAJR AZAN IN', time: nextFajr);
  }

  String _formatGregorian(DateTime date) => DateFormat('d MMMM yyyy').format(date).toUpperCase();
}