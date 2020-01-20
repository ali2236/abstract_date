import 'package:abstarct_date/abstarct_date.dart';

void main() {
  Date.addType<ShamsiDate>(ShamsiDate());
  Date.addType<GregorianDate>(GregorianDate());

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

  var formatted = date.formatBuilder((f) {
    return '${f.yyyy} ${f.MMMM} ${f.dd}, ${f.DDDD}';
  });

  print(formatted);
}
