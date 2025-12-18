import 'package:flutter/material.dart';

class CalendarStyleConfig {
  const CalendarStyleConfig({
    this.backgroundColor,
    this.calendarRadius,
    this.headerYearTextStyle,
    this.headerMonthTextStyle,
    this.headerIconColor,
    this.materialWrapperRadius,
    this.regularDateDecoration,
    this.selectedDateDecoration,
    this.dateDisplayFieldDecoration,
    this.dateDisplayFieldSelectedDecoration,
    this.regularDateTextStyle,
    this.selectedDateTextStyle,
    this.todayDateTextStyle,
    this.pastDateTextStyle,
    this.dateDisplayFieldTextStyle,
    this.dateDisplayFieldSelectedTextStyle,
  });

  final Color? backgroundColor;
  final double? calendarRadius;
  final TextStyle? headerYearTextStyle;
  final TextStyle? headerMonthTextStyle;
  final Color? headerIconColor;
  final double? materialWrapperRadius;
  final BoxDecoration? regularDateDecoration;
  final BoxDecoration? selectedDateDecoration;
  final BoxDecoration? dateDisplayFieldDecoration;
  final BoxDecoration? dateDisplayFieldSelectedDecoration;
  final TextStyle? regularDateTextStyle;
  final TextStyle? selectedDateTextStyle;
  final TextStyle? todayDateTextStyle;
  final TextStyle? pastDateTextStyle;
  final TextStyle? dateDisplayFieldTextStyle;
  final TextStyle? dateDisplayFieldSelectedTextStyle;

  factory CalendarStyleConfig.defaultStyle() {
    return CalendarStyleConfig(
      backgroundColor: Colors.white,
      calendarRadius: 16,
      headerYearTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      headerMonthTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      headerIconColor: Colors.black,
      materialWrapperRadius: 46,
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
      dateDisplayFieldSelectedDecoration: BoxDecoration(
        border: Border.all(color: const Color(0xff556EE6)),
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

  CalendarStyleConfig copyWith({
    Color? backgroundColor,
    double? calendarRadius,
    TextStyle? headerYearTextStyle,
    TextStyle? headerMonthTextStyle,
    Color? headerIconColor,
    double? materialWrapperRadius,
    BoxDecoration? regularDateDecoration,
    BoxDecoration? selectedDateDecoration,
    BoxDecoration? dateDisplayFieldDecoration,
    BoxDecoration? dateDisplayFieldSelectedDecoration,
    TextStyle? regularDateTextStyle,
    TextStyle? selectedDateTextStyle,
    TextStyle? todayDateTextStyle,
    TextStyle? pastDateTextStyle,
    TextStyle? dateDisplayFieldTextStyle,
    TextStyle? dateDisplayFieldSelectedTextStyle,
  }) {
    return CalendarStyleConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      calendarRadius: calendarRadius ?? this.calendarRadius,
      headerYearTextStyle: headerYearTextStyle ?? this.headerYearTextStyle,
      headerMonthTextStyle: headerMonthTextStyle ?? this.headerMonthTextStyle,
      headerIconColor: headerIconColor ?? this.headerIconColor,
      materialWrapperRadius: materialWrapperRadius ?? this.materialWrapperRadius,
      regularDateDecoration: regularDateDecoration ?? this.regularDateDecoration,
      selectedDateDecoration: selectedDateDecoration ?? this.selectedDateDecoration,
      dateDisplayFieldDecoration: dateDisplayFieldDecoration ?? this.dateDisplayFieldDecoration,
      dateDisplayFieldSelectedDecoration: dateDisplayFieldSelectedDecoration ?? this.dateDisplayFieldSelectedDecoration,
      regularDateTextStyle: regularDateTextStyle ?? this.regularDateTextStyle,
      selectedDateTextStyle: selectedDateTextStyle ?? this.selectedDateTextStyle,
      todayDateTextStyle: todayDateTextStyle ?? this.todayDateTextStyle,
      pastDateTextStyle: pastDateTextStyle ?? this.pastDateTextStyle,
      dateDisplayFieldTextStyle: dateDisplayFieldTextStyle ?? this.dateDisplayFieldTextStyle,
      dateDisplayFieldSelectedTextStyle: dateDisplayFieldSelectedTextStyle ?? this.dateDisplayFieldSelectedTextStyle,
    );
  }
}

class RangeCalendarStyleConfig {
  const RangeCalendarStyleConfig({
    this.backgroundColor,
    this.calendarRadius,
    this.headerYearTextStyle,
    this.headerMonthTextStyle,
    this.headerIconColor,
    this.materialWrapperRadius,
    this.rangeSegmentLeftRadius,
    this.rangeSegmentRightRadius,
    this.rangeSegmentBothSidesRadius,
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

  final Color? backgroundColor;
  final double? calendarRadius;
  final TextStyle? headerYearTextStyle;
  final TextStyle? headerMonthTextStyle;
  final Color? headerIconColor;
  final double? materialWrapperRadius;
  final double? rangeSegmentLeftRadius;
  final double? rangeSegmentRightRadius;
  final double? rangeSegmentBothSidesRadius;
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
      backgroundColor: Colors.white,
      calendarRadius: 16,
      headerYearTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      headerMonthTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      headerIconColor: Colors.black,
      materialWrapperRadius: 46,
      rangeSegmentLeftRadius: 50,
      rangeSegmentRightRadius: 50,
      rangeSegmentBothSidesRadius: 50,
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

  RangeCalendarStyleConfig copyWith({
    Color? backgroundColor,
    double? calendarRadius,
    TextStyle? headerYearTextStyle,
    TextStyle? headerMonthTextStyle,
    Color? headerIconColor,
    double? materialWrapperRadius,
    double? rangeSegmentLeftRadius,
    double? rangeSegmentRightRadius,
    double? rangeSegmentBothSidesRadius,
    BoxDecoration? startDateDecoration,
    BoxDecoration? endDateDecoration,
    BoxDecoration? inRangeDateDecoration,
    Color? rangeSegmentColor,
    BorderRadius? startDateRadius,
    BorderRadius? endDateRadius,
    BoxDecoration? dateDisplayFieldDecoration,
    BoxDecoration? dateDisplayFieldSelectedDecoration,
    TextStyle? regularDateTextStyle,
    TextStyle? startDateTextStyle,
    TextStyle? endDateTextStyle,
    TextStyle? inRangeDateTextStyle,
    TextStyle? todayDateTextStyle,
    TextStyle? pastDateTextStyle,
    TextStyle? dateDisplayFieldTextStyle,
    TextStyle? dateDisplayFieldSelectedTextStyle,
  }) {
    return RangeCalendarStyleConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      calendarRadius: calendarRadius ?? this.calendarRadius,
      headerYearTextStyle: headerYearTextStyle ?? this.headerYearTextStyle,
      headerMonthTextStyle: headerMonthTextStyle ?? this.headerMonthTextStyle,
      headerIconColor: headerIconColor ?? this.headerIconColor,
      materialWrapperRadius: materialWrapperRadius ?? this.materialWrapperRadius,
      rangeSegmentLeftRadius: rangeSegmentLeftRadius ?? this.rangeSegmentLeftRadius,
      rangeSegmentRightRadius: rangeSegmentRightRadius ?? this.rangeSegmentRightRadius,
      rangeSegmentBothSidesRadius: rangeSegmentBothSidesRadius ?? this.rangeSegmentBothSidesRadius,
      startDateDecoration: startDateDecoration ?? this.startDateDecoration,
      endDateDecoration: endDateDecoration ?? this.endDateDecoration,
      inRangeDateDecoration: inRangeDateDecoration ?? this.inRangeDateDecoration,
      rangeSegmentColor: rangeSegmentColor ?? this.rangeSegmentColor,
      startDateRadius: startDateRadius ?? this.startDateRadius,
      endDateRadius: endDateRadius ?? this.endDateRadius,
      dateDisplayFieldDecoration: dateDisplayFieldDecoration ?? this.dateDisplayFieldDecoration,
      dateDisplayFieldSelectedDecoration: dateDisplayFieldSelectedDecoration ?? this.dateDisplayFieldSelectedDecoration,
      regularDateTextStyle: regularDateTextStyle ?? this.regularDateTextStyle,
      startDateTextStyle: startDateTextStyle ?? this.startDateTextStyle,
      endDateTextStyle: endDateTextStyle ?? this.endDateTextStyle,
      inRangeDateTextStyle: inRangeDateTextStyle ?? this.inRangeDateTextStyle,
      todayDateTextStyle: todayDateTextStyle ?? this.todayDateTextStyle,
      pastDateTextStyle: pastDateTextStyle ?? this.pastDateTextStyle,
      dateDisplayFieldTextStyle: dateDisplayFieldTextStyle ?? this.dateDisplayFieldTextStyle,
      dateDisplayFieldSelectedTextStyle: dateDisplayFieldSelectedTextStyle ?? this.dateDisplayFieldSelectedTextStyle,
    );
  }
}
