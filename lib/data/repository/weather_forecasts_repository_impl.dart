import 'package:fine_dust/data/service/weather_forecasts_service.dart';
import 'package:fine_dust/domain/repository/weather_forecasts_repository.dart';

import '../../domain/entity/address.dart';
import '../../domain/entity/weather_forecasts_short_term_info.dart';
import '../mapper/weather_forecasts_short_term_info_mapper.dart';
import '../service/date_time_service.dart';

class WeatherForecastsRepositoryImpl extends WeatherForecastsRepository {
  final WeatherForecastsService weatherForecastsService;
  final DateTimeService dateTimeService;

  WeatherForecastsRepositoryImpl(this.weatherForecastsService, this.dateTimeService);

  @override
  Future<WeatherForecastsShortTermInfo> getWeatherForecastsShortTerm(Address address) async {
    String baseDateTime = dateTimeService.getCurrentDateFormatted();
    String nx = address.x;
    String ny = address.y;

    final response = await weatherForecastsService.getWeatherForecastsShortTerm(baseDateTime, nx, ny);
    final weatherForecastsShortTermForecasts =  WeatherForecastsShortTermInfoMapper.fromJson(response);
    return weatherForecastsShortTermForecasts;
  }

  @override
  Future getWeatherForecastsMidTerm() {
    // TODO: implement getWeatherForecastsMidTerm
    throw UnimplementedError();
  }
}