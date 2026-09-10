import 'package:adhan/adhan.dart';
import 'package:muwaqqit/features/dashboard/domain/entities/prayer_time.dart';

class PrayerTimeService {
  const PrayerTimeService();

  List<PrayerTime> forDate({required DateTime date, required double lat, required double lng}) {
    final prayers = compute(date, lat, lng);
    final noonName = date.weekday == DateTime.friday ? "JUMU'AH" : 'DHUHR';
    return [
      PrayerTime(name: 'FAJR', time: prayers.fajr!.toLocal()),
      PrayerTime(name: 'SUNRISE', time: prayers.sunrise!.toLocal()),
      PrayerTime(name: noonName, time: prayers.dhuhr!.toLocal()),
      PrayerTime(name: 'ASR', time: prayers.asr!.toLocal()),
      PrayerTime(name: 'MAGHRIB', time: prayers.maghrib!.toLocal()),
      PrayerTime(name: 'ISHA', time: prayers.isha!.toLocal()),
    ];
  }

  DateTime nextFajr({required DateTime date, required double lat, required double lng}) {
    final next = date.add(const Duration(days: 1));
    return compute(next, lat, lng).fajr!.toLocal();
  }

  PrayerTimes compute(DateTime date, double lat, double lng) {
    final coordinates = Coordinates(lat, lng);
    final components = DateComponents(date.year, date.month, date.day);
    return PrayerTimes(coordinates, components, params());
  }

  CalculationParameters params() {
    final parameters = CalculationMethod.karachi.getParameters();
    parameters.madhab = Madhab.shafi;
    return parameters;
  }
}
