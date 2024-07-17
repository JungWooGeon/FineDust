import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  final GeolocatorPlatform _geolocatorPlatform;
  Placemark? _place;

  LocationService(this._geolocatorPlatform);

  static Future<LocationService> create(GeolocatorPlatform geolocatorPlatform) async {

    return LocationService(geolocatorPlatform);
  }

  Future<String?> getAddress() async {
    Position position = await _geolocatorPlatform.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks.first;
    _place = place;

    return _place?.street;
  }

  Future<String?> getAdministrativeArea() async {
    if (_place?.administrativeArea != null || _place?.administrativeArea != "") {
      return _place?.administrativeArea;
    } else {
      return _place?.subAdministrativeArea;
    }
  }
}
