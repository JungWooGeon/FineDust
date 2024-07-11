import 'dio_client.dart';

class WeatherService {
  final DioClient dioClient;

  WeatherService(this.dioClient);

  Future<List<Map<String, dynamic>>> getWeatherInfo() async {
    final response = await dioClient.get('/weather');
    return (response).cast<Map<String, dynamic>>();
  }
}