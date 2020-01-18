import '../abstract_date.dart';
import '../date.dart';
import '../date_adapter.dart';

class ShamsiDate extends DateAdapter {

  static const monthsLength = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];

  static const kabiseMonthsLength = [0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335];

  @override
  AbstractDate fromDateTime(DateTime dateTime) {
    int year,month,day,ld;
    var gregorianYear = dateTime.year;
    if ((gregorianYear % 4) != 0) {
      day = monthsLength[dateTime.month - 1] + dateTime.day;

      if (day > 79) {
        day = day - 79;
        if (day <= 186) {
          switch (day % 31) {
            case 0:
              month = day ~/ 31;
              day = 31;
              break;
            default:
              month = (day ~/ 31) + 1;
              day = (day % 31);
              break;
          }
          year = gregorianYear - 621;
        } else {
          day = day - 186;

          switch (day % 30) {
            case 0:
              month = (day ~/ 30) + 6;
              day = 30;
              break;
            default:
              month = (day ~/ 30) + 7;
              day = (day % 30);
              break;
          }
          year = gregorianYear - 621;
        }
      } else {
        if ((gregorianYear > 1996) && (gregorianYear % 4) == 1) {
          ld = 11;
        } else {
          ld = 10;
        }
        day = day + ld;

        switch (day % 30) {
          case 0:
            month = (day ~/ 30) + 9;
            day = 30;
            break;
          default:
            month = (day ~/ 30) + 10;
            day = (day % 30);
            break;
        }
        year = gregorianYear - 622;
      }
    } else {
      day = kabiseMonthsLength[dateTime.month - 1] + dateTime.day;

      if (gregorianYear >= 1996) {
        ld = 79;
      } else {
        ld = 80;
      }
      if (day > ld) {
        day = day - ld;

        if (day <= 186) {
          switch (day % 31) {
            case 0:
              month = (day ~/ 31);
              day = 31;
              break;
            default:
              month = (day ~/ 31) + 1;
              day = (day % 31);
              break;
          }
          year = gregorianYear - 621;
        } else {
          day = day - 186;

          switch (day % 30) {
            case 0:
              month = (day ~/ 30) + 6;
              day = 30;
              break;
            default:
              month = (day ~/ 30) + 7;
              day = (day % 30);
              break;
          }
          year = gregorianYear - 621;
        }
      } else {
        day = day + 10;

        switch (day % 30) {
          case 0:
            month = (day ~/ 30) + 9;
            day = 30;
            break;
          default:
            month = (day ~/ 30) + 10;
            day = (day % 30);
            break;
        }
        year = gregorianYear - 622;
      }
    }

    return Date<ShamsiDate>(year, month, day);
  }

  @override
  DateTime toDateTime(AbstractDate date) {
    throw UnimplementedError();
  }

  @override
  int monthLength(int year, int month) {
    return 30;
  }
}

class PersianDate extends ShamsiDate {}

class JalaliDate extends ShamsiDate {}

class Jalali extends ShamsiDate {}

class Shamsi extends ShamsiDate {}