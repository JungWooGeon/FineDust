import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/weather_info.dart';
import '../../domain/usecase/get_weather_info_usecase.dart';
import '../../provider/usecase_provider.dart';

final weatherViewModelProvider = StateNotifierProvider<WeatherViewModel, AsyncValue<List<WeatherInfo>>>((ref) {
  final getWeatherInfoUseCase = ref.watch(getWeatherInfoUseCaseProvider);
  return WeatherViewModel(getWeatherInfoUseCase);
});

class WeatherViewModel extends StateNotifier<AsyncValue<List<WeatherInfo>>> {
  final GetWeatherInfoUseCase _getWeatherInfoUseCase;

  WeatherViewModel(this._getWeatherInfoUseCase) : super(const AsyncValue.loading()) {
    _fetchWeatherInfo();
  }

  Future<void> _fetchWeatherInfo() async {
    try {
      final weatherInfo = await _getWeatherInfoUseCase.execute();
      state = AsyncValue.data(weatherInfo);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}