import 'package:abstarct_date/abstarct_date.dart';
import 'package:abstarct_date/src/month.dart';
import 'package:abstarct_date/src/week.dart';
import 'package:abstarct_date/src/year.dart';

import 'date_formatter.dart';
import 'abstract_date.dart';
import 'date_adapter.dart';
import 'formatted_date.dart';

class Date<T extends DateAdapter> extends AbstractDate<T> {
  static final Map<Type, DateAdapter> _adapters = {
    GregorianDate: GregorianDate(),
    ShamsiDate: ShamsiDate(),
    HijriDate: HijriDate(),
  };

  ///
  /// used to add new [DateAdapter]s to [Date]
  ///
  static void addType<A extends DateAdapter>(DateAdapter dateAdapter) {
    _adapters.putIfAbsent(A, () => dateAdapter);
  }

  ///
  /// returns the adapter registered under the [A] type
  ///
  /// if their are no adapters registered, it will register the default adapters
  ///
  static DateAdapter getAdapterOfType<A extends DateAdapter>() {
    if(_adapters.isEmpty){
      _adapters.addAll({
        GregorianDate: GregorianDate(),
        ShamsiDate: ShamsiDate(),
        HijriDate: HijriDate(),
      });
    }
    return _adapters[A];
  }

  ///
  /// removes the adapter registered under the [A] type
  ///
  static void removeType<A extends DateAdapter>() {
    _adapters.remove(A);
  }

  ///
  /// moves an adapter from being registered under the [OLD] type
  /// to the [NEW] type
  ///
  static void renameType<OLD extends DateAdapter, NEW extends DateAdapter>() {
    addType<NEW>(_adapters[OLD]);
    removeType<OLD>();
  }

  ///
  /// removes all registered types
  ///
  static void clearTypes() {
    _adapters.clear();
  }

  //////////////////////////////////////////////////////////////////////////////

  ///
  /// constructs a [Date] with type of [T]
  ///
  /// type [T] must be registered.
  ///
  Date(int year, [int month = 1, int day = 1]) : super(year, month, day);

  ///
  /// creates a new [Date] with the current date converted to date type of [T]
  ///
  factory Date.now() => getAdapterOfType<T>().fromDateTime(DateTime.now());

  ///
  /// creates a new [Date] from a [DateTime] converted to DateType of [T]
  ///
  factory Date.fromDateTime(DateTime dt) =>
      getAdapterOfType<T>().fromDateTime(dt);

  ///
  /// constructs a new [Date] from another instance of an [AbstractDate]
  ///
  /// this simply copies the numbers from the [AbstractDate] instance.
  /// you should be careful when using this factory as it is not Type checked.
  ///
  factory Date.fromAbstractDate(AbstractDate abstractDate) =>
      Date(abstractDate.year, abstractDate.month, abstractDate.day);

  ///
  /// returns the [DateAdapter] that is used for this date.
  ///
  DateAdapter get adapter => getAdapterOfType<T>();

  ///
  /// returns the [DateAdapter] as a [DateFormatter]
  /// if it implements the [DateFormatter] mixin.
  ///
  /// if the [DateAdapter] does not implement [DateFormatter] then an exception will be thrown.
  ///
  DateFormatter get formatter => adapter is DateFormatter
      ? adapter as DateFormatter
      : throw 'no date formatter found!';

  ///
  /// converts the [Date] of type [T] to a dart [DateTime]
  ///
  DateTime get dateTime => adapter.toDateTime(this);

  ///
  /// gives the weekDay from dart's [DateTime]
  ///
  /// for example if it is Monday
  /// then calling this will return [DateTime.monday]
  ///
  int get weekDay => dateTime.weekday;

  ///
  /// normalized week day
  /// where first weekDay is 1
  /// and last week day is 7
  ///
  int get nWeekDay => Week.normalizeWeekDay(weekDay, adapter.firstDayOfTheWeek);

  ///
  /// return the month length based on [year] and [month]
  /// using the dates [adapter]
  ///
  int get monthLength => adapter.monthLength(year, month);

  ///
  /// returns true if type of this [Date] is [A]
  ///
  bool isTypeOf<A extends DateAdapter>() => A == T;

  ///
  /// converts this [Date] of Type [T] to a new [Date] of type [A]
  ///
  /// Type [A] must be registered, otherwise it will throw an exception.
  ///
  Date<A> to<A extends DateAdapter>() => _adapters[A].fromDateTime(dateTime);
  @Deprecated('use [to] inestead') Date<A> as<A extends DateAdapter>() => to<A>();

  ///
  /// added a the number of days of the [Duration] to a new [Date]
  ///
  Date<T> add(int days) {
    if (days == 0) return copy();
    var hours = 0;//days > 0 ? 1 : -1;
    return adapter
        .fromDateTime(dateTime.add(Duration(days: days, hours: hours)));
  }

  ///
  /// the difference between two [Date]s as a duration.
  ///
  /// difference is a multiple of days(k * 24h).
  ///
  Duration difference(Date other) => dateTime.difference(other.dateTime);

  ///
  /// creates a new [Date] but with the optional parameter overrides.
  ///
  Date<T> copy({int year, int month, int day}) =>
      Date<T>(year ?? this.year, month ?? this.month, day ?? this.day);

  ///
  /// returns the month name that is specified in the [DateAdapter]'s [DateFormatter].
  ///
  /// calling this will throw an exception,
  /// if the [DateAdapter] doesn't have the [DateFormatter] mixin.
  ///
  String get monthName => formatter.monthName(month);

  ///
  /// returns the weekday name that is specified in the [DateAdapter]'s [DateFormatter].
  ///
  /// calling this will throw an exception,
  /// if the [DateAdapter] doesn't have the [DateFormatter] mixin.
  ///
  String get weekDayName => formatter.weekDayName(weekDay);

  ///
  /// returns a new instance of [FormattedDate] for the [Date]
  /// that can be helpful for making formatted dates.
  ///
  ///
  FormattedDate get formatted => FormattedDate(this);

  ///
  /// the day after this date
  ///
  Date get tomorrow => add(1);

  ///
  /// the day before this date
  ///
  Date get yesterday => add(-1);

  ///
  /// the week containing this date
  ///
  Week get week => Week(this);

  ///
  /// the month containing this date
  ///
  Month getMonth() => Month(this);

  ///
  /// the Year containing this date
  ///
  Year getYear() => Year(this);

  ///
  /// creates a formatted string with the help of a [FormattedDate] and a builder function.
  ///
  String formatBuilder(String Function(FormattedDate d) builder) =>
      builder(formatted);

  @override
  String toString() => '$T: ' + super.toString();

  bool operator <(other){
    if(other is! Date) return false;
    var d = (other as Date).dateTime;
    return dateTime.compareTo(d) < 0;
  }

  bool operator <=(other){
    if(other is! Date) return false;
    var d = (other as Date).dateTime;
    return dateTime.compareTo(d) <= 0;
  }

  bool operator >(other){
    if(other is! Date) return false;
    var d = (other as Date).dateTime;
    return dateTime.compareTo(d) > 0;
  }

  bool operator >=(other){
    if(other is! Date) return false;
    var d = (other as Date).dateTime;
    return dateTime.compareTo(d) >= 0;
  }
}
