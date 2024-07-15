import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geolocatorPlatformProvider = Provider<GeolocatorPlatform>((ref) {
  return GeolocatorPlatform.instance;
});
