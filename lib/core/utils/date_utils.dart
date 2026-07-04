import 'package:intl/intl.dart';

abstract class DateUtils {
  static String formatGregorian(DateTime date) {
    return DateFormat('d MMMM yyyy').format(date).toUpperCase();
  }

  static String formatHours(DateTime time) => pad(time.hour);

  static String formatMinutes(DateTime time) => pad(time.minute);

  static String formatSeconds(DateTime time) => pad(time.second);

  static String countdownHours(Duration d) {
    if (d.isNegative) return '00';
    return pad(d.inHours);
  }

  static String countdownMinutes(Duration d) {
    if (d.isNegative) return '00';
    return pad(d.inMinutes.remainder(60));
  }

  static String countdownSeconds(Duration d) {
    if (d.isNegative) return '00';
    return pad(d.inSeconds.remainder(60));
  }

  static String formatPrayerTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  static String pad(int value) => value.abs().toString().padLeft(2, '0');
}