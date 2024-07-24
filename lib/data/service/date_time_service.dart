import 'package:intl/intl.dart';

class DateTimeService {
  String getCurrentDateFormatted() {
    DateTime now = DateTime.now();
    return DateFormat('yyyyMMdd').format(now);
  }
}