import 'package:abstarct_date/abstarct_date.dart';

void main() {
  ///
  ///default adapters are added automatically if you don't use [Date.addType]
  ///
  // Date.addType<ShamsiDate>(ShamsiDate());
  // Date.addType<GregorianDate>(GregorianDate());

  var date = Date<ShamsiDate>(1379, 6, 26);
  print(date.toString());

  var miladi = date.to<GregorianDate>();
  print(miladi);

  var hijri = date.to<HijriDate>();
  print(hijri);

  date = miladi.to<ShamsiDate>();
  print(date);

  var nth = Week.normalizeWeekDay(
      Date.getAdapterOfType<ShamsiDate>().firstDayOfTheWeek, DateTime.monday);

  print('Monday is the ${nth}rd day in shamsi calednar');

  if (date.isTypeOf<ShamsiDate>()) {
    print('its shamsi!');
  }

  var formatted = date.formatBuilder((f) {
    return '${f.yyyy} ${f.MMMM} ${f.dd}, ${f.DDDD}';
  });

  print(formatted);
}
