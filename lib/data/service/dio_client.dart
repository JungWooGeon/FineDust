import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(String baseUrl)
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
}
