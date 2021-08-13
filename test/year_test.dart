import 'package:abstract_date/abstract_date.dart';
import 'package:shamsi_date/shamsi_date.dart' hide Date;
import 'package:test/test.dart';

void main() {
  test('year tests', () {
    var date = Date<ShamsiDate>(1395);

    var leap = Jalali.fromDateTime(date.dateTime).isLeapYear();
  });
}
