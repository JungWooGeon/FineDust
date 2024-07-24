// 파일: lib/providers/dio_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/service/dio_client.dart';
import 'api_url_provider.dart';

final airQualityTodayDioClientProvider = Provider<DioClient>((ref) {
  final apiUrl = ref.watch(airQualityTodayUrlProvider);
  return DioClient(apiUrl, "");
});

final airQualityForecastDioClientProvider = Provider<DioClient>((ref) {
  final apiUrl = ref.watch(airQualityForecastsUrlProvider);
  return DioClient(apiUrl, "");
});

final weatherForecastsDioClientProvider = Provider<DioClient>((ref) {
  final apiUrl = ref.watch(weatherForecastsUrlProvider);
  final serviceKey = ref.watch(serviceKeyProvider);

  return DioClient(apiUrl, serviceKey);
});