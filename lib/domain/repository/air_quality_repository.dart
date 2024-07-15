abstract class AirQualityRepository {
  Future<dynamic> getAirQualityToday();
  Future<dynamic> getAirQualityForecasts();
}