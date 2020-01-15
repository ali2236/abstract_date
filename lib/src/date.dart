import 'package:abstarct_date/abstarct_date.dart';

class Date<T extends DateAdapter> extends AbstractDate{

  static final Map<Type, DateAdapter> _adapters = {};

  static void addType<A extends DateAdapter>(DateAdapter dateAdapter) {
    _adapters.putIfAbsent(A, () => dateAdapter);
  }

  static Date<A> now<A extends DateAdapter>() {
    return _adapters[A].fromDateTime(DateTime.now());
  }

  //////////////////////////////////////////////////////////////////////////////

  Date(int year, int month, int day) : super(year, month, day);

  factory Date.fromDateTime(DateTime dateTime){
    return _adapters[T].fromDateTime(dateTime);
  }

  DateTime get dateTime => _adapters[T].toDateTime(this);

  int get weekDay => dateTime.weekday;

  Date<A> to<A extends DateAdapter>() {
    return _adapters[A].fromDateTime(dateTime);
  }

  @override
  String toString() {
    return '$T: ' + super.toString();
  }
}
