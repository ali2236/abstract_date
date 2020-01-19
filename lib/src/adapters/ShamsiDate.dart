import '../abstract_date.dart';
import '../date.dart';
import '../date_adapter.dart';

import '../external/shamsi_date/shamsi_date.dart' as shamsi;

class ShamsiDate extends DateAdapter {

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
}

class PersianDate extends ShamsiDate {}

class JalaliDate extends ShamsiDate {}

class Jalali extends ShamsiDate {}

class Shamsi extends ShamsiDate {}

class SolarDate extends ShamsiDate {}