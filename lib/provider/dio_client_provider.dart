// 파일: lib/providers/dio_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/service/dio_client.dart';
import 'api_url_provider.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  final apiUrl = ref.watch(apiUrlProvider);
  return DioClient(apiUrl);
});
