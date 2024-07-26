import 'package:fine_dust/data/facade/date_time_facade_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/facade/date_time_facade.dart';

final dateTimeFacadeProvider = Provider<DateTimeFacade>((ref) {
  return DateTimeFacadeImpl();
});