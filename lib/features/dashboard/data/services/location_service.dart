import 'package:geolocator/geolocator.dart';

class LocationService {
  const LocationService();

  Future<({double lat, double lng})> current() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return _fallback;

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return _fallback;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      return (lat: position.latitude, lng: position.longitude);
    } catch (_) {
      return _fallback;
    }
  }

  ({double lat, double lng}) get _fallback => (lat: 6.9271, lng: 79.8612);
}