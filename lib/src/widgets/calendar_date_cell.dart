import 'package:flutter/material.dart';
import 'package:calendar_kit/src/widgets/custom_button.dart';

class CalendarDateCell extends StatelessWidget {
  const CalendarDateCell({
    super.key,
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.isPast,
    required this.onTap,
    this.regularDecoration,
    this.selectedDecoration,
    this.regularTextStyle,
    this.selectedTextStyle,
    this.todayTextStyle,
    this.pastTextStyle,
  });

  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final bool isPast;
  final void Function()? onTap;
  final BoxDecoration? regularDecoration;
  final BoxDecoration? selectedDecoration;
  final TextStyle? regularTextStyle;
  final TextStyle? selectedTextStyle;
  final TextStyle? todayTextStyle;
  final TextStyle? pastTextStyle;

  @override
  Widget build(BuildContext context) {
    final defaultRegularDecoration = BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(46),
    );

    final defaultSelectedDecoration = BoxDecoration(
      color: const Color(0xff556EE6),
      borderRadius: BorderRadius.circular(46),
    );

    final defaultRegularTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff9797A1),
    );

    final defaultSelectedTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xffFFFFFF),
    );

    final defaultTodayTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff000000),
    );

    final defaultPastTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff000000),
    );

    final decoration = isSelected
        ? (selectedDecoration ?? defaultSelectedDecoration)
        : (regularDecoration ?? defaultRegularDecoration);

    TextStyle textStyle;
    if (isSelected) {
      textStyle = selectedTextStyle ?? defaultSelectedTextStyle;
    } else if (isToday) {
      textStyle = todayTextStyle ?? defaultTodayTextStyle;
    } else if (isPast) {
      textStyle = pastTextStyle ?? defaultPastTextStyle;
    } else {
      textStyle = regularTextStyle ?? defaultRegularTextStyle;
    }

    return Container(
      decoration: decoration,
      child: CustomButton(
        color: Colors.transparent,
        radius: BorderRadius.circular(46),
        onTap: onTap,
        child: Center(
          child: Text(
            '${date.day}',
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
