# abstract_date

```dart
// registering the date systems that we want to use.
// if you don't register any adapters then 
// the default adapters are going to get registered automatically.
    Date.addType<ShamsiDate>(ShamsiDate());
    Date.addType<GregorianDate>(GregorianDate());

// Creating a new date
    var date = Date<ShamsiDate>(1379,6,26);

// Converting dates
    var converted = date.to<GregorianDate>();
    date = converted.to<Shamsi>();

// Type checking
    if(date.isTypeOf<ShamsiDate>()){
      print('its shamsi!');
    }
    
// Other utility methods
    var tomorrow = date.add(Duration(days: 1));
    
    Duration d = date.difference(tomorrow);
  
    var realTomorrow = date.copy(
      day: date.day + 1,
    );
```

# Date adapters

### Adding Adapters:
Before using `Date` you should register the types you want to use.
```dart
    Date.addType<ShamsiDate>(ShamsiDate());
    Date.addType<GregorianDate>(GregorianDate());
```

### Setting a default adapter
For setting an adapter as default, just register it with no generic type.
```dart
    Date.addType(ShamsiDate());
    ...
    // no generic type is used
    var defaultDate = Date.now(); 
```

### Implementing a new Date adapter
```dart
class NewDateSystem extends DateAdapter with DateFormatter {
  ...
}
```

If you don't add the `DateFormatter` mixin, some methods on date will throw an exception:
1. `formatter`  
1. `monthName`  
1. `weekDayName`  
1. `formatted`*  
1. `formatBuilder`*

\*: these might not throw exception if you don't use named parts.


### Renaming Adapters
If you don't like the name of a certain adapter, just extend it and register with the new class:
```dart
class Hijri extends IslamicDate {}
...
Date.addType<Hijri>(Hijri());
```

### DateAdapter provided implementations

1. GregorianDate
2. HijriDate
3. ShamsiDate

To use them, import abstract_date and
 then register them using 
 `Date.addType<T extends DateAdapter>()` before using them. 