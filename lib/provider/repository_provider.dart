import 'package:fine_dust/provider/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/air_quality_repository_impl.dart';
import '../domain/repository/air_quality_repository.dart';

final airQualityRepositoryProvider = Provider<AirQualityRepository>((ref) {
  final airQualityTodayService = ref.watch(airQualityTodayServiceProvider);
  final airQualityForecastService = ref.watch(airQualityForecastsServiceProvider);

  return AirQualityRepositoryImpl(airQualityTodayService, airQualityForecastService);
});