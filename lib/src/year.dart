import 'package:abstarct_date/abstarct_date.dart';

class Year {
  final Date referenceDate;

  Year(this.referenceDate);

  ///
  /// The year after this year
  ///
  Year get nextYear {
    return Year(lastDay.tomorrow);
  }

  ///
  /// The year before this year
  ///
  Year get lastYear {
    return Year(firstDay.yesterday);
  }

  ///
  /// The first month of this year
  ///
  Month get firstMonth {
    return referenceDate.copy(month: 1).getMonth();
  }

  ///
  /// The last month of this year
  ///
  Month get lastMonth {
    return referenceDate.copy(month: 12).getMonth();
  }

  ///
  /// The first week of this year
  ///
  Week get firstWeek {
    return firstMonth.firstWeek;
  }

  ///
  /// The last week of this year
  ///
  Week get lastWeek {
    return lastMonth.lastWeek;
  }

  ///
  /// The first day of this year
  ///
  Date get firstDay {
    return firstMonth.firstDay;
  }

  ///
  /// The last day of this year
  ///
  Date get lastDay {
    return lastMonth.lastDay;
  }

  ///
  /// Number of days in this year
  ///
  int get length {
    return lastDay.difference(firstDay).inDays + 1;
  }

  int get numberOfWeeks {
    return weeks.length;
  }

  ///
  /// Returns true if this year is a leap year.
  /// because not all [DateAdapter]s have the [EfficientLeapYear] mixin
  /// this method has a high chance of throwing an exception.
  ///
  bool get leapYear {
    if(referenceDate.adapter is EfficientLeapYear){
      return (referenceDate.adapter as EfficientLeapYear).isLeapYear(referenceDate.year);
    }
    throw 'Date adapter doesn\'t support leap year';
  }

  ///
  /// Months in this Year
  ///
  Iterable<Month> get months sync* {
    var month = firstMonth;
    for (var i = 0; i < 12; i++) {
      yield month;
      month = month.nextMonth;
    }
  }

  ///
  /// Weeks in this month
  ///
  Iterable<Week> get weeks sync* {
    var w = firstWeek;
    var lw = lastWeek;
    while(w!=lw){
      yield w;
      w = w.nextWeek;
    }
    yield lw;
  }

  ///
  /// Days in this Year
  ///
  Iterable<Date> get days sync* {
    var days = length;
    var day = firstDay;
    for (var i = 0; i < days; i++) {
      yield day;
      day = day.tomorrow;
    }
  }


}
