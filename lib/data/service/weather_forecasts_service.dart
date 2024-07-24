import 'dio_client.dart';

class WeatherForecastsService {
  final DioClient dioClient;

  WeatherForecastsService(this.dioClient);

  // 단기 예보 조회
  Future<dynamic> getWeatherForecastsShortTerm(String baseDateTime, String nx, String ny) async {
    final response = await dioClient.getWeatherShortTerm('/VilageFcstInfoService_2.0/getVilageFcst', baseDateTime, nx, ny);
    return response;
  }

  // 중기 육상 예보 조회
  Future<List<Map<String, dynamic>>> getWeatherLandForecastsMidTerm() async {
    final response = await dioClient.get('/MidFcstInfoService/getMidLandFcst');
    return (response).cast<Map<String, dynamic>>();
  }

  // 중기 기온 조회
  Future<List<Map<String, dynamic>>> getWeatherTempForecastsMidTerm() async {
    final response = await dioClient.get('/MidFcstInfoService/getMidTa');
    return (response).cast<Map<String, dynamic>>();
  }
}