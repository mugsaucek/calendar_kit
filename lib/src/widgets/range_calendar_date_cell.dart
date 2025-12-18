import 'package:flutter/material.dart';

import 'package:calendar_kit/src/widgets/material_wrapper.dart';
import 'package:calendar_kit/src/models/calendar_style_config.dart';

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
    this.styleConfig,
  });

  final DateTime date;
  final bool hasEndDate;
  final bool isStartDate;
  final bool isEndDate;
  final bool isInRange;
  final bool isToday;
  final bool isPast;
  final void Function()? onTap;
  final RangeCalendarStyleConfig? styleConfig;

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
    final config = styleConfig ?? RangeCalendarStyleConfig.defaultStyle();
    final bothSidesRadius = config.rangeSegmentBothSidesRadius ?? 50;
    final leftRadius = config.rangeSegmentLeftRadius ?? 50;
    final rightRadius = config.rangeSegmentRightRadius ?? 50;

    if (_shouldClipFromBothSides()) {
      return BorderRadius.circular(bothSidesRadius);
    } else if (_shouldClipFromLeft()) {
      return BorderRadius.only(
        topLeft: Radius.circular(leftRadius),
        bottomLeft: Radius.circular(leftRadius),
      );
    } else if (_shouldClipFromRight()) {
      return BorderRadius.only(
        topRight: Radius.circular(rightRadius),
        bottomRight: Radius.circular(rightRadius),
      );
    } else if (isInRange) {
      return null;
    }
    return BorderRadius.circular(bothSidesRadius);
  }

  @override
  Widget build(BuildContext context) {
    final config = styleConfig ?? RangeCalendarStyleConfig.defaultStyle();

    TextStyle? textStyle;
    if (isStartDate) {
      textStyle = config.startDateTextStyle;
    } else if (isEndDate) {
      textStyle = config.endDateTextStyle;
    } else if (isInRange) {
      textStyle = config.inRangeDateTextStyle;
    } else if (isToday) {
      textStyle = config.todayDateTextStyle;
    } else if (isPast) {
      textStyle = config.pastDateTextStyle;
    } else {
      textStyle = config.regularDateTextStyle;
    }

    final materialRadius = config.materialWrapperRadius ?? 46;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isStartDate || isInRange || isEndDate ? config.rangeSegmentColor : Colors.transparent,
        borderRadius: _getContainerBorderRadius(),
      ),
      child: Container(
        decoration: isStartDate
            ? config.startDateDecoration
            : isEndDate
                ? config.endDateDecoration
                : null,
        child: MaterialWrapper(
          color: Colors.transparent,
          radius: isStartDate
              ? config.startDateRadius
              : isEndDate
                  ? config.endDateRadius
                  : BorderRadius.circular(materialRadius),
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
