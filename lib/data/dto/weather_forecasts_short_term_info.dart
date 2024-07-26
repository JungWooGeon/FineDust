class WeatherForecastsShortTermInfo {
  Map<String, Map<String, Map<String, String>>> forecasts;

  WeatherForecastsShortTermInfo(this.forecasts);

  // 예보 데이터 추가
  void addForecast(String category, String fcstDate, String fcstTime, String fcstValue) {
    // POP : 강수 확률
    // PTY : 강수 형태
    // TMP : 1시간 기온
    // TMN : 최저 기온
    // TMX : 최고 기온
    // fcstDate : 예상 날짜
    // fcstTime : 예상 시간
    // fcstValue : 예상 값

    if (!forecasts.containsKey(fcstDate)) {
      forecasts[fcstDate] = {};
    }

    if (!forecasts[fcstDate]!.containsKey(fcstTime)) {
      forecasts[fcstDate]![fcstTime] = {};
    }

    forecasts[fcstDate]?[fcstTime]?[category] = fcstValue;
  }
}