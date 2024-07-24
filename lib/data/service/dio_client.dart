import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
  final String _serviceKey;

  DioClient(String baseUrl, this._serviceKey)
      : _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<List<dynamic>> get(String path) async {
    final response = await _dio.get(path);
    return response.data;
  }

  Future<dynamic> getWeatherShortTerm(String path, String baseDate, String nx, String ny) async {
    final response = await _dio.get(path, queryParameters: {
      'serviceKey': _serviceKey,
      'pageNo': '1',
      'numOfRows': '1000',
      'dataType': 'JSON',
      'base_date': baseDate,
      'base_time': '0500',
      'nx': nx,
      'ny': ny
    });

    return response.data;
  }
}
