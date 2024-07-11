import 'package:fine_dust/provider/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecase/get_weather_info_usecase.dart';

final getWeatherInfoUseCaseProvider = Provider<GetWeatherInfoUseCase>((ref) {
  final repository = ref.watch(weatherRepositoryProvider);
  return GetWeatherInfoUseCase(repository);
});