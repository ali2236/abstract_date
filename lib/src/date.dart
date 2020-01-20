import 'date_formatter.dart';
import 'abstract_date.dart';
import 'date_adapter.dart';
import 'formatted_date.dart';

class Date<T extends DateAdapter> extends AbstractDate<T> {
  static final Map<Type, DateAdapter> _adapters = {};

  static void addType<A extends DateAdapter>(DateAdapter dateAdapter) {
    _adapters.putIfAbsent(A, () => dateAdapter);
  }

  //////////////////////////////////////////////////////////////////////////////

  Date(int year, [int month = 1, int day = 1]) : super(year, month, day);

  factory Date.now() => _adapters[T].fromDateTime(DateTime.now());

  factory Date.fromDateTime(DateTime dt) => _adapters[T].fromDateTime(dt);

  DateAdapter get adapter => _adapters[T];

  DateFormatter get formatter => adapter is DateFormatter
      ? adapter as DateFormatter
      : throw 'no date formatter found!';

  DateTime get dateTime => adapter.toDateTime(this);

  int get weekDay => dateTime.weekday;

  int get monthLength => adapter.monthLength(year, month);

  bool isTypeOf<A extends DateAdapter>() => A == T;

  Date<A> as<A extends DateAdapter>() => _adapters[A].fromDateTime(dateTime);

  Date<T> add(Duration duration) =>
      adapter.fromDateTime(dateTime.add(duration));

  Duration difference(Date other) => dateTime.difference(other.dateTime);

  Date<T> copy({int year, int month, int day}) =>
      Date<T>(year ?? this.year, month ?? this.month, day ?? this.day);

  String get monthName => formatter.monthName(month);

  String get weekDayName => formatter.weekDayName(weekDay);

  FormattedDate get formatted => FormattedDate(this);

  String formatBuilder(String Function(FormattedDate d) builder) =>
      builder(formatted);

  String toString() => '$T: ' + super.toString();
}
