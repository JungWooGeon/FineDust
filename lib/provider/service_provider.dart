import 'package:fine_dust/data/service/databse_service.dart';
import 'package:fine_dust/data/service/date_time_service.dart';
import 'package:fine_dust/data/service/location_service.dart';
import 'package:fine_dust/data/service/weather_forecasts_service.dart';
import 'package:fine_dust/provider/facade_provider.dart';
import 'package:fine_dust/provider/geolocator_platform_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/service/air_quality_forcasts_service.dart';
import '../data/service/air_quality_today_service.dart';
import '../data/service/local_storage_service.dart';
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

final weatherForecastsServiceProvider = Provider<WeatherForecastsService>((ref) {
  final dioClient = ref.watch(weatherForecastsDioClientProvider);
  return WeatherForecastsService(dioClient);
});

final dateTimeServiceProvider = Provider<DateTimeService>((ref) {
  final dateTimeFacade = ref.watch(dateTimeFacadeProvider);
  return DateTimeService(dateTimeFacade);
});

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  final service = LocalStorageService();
  return service;
});

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});