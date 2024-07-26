import 'package:intl/intl.dart';

import 'date_time_facade.dart';

class DateTimeFacadeImpl implements DateTimeFacade {
  @override
  DateTime getNow() {
    return DateTime.now();
  }

  @override
  DateTime getTodayFiveAM() {
    DateTime now = getNow();
    return DateTime(now.year, now.month, now.day, 5);
  }

  @override
  Duration getOneDayDuration() {
    return const Duration(days: 1);
  }

  @override
  DateFormat format(String pattern) {
    return DateFormat(pattern);
  }

  @override
  DateTime parse(String dateTimeString) {
    return DateTime.parse(dateTimeString);
  }
}
