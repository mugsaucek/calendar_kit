import 'package:flutter/material.dart';

class MonthPickerDialog {
  static void show({
    required BuildContext context,
    required int selectedMonth,
    required int selectedYear,
    required List<String> monthNames,
    required Function(int) onMonthSelected,
    DateTime? minDate,
    DateTime? maxDate,
  }) {
    final RenderBox object = context.findRenderObject() as RenderBox;
    final objectPosition = object.localToGlobal(Offset.zero);
    final objectSize = object.size;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    bool isMonthSelectable(int month) {
      final targetDate = DateTime(selectedYear, month, 1);

      if (minDate != null) {
        final minMonthStart = DateTime(minDate.year, minDate.month, 1);
        if (targetDate.isBefore(minMonthStart)) {
          return false;
        }
      }

      if (maxDate != null) {
        final maxMonthStart = DateTime(maxDate.year, maxDate.month, 1);
        if (targetDate.isAfter(maxMonthStart)) {
          return false;
        }
      }

      return true;
    }

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Positioned(
                top: objectPosition.dy + objectSize.height * 0.2,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  elevation: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 128,
                      child: Column(
                        children: List.generate(12, (index) {
                          final monthIndex = index + 1;
                          final isSelected = selectedMonth == monthIndex;
                          final isSelectable = isMonthSelectable(monthIndex);
                          final isPastMonth = monthIndex <= today.month && selectedYear == today.year;

                          return Opacity(
                            opacity: isSelectable ? 1.0 : 0.3,
                            child: InkWell(
                              borderRadius: index == 0
                                  ? const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
                                  : index == 11
                                      ? const BorderRadius.only(
                                          bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))
                                      : null,
                              onTap: isSelectable
                                  ? () {
                                      onMonthSelected(monthIndex);
                                      Navigator.of(context).pop();
                                    }
                                  : null,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: isSelected ? const Color(0xffE8EAF6) : Colors.transparent,
                                ),
                                child: Text(
                                  monthNames[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: isPastMonth ? const Color(0xff000000) : const Color(0xff79747E),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
