class IqamahGaps {
  const IqamahGaps._();

  static const Map<String, int> minutes = {
    'FAJR': 20,
    'DHUHR': 10,
    "JUMU'AH": 10,
    'ASR': 10,
    'MAGHRIB': 5,
    'ISHA': 10,
  };

  static Duration forPrayer(String name) => Duration(minutes: minutes[name] ?? 10);
}