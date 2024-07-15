import '../../domain/entity/address.dart';
import '../../domain/entity/air_quality_forecasts_info.dart';
import '../../domain/entity/air_quality_today_info.dart';

class AirQualityData {
  final List<AirQualityTodayInfo> todayInfo;
  final List<AirQualityForecastsInfo> forecastsInfo;
  final Address address;

  AirQualityData({
    this.todayInfo = const [],
    this.forecastsInfo = const [],
    required this.address
  });
}
