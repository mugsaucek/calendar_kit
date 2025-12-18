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
                    minDate: DateTime(2024, 10, 15),
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
                    minDate: DateTime(2024, 10, 15),
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
                SizedBox(height: 256),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
