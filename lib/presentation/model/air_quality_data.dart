import '../../domain/entity/address.dart';
import '../../domain/entity/air_quality_forecasts_info.dart';
import '../../domain/entity/air_quality_today_info.dart';

class AirQualityData {
  final AirQualityTodayInfo todayInfo;
  final List<AirQualityForecastsInfo> forecastsInfo;
  final Address address;

  AirQualityData({
    required this.todayInfo,
    this.forecastsInfo = const [],
    required this.address
  });
}
