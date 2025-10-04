import '../abstract_date.dart';
import '../date.dart';
import '../dateAdapter/date_adapter.dart';
import '../dateAdapter/date_formatter.dart';
import '../dateAdapter/efficient_leap_year.dart';
import 'package:shamsi_date/shamsi_date.dart' as shamsi;

class ShamsiDate extends DateAdapter with DateFormatter, EfficientLeapYear {
  @override
  String get id => 'ShamsiDate';

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
  bool isLeapYear(int year) {
    return shamsi.Jalali(year).isLeapYear();
  }

  @override
  String monthName(int month) {
    assert(month > 0 && month < 13);
    const names = [
      'فروردین',
      'اردیبهشت',
      'خرداد',
      'تیر',
      'مرداد',
      'شهریور',
      'مهر',
      'آبان',
      'آذر',
      'دی',
      'بهمن',
      'اسفند'
    ];
    return names[month - 1];
  }

  @override
  String weekDayName(int weekDay) {
    const names = [
      'شنبه',
      'یک‌شنبه',
      'دو‌شنبه',
      'سه‌شنبه',
      'چهار‌شنبه',
      'پنج‌شنبه',
      'جمعه'
    ];
    if (weekDay >= DateTime.saturday) {
      return names[weekDay - 6];
    } else {
      return names[weekDay + 1];
    }
  }
}
