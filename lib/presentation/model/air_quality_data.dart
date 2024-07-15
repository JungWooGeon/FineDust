import '../../domain/entity/air_quality_forecasts_info.dart';
import '../../domain/entity/air_quality_today_info.dart';

class AirQualityData {
  final List<AirQualityTodayInfo> todayInfo;
  final List<AirQualityForecastsInfo> forecastsInfo;

  AirQualityData({
    this.todayInfo = const [],
    this.forecastsInfo = const [],
  });
}
