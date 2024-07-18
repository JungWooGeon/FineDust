import '../entity/address.dart';

abstract class AirQualityRepository {
  Future<dynamic> getAirQualityToday(Address address);
  Future<dynamic> getAirQualityForecasts(String region);
}