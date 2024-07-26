import '../../domain/entity/forecast_date.dart';

class DatabaseMapper {
  static List<ForecastDate> mapForecastShortTermToDbFormat(Map<String, Map<String, Map<String, String>>> forecastData) {
    List<ForecastDate> dates = [];

    forecastData.forEach((date, times) {
      times.forEach((time, details) {
        dates.add(ForecastDate(date, time, details['TMP']!, getWeather(details)));
      });
    });

    return dates;
  }

  static String getWeather(Map<String, String> details) {
    var weather = '';
    switch(details['PTY']) {
      case '0':
      // 없음 - 맑음 / 구름많음 / 흐림
        weather = getSky(details['SKY']!);
        break;
      case '1':
      // 비
        weather = '비';
        break;
      case '2':
      // 비/눈
        weather = '비/눈';
        break;
      case '3':
      // 눈
        weather = '눈';
        break;
      case '4':
      // 소나기
        weather = '비';
        break;
      default:
        weather = '맑음';
        break;
    }

    return weather;
  }

  static String getSky(String sky) {
    switch(sky) {
      case '1':
        return '맑음';
      case '3':
        return '구름많음';
      case '4':
        return '흐림';
      default:
        return '맑음';
    }
  }
}