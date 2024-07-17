import 'package:fine_dust/data/repository/location_repository_impl.dart';
import 'package:fine_dust/domain/repository/location_repository.dart';
import 'package:fine_dust/provider/service_provider.dart';
import 'package:fine_dust/provider/util_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/air_quality_repository_impl.dart';
import '../domain/repository/air_quality_repository.dart';

final airQualityRepositoryProvider = Provider<AirQualityRepository>((ref) {
  final airQualityTodayService = ref.watch(airQualityTodayServiceProvider);
  final airQualityForecastService = ref.watch(airQualityForecastsServiceProvider);
  final airQualityUtil = ref.watch(airQualityUtilProvider);

  return AirQualityRepositoryImpl(airQualityTodayService, airQualityForecastService, airQualityUtil);
});

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  final locationService = ref.watch(locationServiceProvider);
  return LocationRepositoryImpl(locationService);
});