import 'package:abstarct_date/abstarct_date.dart';
import 'package:libcalendar/libcalendar.dart' as lib;
import 'package:hijri/umm_alqura_calendar.dart' as cal;

class HijriDate extends DateAdapter with DateFormatter {
  @override
  String get id => 'HijriDate';

  @override
  int get firstDayOfTheWeek => DateTime.saturday;

  @override
  AbstractDate fromDateTime(DateTime dateTime) {
    var hd =
        lib.fromGregorianToIslamic(dateTime.year, dateTime.month, dateTime.day);
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

  @override
  String monthName(int month) {
    const names = [
      'محرم',
      'صفر',
      'ربيع الاول',
      'ربيع الثاني',
      'جمادى الأول',
      'جمادى الثاني',
      'رجب',
      'شعبان',
      'رمضان',
      'شوال',
      'ذو القعدة',
      'ذو الحجة'
    ];
    return names[month - 1];
  }

  @override
  String weekDayName(int weekDay) {
    const names = [
      'السبت',
      'الأحد',
      'الإثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة'
    ];
    if (weekDay >= DateTime.saturday) {
      return names[weekDay - 6];
    } else {
      return names[weekDay + 1];
    }
  }
}
