import 'package:abstarct_date/abstarct_date.dart';
import 'package:abstarct_date/src/external/shamsi_date/src/jalali/jalali_date.dart';
import 'package:test/test.dart';

void main() {
  test('year tests', () {
    var date = Date<ShamsiDate>(1395);

    var leap = Jalali.fromDateTime(date.dateTime).isLeapYear();
  });
}
