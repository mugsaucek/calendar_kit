import 'package:flutter/material.dart';

import 'package:calendar_kit/src/utils/calendar_utils.dart';
import 'package:calendar_kit/src/models/date_range.dart';

import 'package:calendar_kit/src/widgets/range_date_display_field.dart';
import 'package:calendar_kit/src/widgets/month_picker_dialog.dart';
import 'package:calendar_kit/src/widgets/calendar_navigation_header.dart';
import 'package:calendar_kit/src/widgets/range_calendar_date_cell.dart';
import 'package:calendar_kit/src/models/calendar_style_config.dart';

class RangeCalendar extends StatefulWidget {
  const RangeCalendar({
    super.key,
    this.initialRange,
    this.minDate,
    this.maxDate,
    this.onRangeChanged,
    this.styleConfig,
  });

  final DateRange? initialRange;
  final DateTime? minDate;
  final DateTime? maxDate;
  final ValueChanged<DateRange?>? onRangeChanged;
  final RangeCalendarStyleConfig? styleConfig;

  @override
  State<RangeCalendar> createState() => _RangeCalendarState();
}

class _RangeCalendarState extends State<RangeCalendar> {
  late int selectedYear;
  late int selectedMonth;
  late RangeCalendarStyleConfig _styleConfig;

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    final initialRange = widget.initialRange;

    if (initialRange != null) {
      startDate = initialRange.start;
      endDate = initialRange.end;
      selectedYear = startDate!.year;
      selectedMonth = startDate!.month;
    } else {
      final now = DateTime.now();
      startDate = DateTime(now.year, now.month, now.day - 7);
      endDate = DateTime(now.year, now.month, now.day);
      selectedYear = now.year;
      selectedMonth = now.month;
    }

    _styleConfig = _mergeWithDefaults(widget.styleConfig);
  }

  @override
  void didUpdateWidget(RangeCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.styleConfig != oldWidget.styleConfig) {
      _styleConfig = _mergeWithDefaults(widget.styleConfig);
    }
  }

  RangeCalendarStyleConfig _mergeWithDefaults(
      RangeCalendarStyleConfig? config) {
    final defaultConfig = RangeCalendarStyleConfig.defaultStyle();
    if (config == null) return defaultConfig;
    return defaultConfig.copyWith(
      backgroundColor: config.backgroundColor,
      calendarRadius: config.calendarRadius,
      headerYearTextStyle: config.headerYearTextStyle,
      headerMonthTextStyle: config.headerMonthTextStyle,
      headerIconColor: config.headerIconColor,
      materialWrapperRadius: config.materialWrapperRadius,
      rangeSegmentLeftRadius: config.rangeSegmentLeftRadius,
      rangeSegmentRightRadius: config.rangeSegmentRightRadius,
      rangeSegmentBothSidesRadius: config.rangeSegmentBothSidesRadius,
      startDateDecoration: config.startDateDecoration,
      endDateDecoration: config.endDateDecoration,
      inRangeDateDecoration: config.inRangeDateDecoration,
      rangeSegmentColor: config.rangeSegmentColor,
      startDateRadius: config.startDateRadius,
      endDateRadius: config.endDateRadius,
      dateDisplayFieldDecoration: config.dateDisplayFieldDecoration,
      dateDisplayFieldSelectedDecoration:
          config.dateDisplayFieldSelectedDecoration,
      regularDateTextStyle: config.regularDateTextStyle,
      startDateTextStyle: config.startDateTextStyle,
      endDateTextStyle: config.endDateTextStyle,
      inRangeDateTextStyle: config.inRangeDateTextStyle,
      todayDateTextStyle: config.todayDateTextStyle,
      pastDateTextStyle: config.pastDateTextStyle,
      dateDisplayFieldTextStyle: config.dateDisplayFieldTextStyle,
      dateDisplayFieldSelectedTextStyle:
          config.dateDisplayFieldSelectedTextStyle,
    );
  }

  bool _canNavigateToMonth(int year, int month) {
    final targetDate = DateTime(year, month, 1);

    if (widget.minDate != null) {
      final minMonthStart =
          DateTime(widget.minDate!.year, widget.minDate!.month, 1);
      if (targetDate.isBefore(minMonthStart)) {
        return false;
      }
    }

    if (widget.maxDate != null) {
      final maxMonthStart =
          DateTime(widget.maxDate!.year, widget.maxDate!.month, 1);
      if (targetDate.isAfter(maxMonthStart)) {
        return false;
      }
    }

    return true;
  }

  void _changeMonth(int delta) {
    final newMonth = selectedMonth + delta;
    int targetYear = selectedYear;
    int targetMonth = newMonth;

    if (targetMonth > 12) {
      targetMonth = 1;
      targetYear++;
    } else if (targetMonth < 1) {
      targetMonth = 12;
      targetYear--;
    }

    if (_canNavigateToMonth(targetYear, targetMonth)) {
      setState(() {
        selectedMonth = targetMonth;
        selectedYear = targetYear;
      });
    }
  }

  void _changeYear(int delta) {
    final targetYear = selectedYear + delta;
    if (_canNavigateToMonth(targetYear, selectedMonth)) {
      setState(() => selectedYear = targetYear);
    }
  }

  void _showMonthPicker() {
    MonthPickerDialog.show(
      context: context,
      selectedMonth: selectedMonth,
      selectedYear: selectedYear,
      monthNames: CalendarUtils.monthNames,
      minDate: widget.minDate,
      maxDate: widget.maxDate,
      onMonthSelected: (month) {
        if (_canNavigateToMonth(selectedYear, month)) {
          setState(() => selectedMonth = month);
        }
      },
    );
  }

  bool get _canNavigateToPreviousYear {
    return _canNavigateToMonth(selectedYear - 1, selectedMonth);
  }

  bool get _canNavigateToNextYear {
    return _canNavigateToMonth(selectedYear + 1, selectedMonth);
  }

  bool get _canNavigateToPreviousMonth {
    int targetYear = selectedYear;
    int targetMonth = selectedMonth - 1;
    if (targetMonth < 1) {
      targetMonth = 12;
      targetYear--;
    }
    return _canNavigateToMonth(targetYear, targetMonth);
  }

  bool get _canNavigateToNextMonth {
    int targetYear = selectedYear;
    int targetMonth = selectedMonth + 1;
    if (targetMonth > 12) {
      targetMonth = 1;
      targetYear++;
    }
    return _canNavigateToMonth(targetYear, targetMonth);
  }

  bool _isDateSelectable(DateTime date) {
    if (widget.minDate != null && date.isBefore(widget.minDate!)) {
      return false;
    }
    if (widget.maxDate != null && date.isAfter(widget.maxDate!)) {
      return false;
    }
    return true;
  }

  void _onDateTap(DateTime date) {
    if (!_isDateSelectable(date)) {
      return;
    }

    setState(() {
      if (startDate == null) {
        startDate = date;
        endDate = null;
      } else if (endDate == null) {
        if (date.isBefore(startDate!)) {
          endDate = startDate;
          startDate = date;
        } else if (date.isAtSameMomentAs(startDate!)) {
          return;
        } else {
          endDate = date;
        }
      } else {
        startDate = date;
        endDate = null;
      }
    });

    if (startDate != null && endDate != null) {
      widget.onRangeChanged?.call(DateRange(startDate!, endDate!));
    } else {
      widget.onRangeChanged?.call(null);
    }
  }

  bool _isDateBetweenRange(DateTime date) {
    if (startDate == null || endDate == null) return false;
    return date.isAfter(startDate!) && date.isBefore(endDate!);
  }

  @override
  Widget build(BuildContext context) {
    final dates = CalendarUtils.generateDates(selectedYear, selectedMonth);
    final today = CalendarUtils.getToday();

    return Container(
      decoration: BoxDecoration(
        color: _styleConfig.backgroundColor,
        borderRadius: BorderRadius.circular(_styleConfig.calendarRadius ?? 16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarNavigationHeader(
            selectedYear: selectedYear,
            selectedMonth: selectedMonth,
            monthNames: CalendarUtils.monthNames,
            onPreviousYear: () => _changeYear(-1),
            onNextYear: () => _changeYear(1),
            onPreviousMonth: () => _changeMonth(-1),
            onNextMonth: () => _changeMonth(1),
            onMonthTap: _showMonthPicker,
            canNavigateToPreviousYear: _canNavigateToPreviousYear,
            canNavigateToNextYear: _canNavigateToNextYear,
            canNavigateToPreviousMonth: _canNavigateToPreviousMonth,
            canNavigateToNextMonth: _canNavigateToNextMonth,
            styleConfig: _styleConfig,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, childAspectRatio: 1.0),
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                if (date == null) return const SizedBox.shrink();

                final isStartDate = startDate != null &&
                    date.year == startDate!.year &&
                    date.month == startDate!.month &&
                    date.day == startDate!.day;

                final isEndDate = endDate != null &&
                    date.year == endDate!.year &&
                    date.month == endDate!.month &&
                    date.day == endDate!.day;

                final isInRange = _isDateBetweenRange(date);
                final isToday = date.year == today.year &&
                    date.month == today.month &&
                    date.day == today.day;
                final isPast = date.isBefore(today);
                final isSelectable = _isDateSelectable(date);

                return Opacity(
                  opacity: isSelectable ? 1.0 : 0.3,
                  child: RangeCalendarDateCell(
                    date: date,
                    hasEndDate: endDate == null ? false : true,
                    isStartDate: isStartDate,
                    isEndDate: isEndDate,
                    isInRange: isInRange,
                    isToday: isToday,
                    isPast: isPast,
                    onTap: isSelectable ? () => _onDateTap(date) : null,
                    styleConfig: _styleConfig,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RangeDateDisplayField(
                  text: startDate != null
                      ? CalendarUtils.formatDate(startDate!)
                      : 'Начальная дата',
                  isSelected: startDate != null,
                  styleConfig: _styleConfig,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RangeDateDisplayField(
                  text: endDate != null
                      ? CalendarUtils.formatDate(endDate!)
                      : 'Конечная дата',
                  isSelected: endDate != null,
                  styleConfig: _styleConfig,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
