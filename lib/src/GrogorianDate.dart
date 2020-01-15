import 'package:abstarct_date/src/date_adapter.dart';

import 'date.dart';

class GregorianDate extends DateAdapter {
  @override
  AbstractDate fromDateTime(DateTime dateTime) {
    return Date<GregorianDate>(dateTime.year, dateTime.month, dateTime.day);
  }

  @override
  DateTime toDateTime(AbstractDate date) {
    return DateTime(date.year, date.month, date.day);
  }
}
