import 'package:fine_dust/data/facade/date_time_facade.dart';
import 'package:intl/src/intl/date_format.dart';

class DateTimeService {

  final DateTimeFacade dateTimeFacade;

  DateTimeService(this.dateTimeFacade);

  String getCurrentDateTimeFormatted(String pattern) {
    DateTime now = dateTimeFacade.getNow();
    DateFormat formatter = dateTimeFacade.format(pattern);
    return formatter.format(now);
  }

  String getUpdateTimeFromCurrentTime() {
    DateTime now = dateTimeFacade.getNow();
    DateTime todayFiveAM = dateTimeFacade.getTodayFiveAM();
    DateFormat formatter = dateTimeFacade.format('yyyy-MM-dd HH:mm:ss');

    if (now.isBefore(todayFiveAM)) {
      return formatter.format(todayFiveAM.subtract(dateTimeFacade.getOneDayDuration()));
    }
    return formatter.format(todayFiveAM);
  }
}