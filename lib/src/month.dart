import 'package:abstarct_date/src/week.dart';
import 'package:abstarct_date/src/year.dart';
import 'date.dart';

class Month {

  final Date referenceDate;

  Month(this.referenceDate);

  Date get firstDayOfTheMonth {
    return referenceDate.copy(day: 1);
  }

  Date get lastDayOfTheMonth {
    return referenceDate.copy(day: referenceDate.monthLength);
  }

  Month get nextMonth {
    return Month(lastDayOfTheMonth.add(1));
  }

  Month get lastMonth {
    return Month(firstDayOfTheMonth.add( -1));
  }

  Week get firstWeek {
    return Week(firstDayOfTheMonth);
  }

  Week get lastWeek {
    return Week(lastDayOfTheMonth);
  }

  Year get year {
    return Year(referenceDate);
  }

  int get length {
    return referenceDate.monthLength;
  }

  int get numberOfWeeks {
    var baseDays = 7 * 3;
    var fwd = firstDayOfTheMonth.nWeekDay;
    var fwdays = 7 - fwd + 1;
    var ml = length - baseDays - fwdays;
    var weeks = 4 + (ml/7).ceil();
    return weeks;
  }

  Iterable<Week> get weeks sync*{
    var week = firstDayOfTheMonth.week;
    var last = lastDayOfTheMonth.week;
    while(week != last){
      yield week;
      week = week.nextWeek;
    }
    yield last;
  }

  Iterable<Date> get days sync*{
    var day = firstDayOfTheMonth;
    var last = lastDayOfTheMonth;
    while(day != last){
      yield day;
      day = day.tomorrow;
    }
    yield last;
  }

  @override
  String toString() {
    return '${referenceDate.year}/${referenceDate.month}';
  }

}