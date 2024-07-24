import '../entity/address.dart';

abstract class WeatherForecastsRepository {
  Future<dynamic> getWeatherForecastsShortTerm(Address address);
  Future<dynamic> getWeatherForecastsMidTerm();
}