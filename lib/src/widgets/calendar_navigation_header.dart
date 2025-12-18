import 'package:flutter/material.dart';

import 'package:calendar_kit/src/widgets/material_wrapper.dart';
import 'package:calendar_kit/src/models/calendar_style_config.dart';

class CalendarNavigationHeader extends StatelessWidget {
  const CalendarNavigationHeader({
    super.key,
    required this.selectedYear,
    required this.selectedMonth,
    required this.monthNames,
    required this.onPreviousYear,
    required this.onNextYear,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onMonthTap,
    this.canNavigateToPreviousYear = true,
    this.canNavigateToNextYear = true,
    this.canNavigateToPreviousMonth = true,
    this.canNavigateToNextMonth = true,
    this.styleConfig,
  });

  final int selectedYear;
  final int selectedMonth;
  final List<String> monthNames;
  final VoidCallback onPreviousYear;
  final VoidCallback onNextYear;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onMonthTap;
  final bool canNavigateToPreviousYear;
  final bool canNavigateToNextYear;
  final bool canNavigateToPreviousMonth;
  final bool canNavigateToNextMonth;
  final dynamic styleConfig;

  TextStyle? get _yearTextStyle {
    if (styleConfig is CalendarStyleConfig) {
      return (styleConfig as CalendarStyleConfig).headerYearTextStyle;
    } else if (styleConfig is RangeCalendarStyleConfig) {
      return (styleConfig as RangeCalendarStyleConfig).headerYearTextStyle;
    }
    return const TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
  }

  TextStyle? get _monthTextStyle {
    if (styleConfig is CalendarStyleConfig) {
      return (styleConfig as CalendarStyleConfig).headerMonthTextStyle;
    } else if (styleConfig is RangeCalendarStyleConfig) {
      return (styleConfig as RangeCalendarStyleConfig).headerMonthTextStyle;
    }
    return const TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
  }

  Color? get _iconColor {
    if (styleConfig is CalendarStyleConfig) {
      return (styleConfig as CalendarStyleConfig).headerIconColor;
    } else if (styleConfig is RangeCalendarStyleConfig) {
      return (styleConfig as RangeCalendarStyleConfig).headerIconColor;
    }
    return Colors.black;
  }

  static const double _navigationIconRadius = 24.0;
  static const double _monthTapRadius = 6.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: canNavigateToPreviousYear ? 1.0 : 0.3,
              child: MaterialWrapper(
                color: Colors.transparent,
                radius: BorderRadius.circular(_navigationIconRadius),
                onTap: canNavigateToPreviousYear ? onPreviousYear : null,
                child: Icon(Icons.chevron_left, color: _iconColor),
              ),
            ),
            Text('$selectedYear', style: _yearTextStyle),
            Opacity(
              opacity: canNavigateToNextYear ? 1.0 : 0.3,
              child: MaterialWrapper(
                color: Colors.transparent,
                radius: BorderRadius.circular(_navigationIconRadius),
                onTap: canNavigateToNextYear ? onNextYear : null,
                child: Icon(Icons.chevron_right, color: _iconColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: canNavigateToPreviousMonth ? 1.0 : 0.3,
              child: MaterialWrapper(
                color: Colors.transparent,
                radius: BorderRadius.circular(_navigationIconRadius),
                onTap: canNavigateToPreviousMonth ? onPreviousMonth : null,
                child: Icon(Icons.chevron_left, color: _iconColor),
              ),
            ),
            MaterialWrapper(
              color: Colors.transparent,
              radius: BorderRadius.circular(_monthTapRadius),
              onTap: onMonthTap,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                child: Text(
                  monthNames[selectedMonth - 1],
                  style: _monthTextStyle,
                ),
              ),
            ),
            Opacity(
              opacity: canNavigateToNextMonth ? 1.0 : 0.3,
              child: MaterialWrapper(
                color: Colors.transparent,
                radius: BorderRadius.circular(_navigationIconRadius),
                onTap: canNavigateToNextMonth ? onNextMonth : null,
                child: Icon(Icons.chevron_right, color: _iconColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
