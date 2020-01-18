import 'package:abstarct_date/src/date_adapter.dart';

import '../abstract_date.dart';
import '../date.dart';

class GregorianDate extends DateAdapter {
  @override
  AbstractDate fromDateTime(DateTime dateTime) {
    return Date<GregorianDate>(dateTime.year, dateTime.month, dateTime.day);
  }

  @override
  DateTime toDateTime(AbstractDate date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  int monthLength(int year, int month) {
    return DateTime(year,month).difference(DateTime(year,month+1,0)).inDays;
  }
}

class MiladiDate extends GregorianDate {}

class Miladi extends GregorianDate {}
