
import 'package:abstarct_date/src/abstract_date.dart';
import 'package:abstarct_date/src/date.dart';
import 'package:abstarct_date/src/date_adapter.dart';

import 'package:libcalendar/libcalendar.dart' as lib;
import 'package:hijri/umm_alqura_calendar.dart' as cal;

class HijriDate extends DateAdapter {

  @override
  AbstractDate fromDateTime(DateTime dateTime) {
    var hd = lib.fromGregorianToIslamic(dateTime.year, dateTime.month, dateTime.day);
    return Date<HijriDate>(hd.year, hd.month, hd.day);
  }

  @override
  DateTime toDateTime(AbstractDate date) {
    return lib.fromIslamicToGregorian(date.year, date.month, date.day);
  }


  @override
  int monthLength(int year, int month) {
    var hijri = cal.ummAlquraCalendar();
    hijri
    ..hYear = year
    ..hMonth = month
    ..hDay = 1;

    return hijri.lengthOfMonth;
  }
}