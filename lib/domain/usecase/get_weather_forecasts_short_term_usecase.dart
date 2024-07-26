import 'package:fine_dust/domain/entity/forecast_date.dart';
import 'package:fine_dust/domain/repository/weather_forecasts_repository.dart';

import '../entity/address.dart';

class GetWeatherForecastsShortTermUsecase {
  WeatherForecastsRepository weatherForecastsRepository;

  GetWeatherForecastsShortTermUsecase(this.weatherForecastsRepository);

  Future<List<ForecastDate>> execute(Address address) async {
    return await weatherForecastsRepository.getWeatherForecastsShortTerm(address);
  }
}