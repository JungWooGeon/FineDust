import 'package:fine_dust/domain/entity/weather_forecasts_short_term_info.dart';

class WeatherForecastsShortTermInfoMapper {
  static WeatherForecastsShortTermInfo fromJson(dynamic json) {
    final weatherForecastShortTermInfo = WeatherForecastsShortTermInfo({});

    final itemList = json['response']['body']['items']['item'];
    itemList.forEach((item) {
      weatherForecastShortTermInfo.addForecast(item['category'], item['fcstDate'], item['fcstTime'], item['fcstValue']);
    });

    return weatherForecastShortTermInfo;
  }
}