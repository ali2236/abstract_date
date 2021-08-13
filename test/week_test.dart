import 'package:abstract_date/abstract_date.dart';
import 'package:test/test.dart';

void main() {
  test('week test', () {
    var date = Date<ShamsiDate>(1398, 11, 9);

    var week = date.week;

    expect(week.firstDayOfTheWeek, equals(date.copy(day: 5)));

    expect(week.lastDayOfTheWeek, equals(date.copy(day: 11)));

    expect(week.lastWeek.toString(), equals(Week(date.add(-7)).toString()));

    expect(week.nextWeek.toString(), equals(Week(date.add(7)).toString()));

    expect(week.days.first, equals(week.firstDayOfTheWeek));

    expect(week.days.last, equals(week.lastDayOfTheWeek));

    expect(week.weekInMonth, equals(2));
  });
}
