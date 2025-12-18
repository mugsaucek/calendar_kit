import 'package:flutter/material.dart';

import 'package:calendar_kit/src/utils/calendar_utils.dart';
import 'package:calendar_kit/src/widgets/calendar_navigation_header.dart';
import 'package:calendar_kit/src/widgets/calendar_date_cell.dart';
import 'package:calendar_kit/src/widgets/date_display_field.dart';
import 'package:calendar_kit/src/widgets/month_picker_dialog.dart';
import 'package:calendar_kit/src/models/calendar_style_config.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
    this.initialDate,
    this.minDate,
    this.maxDate,
    this.onDateChanged,
    this.styleConfig,
  });

  final DateTime? initialDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final ValueChanged<DateTime>? onDateChanged;
  final CalendarStyleConfig? styleConfig;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime selectedDate;
  late int selectedYear;
  late int selectedMonth;
  late CalendarStyleConfig _styleConfig;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
    selectedYear = selectedDate.year;
    selectedMonth = selectedDate.month;
    _styleConfig = widget.styleConfig ?? CalendarStyleConfig.defaultStyle();
  }

  @override
  void didUpdateWidget(Calendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.styleConfig != oldWidget.styleConfig) {
      _styleConfig = widget.styleConfig ?? CalendarStyleConfig.defaultStyle();
    }
  }

  bool _canNavigateToMonth(int year, int month) {
    final targetDate = DateTime(year, month, 1);

    if (widget.minDate != null) {
      final minMonthStart = DateTime(widget.minDate!.year, widget.minDate!.month, 1);
      if (targetDate.isBefore(minMonthStart)) {
        return false;
      }
    }

    if (widget.maxDate != null) {
      final maxMonthStart = DateTime(widget.maxDate!.year, widget.maxDate!.month, 1);
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

  void _selectDate(DateTime date) {
    if (_isDateSelectable(date)) {
      setState(() => selectedDate = date);
      widget.onDateChanged?.call(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dates = CalendarUtils.generateDates(selectedYear, selectedMonth);
    final today = CalendarUtils.getToday();
    final isTodaySelected =
        selectedDate.year == today.year && selectedDate.month == today.month && selectedDate.day == today.day;

    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
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
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1.0,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                if (date == null) return const SizedBox.shrink();

                final isSelected =
                    date.year == selectedDate.year && date.month == selectedDate.month && date.day == selectedDate.day;
                final isToday = date.year == today.year && date.month == today.month && date.day == today.day;
                final isPast = date.isBefore(today);
                final isSelectable = _isDateSelectable(date);

                return Opacity(
                  opacity: isSelectable ? 1.0 : 0.3,
                  child: CalendarDateCell(
                    date: date,
                    isSelected: isSelected,
                    isToday: isToday,
                    isPast: isPast,
                    onTap: isSelectable ? () => _selectDate(date) : null,
                    regularDecoration: _styleConfig.regularDateDecoration,
                    selectedDecoration: _styleConfig.selectedDateDecoration,
                    regularTextStyle: _styleConfig.regularDateTextStyle,
                    selectedTextStyle: _styleConfig.selectedDateTextStyle,
                    todayTextStyle: _styleConfig.todayDateTextStyle,
                    pastTextStyle: _styleConfig.pastDateTextStyle,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          DateDisplayField(
            text: CalendarUtils.formatDate(selectedDate),
            isSelected: isTodaySelected,
            decoration: _styleConfig.dateDisplayFieldDecoration,
            selectedDecoration: _styleConfig.dateDisplayFieldDecoration,
            textStyle: _styleConfig.dateDisplayFieldTextStyle,
            selectedTextStyle: _styleConfig.dateDisplayFieldSelectedTextStyle,
          ),
        ],
      ),
    );
  }
}
