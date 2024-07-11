import 'package:fine_dust/provider/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/weather_repository_impl.dart';
import '../domain/repository/weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final weatherService = ref.watch(weatherServiceProvider);
  return WeatherRepositoryImpl(weatherService);
});