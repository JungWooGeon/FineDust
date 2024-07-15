import 'package:fine_dust/domain/usecase/get_air_quality_forecasts_usecase.dart';
import 'package:fine_dust/provider/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecase/get_air_quality_today_usecase.dart';

final getAirQualityTodayUseCaseProvider = Provider<GetAirQualityTodayUseCase>((ref) {
  final repository = ref.watch(airQualityRepositoryProvider);
  return GetAirQualityTodayUseCase(repository);
});

final getAirQualityForecastsUseCaseProvider = Provider<GetAirQualityForecastsUseCase>((ref) {
  final repository = ref.watch(airQualityRepositoryProvider);
  return GetAirQualityForecastsUseCase(repository);
});