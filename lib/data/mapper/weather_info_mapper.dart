import '../../domain/entity/weather_info.dart';

class WeatherInfoMapper {
  static WeatherInfo fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      region: json['region'] as String,
      pm10Value: json['pm10_value'].toStringAsFixed(2),
      pm10Status: json['pm10_status'] as String,
      pm25Value: json['pm25_value'].toStringAsFixed(2),
      pm25Status: json['pm25_status'] as String,
      lastUpdated: json['last_updated'] as String,
    );
  }

  static Map<String, dynamic> toJson(WeatherInfo weatherInfo) {
    return {
      'region': weatherInfo.region,
      'pm10_value': weatherInfo.pm10Value,
      'pm10_status': weatherInfo.pm10Status,
      'pm25_value': weatherInfo.pm25Value,
      'pm25_status': weatherInfo.pm25Status,
      'last_updated': weatherInfo.lastUpdated,
    };
  }
}