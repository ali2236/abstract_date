import 'package:abstarct_date/src/date_formatter.dart';

import '../abstract_date.dart';
import '../date.dart';
import '../date_adapter.dart';

import '../external/shamsi_date/shamsi_date.dart' as shamsi;

class ShamsiDate extends DateAdapter with DateFormatter {
  @override
  int get firstDayOfTheWeek => DateTime.saturday;

  @override
  AbstractDate fromDateTime(DateTime dateTime) {
    var pd = shamsi.Jalali.fromDateTime(dateTime);
    return Date<ShamsiDate>(pd.year, pd.month, pd.day);
  }

  @override
  DateTime toDateTime(AbstractDate date) {
    var pd = shamsi.Jalali(date.year, date.month, date.day);
    return pd.toDateTime();
  }

  @override
  int monthLength(int year, int month) {
    var pd = shamsi.Jalali(year, month);
    return pd.monthLength;
  }

  @override
  String monthName(int month) {
    assert(month > 0 && month < 13);
    const names = ['فروردین', 'اردیبهشت', 'خرداد', 'تیر', 'مرداد', 'شهریور', 'مهر', 'آبان', 'آذر', 'دی', 'بهمن', 'اسفند'];
    return names[month-1];
  }

  @override
  String weekDayName(int weekDay) {
    const names =['شنبه', 'یک شنبه', 'دو شنبه', 'سه شنبه', 'چهار شنبه', 'پنج شنبه', 'جمعه'];
    if(weekDay >= DateTime.saturday){
      return names[weekDay-6];
    } else {
      return names[weekDay+1];
    }
  }
}

class PersianDate extends ShamsiDate {}

class JalaliDate extends ShamsiDate {}

class Jalali extends ShamsiDate {}

class Shamsi extends ShamsiDate {}

class SolarDate extends ShamsiDate {}
