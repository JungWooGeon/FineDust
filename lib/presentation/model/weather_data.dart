import 'package:fine_dust/domain/entity/forecast_date.dart';

class WeatherData {
  // 일주일 상태 [날씨, 최저 기온, 최고 기온, 강수 확률]
  final List<Map<String, String>> weekForecasts;

  // 24시간 상태 [날씨, 기온, 강수 확률]
  final List<ForecastDate> forecastDate;

  WeatherData(this.weekForecasts, this.forecastDate);
}