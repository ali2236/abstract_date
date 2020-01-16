
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
    var converted = date.to<GregorianDate>();
    print(converted);

    date = converted.to<Shamsi>();
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
