import 'package:flutter/material.dart';

import 'package:calendar_kit/src/widgets/material_wrapper.dart';
import 'package:calendar_kit/src/models/calendar_style_config.dart';

class CalendarDateCell extends StatelessWidget {
  const CalendarDateCell({
    super.key,
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.isPast,
    required this.onTap,
    this.styleConfig,
  });

  final DateTime date;
  final bool isSelected;
  final bool isToday;
  final bool isPast;
  final void Function()? onTap;
  final CalendarStyleConfig? styleConfig;

  @override
  Widget build(BuildContext context) {
    final config = styleConfig ?? CalendarStyleConfig.defaultStyle();

    final decoration = isSelected
        ? config.selectedDateDecoration
        : config.regularDateDecoration;

    TextStyle? textStyle;
    if (isSelected) {
      textStyle = config.selectedDateTextStyle;
    } else if (isToday) {
      textStyle = config.todayDateTextStyle;
    } else if (isPast) {
      textStyle = config.pastDateTextStyle;
    } else {
      textStyle = config.regularDateTextStyle;
    }

    final radius = config.materialWrapperRadius ?? 46;

    return Container(
      decoration: decoration,
      child: MaterialWrapper(
        color: Colors.transparent,
        radius: BorderRadius.circular(radius),
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
