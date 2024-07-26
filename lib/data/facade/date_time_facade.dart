import 'package:intl/intl.dart';

abstract class DateTimeFacade {
  DateTime getNow();
  DateTime getTodayFiveAM();
  Duration getOneDayDuration();
  DateFormat format(String pattern);
  DateTime parse(String dateTimeString);
}
