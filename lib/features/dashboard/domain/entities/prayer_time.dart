class PrayerTime {
  final String name;
  final DateTime time;
  final bool isActive;

  const PrayerTime({
    required this.name,
    required this.time,
    this.isActive = false,
  });

  PrayerTime copyWith({String? name, DateTime? time, bool? isActive}) {
    return PrayerTime(
      name: name ?? this.name,
      time: time ?? this.time,
      isActive: isActive ?? this.isActive,
    );
  }
}