# calendar_kit

A customizable Flutter calendar package with support for single date and date range selection.

## Features

- **Single Date Selection** - Pick individual dates with customizable styling
- **Date Range Selection** - Select date ranges with visual feedback
- **Customizable** - Control colors, text styles, decorations, and more
- **Date Constraints** - Set minimum and maximum selectable dates

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  calendar_kit: ^0.0.2
```

Then run:

```bash
flutter pub get
```

## Usage

### Single Date Calendar

```dart
import 'package:calendar_kit/calendar_kit.dart';

Calendar(
  initialDate: DateTime.now(),
  minDate: DateTime(2020, 1, 1),
  maxDate: DateTime(2030, 12, 31),
  onDateChanged: (DateTime date) {
    print('Selected date: $date');
  },
  styleConfig: CalendarStyleConfig(
    selectedDateDecoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(46),
    ),
  ),
)
```

### Date Range Calendar

```dart
import 'package:calendar_kit/calendar_kit.dart';

RangeCalendar(
  initialRange: DateRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 7)),
  ),
  minDate: DateTime(2020, 1, 1),
  maxDate: DateTime(2030, 12, 31),
  onRangeChanged: (DateRange? range) {
    if (range != null) {
      print('Selected range: ${range.start} - ${range.end}');
    }
  },
  styleConfig: RangeCalendarStyleConfig(
    rangeSegmentColor: Colors.blue.shade100,
  ),
)
```

## Customization

### Calendar Style Config

Customize the appearance of the single date calendar:

```dart
CalendarStyleConfig(
  // Background
  backgroundColor: Colors.white,
  calendarRadius: 16,
  
  // Header
  headerYearTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  headerMonthTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  headerIconColor: Colors.black,
  
  // Date cells
  materialWrapperRadius: 46,
  regularDateDecoration: BoxDecoration(color: Colors.transparent),
  selectedDateDecoration: BoxDecoration(
    color: Color(0xff556EE6),
    borderRadius: BorderRadius.circular(46),
  ),
  
  // Text styles
  regularDateTextStyle: TextStyle(color: Color(0xff9797A1)),
  selectedDateTextStyle: TextStyle(color: Colors.white),
  todayDateTextStyle: TextStyle(color: Colors.black),
  pastDateTextStyle: TextStyle(color: Colors.black),
  
  // Date display field
  dateDisplayFieldDecoration: BoxDecoration(
    border: Border.all(color: Color(0xffE2E8F0)),
    borderRadius: BorderRadius.circular(12),
  ),
  dateDisplayFieldSelectedDecoration: BoxDecoration(
    border: Border.all(color: Color(0xff556EE6)),
    borderRadius: BorderRadius.circular(12),
  ),
)
```

### Range Calendar Style Config

Customize the appearance of the date range calendar:

```dart
RangeCalendarStyleConfig(
  // Background
  backgroundColor: Colors.white,
  calendarRadius: 16,
  
  // Header
  headerYearTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  headerMonthTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  headerIconColor: Colors.black,
  
  // Range segment
  rangeSegmentColor: Color(0xffE8EAF6),
  rangeSegmentLeftRadius: 50,
  rangeSegmentRightRadius: 50,
  rangeSegmentBothSidesRadius: 50,
  
  // Date cells
  materialWrapperRadius: 46,
  startDateDecoration: BoxDecoration(
    color: Color(0xffE8EAF6),
    border: Border.all(color: Color(0xff556EE6), width: 2),
    borderRadius: BorderRadius.circular(46),
  ),
  endDateDecoration: BoxDecoration(
    color: Color(0xff556EE6),
    borderRadius: BorderRadius.circular(46),
  ),
  
  // Text styles
  regularDateTextStyle: TextStyle(color: Color(0xff9797A1)),
  startDateTextStyle: TextStyle(color: Colors.black),
  endDateTextStyle: TextStyle(color: Colors.white),
  inRangeDateTextStyle: TextStyle(color: Colors.black),
  todayDateTextStyle: TextStyle(color: Colors.black),
  pastDateTextStyle: TextStyle(color: Colors.black),
)
```

## Example

Check out the [/example](example) directory for a complete working example.

## License

[This project is licensed under the MIT License](https://opensource.org/license/MIT)
