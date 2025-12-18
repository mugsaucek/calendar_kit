import 'package:flutter/material.dart';
import 'package:calendar_kit/src/widgets/custom_button.dart';

class RangeCalendarDateCell extends StatelessWidget {
  const RangeCalendarDateCell({
    super.key,
    required this.date,
    required this.hasEndDate,
    required this.isStartDate,
    required this.isEndDate,
    required this.isInRange,
    required this.isToday,
    required this.isPast,
    required this.onTap,
    this.startDateDecoration,
    this.endDateDecoration,
    this.inRangeDecoration,
    this.rangeSegmentColor,
    this.startDateRadius,
    this.endDateRadius,
    this.regularTextStyle,
    this.startDateTextStyle,
    this.endDateTextStyle,
    this.inRangeTextStyle,
    this.todayTextStyle,
    this.pastTextStyle,
  });

  final DateTime date;
  final bool hasEndDate;
  final bool isStartDate;
  final bool isEndDate;
  final bool isInRange;
  final bool isToday;
  final bool isPast;
  final void Function()? onTap;
  final BoxDecoration? startDateDecoration;
  final BoxDecoration? endDateDecoration;
  final BoxDecoration? inRangeDecoration;
  final Color? rangeSegmentColor;
  final BorderRadius? startDateRadius;
  final BorderRadius? endDateRadius;
  final TextStyle? regularTextStyle;
  final TextStyle? startDateTextStyle;
  final TextStyle? endDateTextStyle;
  final TextStyle? inRangeTextStyle;
  final TextStyle? todayTextStyle;
  final TextStyle? pastTextStyle;

  bool _shouldClipFromBothSides() {
    final previousDay = date.subtract(const Duration(days: 1));
    final nextDay = date.add(const Duration(days: 1));

    return (isInRange && date.weekday == 7 && previousDay.month != date.month) ||
        (isInRange && date.weekday == 1 && nextDay.month != date.month) ||
        (isStartDate && nextDay.weekday == 1) ||
        (isStartDate && !hasEndDate) ||
        (isEndDate && previousDay.weekday == 7);
  }

  bool _shouldClipFromLeft() {
    final firstDay = DateTime(date.year, date.month, 1);
    final lastDay = DateTime(date.year, date.month + 1, 0);

    return (isInRange && date.day == firstDay.day) ||
        (isInRange && date.weekday == 1) ||
        (isStartDate && date.day != lastDay.day && isEndDate == false);
  }

  bool _shouldClipFromRight() {
    final firstDay = DateTime(date.year, date.month, 1);
    final lastDay = DateTime(date.year, date.month + 1, 0);

    return (isInRange && date.day == lastDay.day) ||
        (isInRange && date.weekday == 7) ||
        (isEndDate && date.day != firstDay.day);
  }

  BorderRadius? _getContainerBorderRadius() {
    if (_shouldClipFromBothSides()) {
      return BorderRadius.circular(50);
    } else if (_shouldClipFromLeft()) {
      return const BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50));
    } else if (_shouldClipFromRight()) {
      return const BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50));
    } else if (isInRange) {
      return null;
    }
    return BorderRadius.circular(50);
  }

  @override
  Widget build(BuildContext context) {
    final defaultStartDateDecoration = BoxDecoration(
      color: const Color(0xffE8EAF6),
      border: Border.all(color: const Color(0xff556EE6), width: 2),
      borderRadius: BorderRadius.circular(46),
    );

    final defaultEndDateDecoration = BoxDecoration(
      color: const Color(0xff556EE6),
      borderRadius: BorderRadius.circular(46),
    );

    final defaultStartDateRadius = BorderRadius.circular(46);
    final defaultEndDateRadius = BorderRadius.circular(46);

    final defaultRegularTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff9797A1),
    );

    final defaultStartDateTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff000000),
    );

    final defaultEndDateTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xffFFFFFF),
    );

    final defaultInRangeTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff000000),
    );

    final defaultTodayTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff000000),
    );

    final defaultPastTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff000000),
    );

    final defaultRangeSegmentColor = const Color(0xffE8EAF6);

    final finalStartDateDecoration = startDateDecoration ?? defaultStartDateDecoration;
    final finalEndDateDecoration = endDateDecoration ?? defaultEndDateDecoration;
    final finalStartDateRadius = startDateRadius ?? defaultStartDateRadius;
    final finalEndDateRadius = endDateRadius ?? defaultEndDateRadius;

    TextStyle textStyle;
    if (isStartDate) {
      textStyle = startDateTextStyle ?? defaultStartDateTextStyle;
    } else if (isEndDate) {
      textStyle = endDateTextStyle ?? defaultEndDateTextStyle;
    } else if (isInRange) {
      textStyle = inRangeTextStyle ?? defaultInRangeTextStyle;
    } else if (isToday) {
      textStyle = todayTextStyle ?? defaultTodayTextStyle;
    } else if (isPast) {
      textStyle = pastTextStyle ?? defaultPastTextStyle;
    } else {
      textStyle = regularTextStyle ?? defaultRegularTextStyle;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isStartDate || isInRange || isEndDate
            ? (rangeSegmentColor ?? defaultRangeSegmentColor)
            : Colors.transparent,
        borderRadius: _getContainerBorderRadius(),
      ),
      child: Container(
        decoration: isStartDate
            ? finalStartDateDecoration
            : isEndDate
                ? finalEndDateDecoration
                : null,
        child: CustomButton(
          color: Colors.transparent,
          radius: isStartDate
              ? finalStartDateRadius
              : isEndDate
                  ? finalEndDateRadius
                  : BorderRadius.circular(46),
          onTap: onTap,
          child: Center(
            child: Text(
              '${date.day}',
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
