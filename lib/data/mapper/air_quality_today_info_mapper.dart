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
      so2Value: json['so2Value'].toStringAsFixed(2),
      coValue: json['coValue'].toStringAsFixed(2),
      o3Value: json['o3Value'].toStringAsFixed(2),
      no2Value: json['no2Value'].toStringAsFixed(2)
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
      'so2Value': airQualityTodayInfo.so2Value,
      'coValue': airQualityTodayInfo.coValue,
      'o3Value': airQualityTodayInfo.o3Value,
      'no2Value': airQualityTodayInfo.no2Value
    };
  }
}