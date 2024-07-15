import '../../domain/entity/air_quality_today_info.dart';

class AirQualityTodayInfoMapper {
  static AirQualityTodayInfo fromJson(Map<String, dynamic> json) {
    return AirQualityTodayInfo(
      region: json['region'] as String,
      pm10Value: json['pm10_value'].toStringAsFixed(2),
      pm10Status: json['pm10_status'] as String,
      pm25Value: json['pm25_value'].toStringAsFixed(2),
      pm25Status: json['pm25_status'] as String,
      lastUpdated: json['last_updated'] as String,
    );
  }

  static Map<String, dynamic> toJson(AirQualityTodayInfo airQualityTodayInfo) {
    return {
      'region': airQualityTodayInfo.region,
      'pm10_value': airQualityTodayInfo.pm10Value,
      'pm10_status': airQualityTodayInfo.pm10Status,
      'pm25_value': airQualityTodayInfo.pm25Value,
      'pm25_status': airQualityTodayInfo.pm25Status,
      'last_updated': airQualityTodayInfo.lastUpdated,
    };
  }
}