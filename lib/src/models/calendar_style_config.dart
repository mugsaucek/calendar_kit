import 'package:flutter/material.dart';

class CalendarStyleConfig {
  const CalendarStyleConfig({
    this.regularDateDecoration,
    this.selectedDateDecoration,
    this.dateDisplayFieldDecoration,
    this.regularDateTextStyle,
    this.selectedDateTextStyle,
    this.todayDateTextStyle,
    this.pastDateTextStyle,
    this.dateDisplayFieldTextStyle,
    this.dateDisplayFieldSelectedTextStyle,
  });

  final BoxDecoration? regularDateDecoration;
  final BoxDecoration? selectedDateDecoration;
  final BoxDecoration? dateDisplayFieldDecoration;
  final TextStyle? regularDateTextStyle;
  final TextStyle? selectedDateTextStyle;
  final TextStyle? todayDateTextStyle;
  final TextStyle? pastDateTextStyle;
  final TextStyle? dateDisplayFieldTextStyle;
  final TextStyle? dateDisplayFieldSelectedTextStyle;

  factory CalendarStyleConfig.defaultStyle() {
    return CalendarStyleConfig(
      regularDateDecoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(46),
      ),
      selectedDateDecoration: BoxDecoration(
        color: const Color(0xff556EE6),
        borderRadius: BorderRadius.circular(46),
      ),
      dateDisplayFieldDecoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE2E8F0)),
        borderRadius: BorderRadius.circular(12),
      ),
      regularDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff9797A1),
      ),
      selectedDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xffFFFFFF),
      ),
      todayDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
      ),
      pastDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
      ),
      dateDisplayFieldTextStyle: const TextStyle(
        color: Color(0xff79747E),
      ),
      dateDisplayFieldSelectedTextStyle: const TextStyle(
        color: Color(0xff000000),
      ),
    );
  }
}

class RangeCalendarStyleConfig {
  const RangeCalendarStyleConfig({
    this.startDateDecoration,
    this.endDateDecoration,
    this.inRangeDateDecoration,
    this.rangeSegmentColor,
    this.startDateRadius,
    this.endDateRadius,
    this.dateDisplayFieldDecoration,
    this.dateDisplayFieldSelectedDecoration,
    this.regularDateTextStyle,
    this.startDateTextStyle,
    this.endDateTextStyle,
    this.inRangeDateTextStyle,
    this.todayDateTextStyle,
    this.pastDateTextStyle,
    this.dateDisplayFieldTextStyle,
    this.dateDisplayFieldSelectedTextStyle,
  });

  final BoxDecoration? startDateDecoration;
  final BoxDecoration? endDateDecoration;
  final BoxDecoration? inRangeDateDecoration;
  final Color? rangeSegmentColor;
  final BorderRadius? startDateRadius;
  final BorderRadius? endDateRadius;
  final BoxDecoration? dateDisplayFieldDecoration;
  final BoxDecoration? dateDisplayFieldSelectedDecoration;
  final TextStyle? regularDateTextStyle;
  final TextStyle? startDateTextStyle;
  final TextStyle? endDateTextStyle;
  final TextStyle? inRangeDateTextStyle;
  final TextStyle? todayDateTextStyle;
  final TextStyle? pastDateTextStyle;
  final TextStyle? dateDisplayFieldTextStyle;
  final TextStyle? dateDisplayFieldSelectedTextStyle;

  factory RangeCalendarStyleConfig.defaultStyle() {
    return RangeCalendarStyleConfig(
      startDateDecoration: BoxDecoration(
        color: const Color(0xffE8EAF6),
        border: Border.all(color: const Color(0xff556EE6), width: 2),
        borderRadius: BorderRadius.circular(46),
      ),
      endDateDecoration: BoxDecoration(
        color: const Color(0xff556EE6),
        borderRadius: BorderRadius.circular(46),
      ),
      inRangeDateDecoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(46),
      ),
      rangeSegmentColor: const Color(0xffE8EAF6),
      startDateRadius: BorderRadius.circular(46),
      endDateRadius: BorderRadius.circular(46),
      dateDisplayFieldDecoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE2E8F0)),
        borderRadius: BorderRadius.circular(12),
      ),
      dateDisplayFieldSelectedDecoration: BoxDecoration(
        border: Border.all(color: const Color(0xff556EE6)),
        borderRadius: BorderRadius.circular(12),
      ),
      regularDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff9797A1),
      ),
      startDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
      ),
      endDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xffFFFFFF),
      ),
      inRangeDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
      ),
      todayDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
      ),
      pastDateTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
      ),
      dateDisplayFieldTextStyle: const TextStyle(
        color: Color(0xff79747E),
      ),
      dateDisplayFieldSelectedTextStyle: const TextStyle(
        color: Color(0xff000000),
      ),
    );
  }
}
