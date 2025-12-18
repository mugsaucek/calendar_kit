import 'package:calendar_kit/calendar_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar Kit Example App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  child: Calendar(
                    initialDate: DateTime(2025, 10, 31),
                    minDate: DateTime(2024, 8, 1),
                    maxDate: DateTime(2025, 12, 31),
                    onDateChanged: (value) {
                      print(value.toString());
                    },
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  child: RangeCalendar(
                    initialRange: DateRange(DateTime(2025, 10, 20), DateTime(2025, 10, 31)),
                    minDate: DateTime(2024, 8, 1),
                    maxDate: DateTime(2025, 12, 31),
                    onRangeChanged: (value) {
                      if (value != null) {
                        print('${value.start},${value.end}');
                      } else {
                        print('range selection is not completed');
                      }
                    },
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  child: Calendar(
                    initialDate: DateTime(2025, 10, 31),
                    minDate: DateTime(2024, 8, 1),
                    maxDate: DateTime(2025, 12, 31),
                    styleConfig: CalendarStyleConfig(
                      calendarRadius: 8,
                      backgroundColor: Colors.white,
                      dateDisplayFieldDecoration: BoxDecoration(
                        color: Colors.redAccent.withAlpha(100),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red, width: 3),
                      ),
                      dateDisplayFieldTextStyle: TextStyle(
                        color: Colors.red,
                      ),
                      dateDisplayFieldSelectedDecoration: BoxDecoration(
                        color: Colors.redAccent.withAlpha(100),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red, width: 3),
                      ),
                      dateDisplayFieldSelectedTextStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                      selectedDateDecoration: BoxDecoration(
                        color: Colors.redAccent.withAlpha(100),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red, width: 3),
                      ),
                      selectedDateTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onDateChanged: (value) {
                      print(value.toString());
                    },
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  child: RangeCalendar(
                    initialRange: DateRange(DateTime(2025, 10, 20), DateTime(2025, 10, 31)),
                    minDate: DateTime(2024, 8, 1),
                    maxDate: DateTime(2025, 12, 31),
                    styleConfig: RangeCalendarStyleConfig(
                        calendarRadius: 8,
                        backgroundColor: Colors.white,
                        startDateDecoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.red, width: 3),
                            borderRadius: BorderRadius.circular(8)),
                        endDateRadius: BorderRadius.circular(8),
                        endDateDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red,
                        ),
                        rangeSegmentColor: Colors.redAccent.withAlpha(100),
                        rangeSegmentLeftRadius: 8,
                        rangeSegmentRightRadius: 8,
                        rangeSegmentBothSidesRadius: 8,
                        dateDisplayFieldDecoration: BoxDecoration(
                          color: Colors.redAccent.withAlpha(100),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red, width: 3),
                        ),
                        dateDisplayFieldSelectedDecoration: BoxDecoration(
                          color: Colors.redAccent.withAlpha(100),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red, width: 3),
                        )),
                    onRangeChanged: (value) {
                      if (value != null) {
                        print('${value.start},${value.end}');
                      } else {
                        print('range selection is not completed');
                      }
                    },
                  ),
                ),
                SizedBox(height: 256),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
