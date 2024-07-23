import 'package:fine_dust/data/util/location_convert_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/util/air_quality_util.dart';

final airQualityUtilProvider = Provider<AirQualityUtil>((ref) {
  return AirQualityUtil.instance;
});

final locationConvertUtilProvider = Provider<LocationConvertUtil>((ref) {
  return LocationConvertUtil.instance;
});