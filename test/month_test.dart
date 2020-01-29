import 'package:abstarct_date/abstarct_date.dart';
import 'package:test/test.dart';

void main(){

  test('month test', (){

    var date = Date<ShamsiDate>(1398,11,9);

    var month = date.getMonth();

    expect(month.length, equals(30));

    expect(month.numberOfWeeks, equals(5));

    expect(month.nextMonth.nextMonth.numberOfWeeks, equals(6));
  });

}