
Adding Adapters:
```dart
    Date.addType<ShamsiDate>(ShamsiDate());
    Date.addType<GregorianDate>(GregorianDate());
```

Constructor:
```dart
    var date = Date<ShamsiDate>(1379,6,26);
    print(date.toString());
```

Date Converter:
```dart
    var converted = date.as<GregorianDate>();
    print(converted);

    date = converted.as<Shamsi>();
    print(date);

```

Week day getter:

```dart
    print(Date.now<GregorianDate>().weekDay);
```

Type checker:

```dart
    if(date.isTypeOf<ShamsiDate>()){
      print('its shamsi!');
    }
```

Utility methods:
```dart
    var tomorrow = date.add(Duration(days: 1));

    Duration d = date.difference(tomorrow);
    
    var realTomorrow = date.copy(
      day: date.day + 1,
    );
```