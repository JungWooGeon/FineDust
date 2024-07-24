import 'package:fine_dust/domain/repository/weather_forecasts_repository.dart';

import '../entity/weather_forecasts_mid_term_info.dart';

class GetWeatherForecastsMidTermUsecase {
  WeatherForecastsRepository weatherForecastsRepository;

  GetWeatherForecastsMidTermUsecase(this.weatherForecastsRepository);

  Future<WeatherForecastsMidTermInfo> execute() async {
    return await weatherForecastsRepository.getWeatherForecastsMidTerm();
  }
}