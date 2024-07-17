import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/util/air_quality_util.dart';

final airQualityUtilProvider = Provider<AirQualityUtil>((ref) {
  return AirQualityUtil.instance;
});