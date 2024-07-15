import 'package:fine_dust/data/service/location_service.dart';
import 'package:fine_dust/provider/geolocator_platform_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/service/air_quality_forcasts_service.dart';
import '../data/service/air_quality_today_service.dart';
import 'dio_client_provider.dart';

final airQualityTodayServiceProvider = Provider<AirQualityTodayService>((ref) {
  final dioClient = ref.watch(airQualityTodayDioClientProvider);
  return AirQualityTodayService(dioClient);
});

final airQualityForecastsServiceProvider = Provider<AirQualityForecastsService>((ref) {
  final dioClient = ref.watch(airQualityForecastDioClientProvider);
  return AirQualityForecastsService(dioClient);
});

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService(ref.watch(geolocatorPlatformProvider));
});