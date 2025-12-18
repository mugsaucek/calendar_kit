import 'package:flutter/material.dart';
import 'package:calendar_kit/src/widgets/custom_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: canNavigateToPreviousYear ? 1.0 : 0.3,
              child: CustomButton(
                color: Colors.transparent,
                radius: BorderRadius.circular(24),
                onTap: canNavigateToPreviousYear ? onPreviousYear : null,
                child: const Icon(Icons.chevron_left),
              ),
            ),
            Text('$selectedYear', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            Opacity(
              opacity: canNavigateToNextYear ? 1.0 : 0.3,
              child: CustomButton(
                color: Colors.transparent,
                radius: BorderRadius.circular(24),
                onTap: canNavigateToNextYear ? onNextYear : null,
                child: const Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: canNavigateToPreviousMonth ? 1.0 : 0.3,
              child: CustomButton(
                color: Colors.transparent,
                radius: BorderRadius.circular(24),
                onTap: canNavigateToPreviousMonth ? onPreviousMonth : null,
                child: const Icon(Icons.chevron_left),
              ),
            ),
            CustomButton(
              color: Colors.transparent,
              radius: BorderRadius.circular(6),
              onTap: onMonthTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                child: Text(
                  monthNames[selectedMonth - 1],
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
            ),
            Opacity(
              opacity: canNavigateToNextMonth ? 1.0 : 0.3,
              child: CustomButton(
                color: Colors.transparent,
                radius: BorderRadius.circular(24),
                onTap: canNavigateToNextMonth ? onNextMonth : null,
                child: const Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ],
    );
  }
}