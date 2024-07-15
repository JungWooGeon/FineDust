import '../../domain/entity/air_quality_forecasts_info.dart';

class AirQualityForecastsInfoMapper {
  static AirQualityForecastsInfo fromJson(Map<String, dynamic> json) {
    return AirQualityForecastsInfo(
      region: json['region'] as String,
      grade: json['grade'] as String,
      date: json['date'] as String
    );
  }

  static Map<String, dynamic> toJson(AirQualityForecastsInfo airQualityTodayInfo) {
    return {
      'region': airQualityTodayInfo.region,
      'grade': airQualityTodayInfo.grade,
      'date': airQualityTodayInfo.date,
    };
  }
}