import 'package:fine_dust/data/util/date_time_util.dart';
import 'package:fine_dust/data/util/location_convert_util.dart';
import 'package:fine_dust/provider/facade_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/util/air_quality_util.dart';

final airQualityUtilProvider = Provider<AirQualityUtil>((ref) {
  return AirQualityUtil.instance;
});

final locationConvertUtilProvider = Provider<LocationConvertUtil>((ref) {
  return LocationConvertUtil.instance;
});

final dateTimeUtilProvider = Provider<DateTimeUtil>((ref) {
  final dateTimeFacade = ref.watch(dateTimeFacadeProvider);
  return DateTimeUtil(dateTimeFacade);
});