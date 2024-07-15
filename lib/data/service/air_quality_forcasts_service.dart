import 'dio_client.dart';

class AirQualityForecastsService {
  final DioClient dioClient;

  AirQualityForecastsService(this.dioClient);

  Future<List<Map<String, dynamic>>> getAirQualityForecasts() async {
    final response = await dioClient.get('/air_quality_forecasts');
    return (response).cast<Map<String, dynamic>>();
  }
}