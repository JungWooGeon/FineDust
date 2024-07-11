import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/service/weather_service.dart';
import 'dio_client_provider.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return WeatherService(dioClient);
});