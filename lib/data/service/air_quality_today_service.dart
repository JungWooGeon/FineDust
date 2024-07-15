import 'dio_client.dart';

class AirQualityTodayService {
  final DioClient dioClient;

  AirQualityTodayService(this.dioClient);

  Future<List<Map<String, dynamic>>> getAirQualityToday() async {
    final response = await dioClient.get('/air_quality_today');
    return (response).cast<Map<String, dynamic>>();
  }
}