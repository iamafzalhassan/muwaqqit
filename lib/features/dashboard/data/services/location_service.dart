import 'package:geolocator/geolocator.dart';

class LocationService {
  const LocationService();

  ({double lat, double lng}) get fallback => (lat: 6.9271, lng: 79.8612);

  Future<({double lat, double lng})> current() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return fallback;

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        return fallback;
      }

      final position = await Geolocator.getCurrentPosition(locationSettings: const LocationSettings(accuracy: LocationAccuracy.high));
      return (lat: position.latitude, lng: position.longitude);
    } catch (_) {
      return fallback;
    }
  }
}
