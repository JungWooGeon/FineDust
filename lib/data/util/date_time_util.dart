import 'package:intl/intl.dart';

import '../facade/date_time_facade.dart';

class DateTimeUtil {

  final DateTimeFacade dateTimeFacade;

  DateTimeUtil(this.dateTimeFacade);

  // 두 날짜를 비교
  bool isFirstDateEarlier(String date1, String date2) {
    DateTime dateTime1 = dateTimeFacade.parse(date1);
    DateTime dateTime2 = dateTimeFacade.parse(date2);
    return dateTime1.isBefore(dateTime2);
  }
}
