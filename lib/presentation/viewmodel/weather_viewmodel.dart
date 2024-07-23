import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/weather_data.dart';

final weatherViewModelProvider = StateNotifierProvider<WeatherViewModel, AsyncValue<WeatherData>>((ref) {
  return WeatherViewModel();
});

class WeatherViewModel extends StateNotifier<AsyncValue<WeatherData>> {

  WeatherViewModel() : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {

  }
}