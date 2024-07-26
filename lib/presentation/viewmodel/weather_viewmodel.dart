import 'package:fine_dust/domain/entity/address.dart';
import 'package:fine_dust/provider/usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/get_weather_forecasts_short_term_usecase.dart';
import '../model/weather_data.dart';

final weatherViewModelProvider = StateNotifierProvider.family<WeatherViewModel, AsyncValue<WeatherData>, Address>((ref, address) {
  final getWeatherForecastsShortTermUsecase = ref.watch(getWeatherForecastsShortTermUseCaseProvider);
  return WeatherViewModel(getWeatherForecastsShortTermUsecase, address);
});

class WeatherViewModel extends StateNotifier<AsyncValue<WeatherData>> {
  final GetWeatherForecastsShortTermUsecase getWeatherForecastsShortTermUsecase;

  WeatherViewModel(this.getWeatherForecastsShortTermUsecase, address) : super(const AsyncValue.loading()) {
    _init(address);
  }

  Future<void> _init(address) async {
    final forecastDateList = await getWeatherForecastsShortTermUsecase.execute(address);
    state = AsyncValue.data(WeatherData([], forecastDateList));
  }
}