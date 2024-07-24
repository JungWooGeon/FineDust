import 'package:fine_dust/domain/entity/weather_forecasts_short_term_info.dart';
import 'package:fine_dust/domain/repository/weather_forecasts_repository.dart';

import '../entity/address.dart';

class GetWeatherForecastsShortTermUsecase {
  WeatherForecastsRepository weatherForecastsRepository;

  GetWeatherForecastsShortTermUsecase(this.weatherForecastsRepository);

  Future<WeatherForecastsShortTermInfo> execute(Address address) async {
    return await weatherForecastsRepository.getWeatherForecastsShortTerm(address);
  }
}