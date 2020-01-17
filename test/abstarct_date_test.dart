import 'package:abstarct_date/src/GrogorianDate.dart';
import 'package:abstarct_date/src/ShamsiDate.dart';
import 'package:abstarct_date/src/date.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {


    setUp((){
      Date.addType<ShamsiDate>(ShamsiDate());
      Date.addType<GregorianDate>(GregorianDate());
    });

    test('First Test', () {
      var date = Date<ShamsiDate>(1379,6,26);
      print(date.toString());

      var converted = date.as<GregorianDate>();
      print(converted);

      date = converted.as<Shamsi>();
      print(date);

      print(Date.now<GregorianDate>().weekDay);

      if(date.isTypeOf<ShamsiDate>()){
        print('its shamsi!');
      }
    });


  });
}
