import 'package:abstract_date/abstract_date.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      Date.addType(HijriDate());
      Date.addType<ShamsiDate>(ShamsiDate());
      Date.addType<GregorianDate>(GregorianDate());
    });

    test('First Test', () {
      var defaultDate = Date.now();
      print(defaultDate);

      var date = Date<ShamsiDate>(1379, 6, 26);
      print(date.toString());

      var converted = date.as<GregorianDate>();
      print(converted);

      date = converted.as<ShamsiDate>();
      print(date);

      print(Date<GregorianDate>.now().weekDay);

      if (date.isTypeOf<ShamsiDate>()) {
        print('its shamsi!');
      }

/*      print(date.week.month);
      print(date.week.month.lastMonth);
      print(date.week.month.nextMonth);

      date = Date<ShamsiDate>.now();

      print(date.week.firstDayOfTheWeek);
      print(date.week.lastDayOfTheWeek);*/

      date = Date<ShamsiDate>.now();
      for (var day in date.week.days) {
        print(day);
      }

      var formatted = date.formatBuilder((f) {
        return '${f.yyyy} ${f.MMMM} ${f.dd}, ${f.DDDD}';
      });

      print(formatted);
      // 1379 شهریور 26, شنبه
    });
  });
}
