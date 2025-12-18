class CalendarUtils {
  static List<String> monthNames = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year.toString()}';
  }

  static List<DateTime?> generateDates(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);
    final firstWeekday = firstDay.weekday;

    List<DateTime?> dates = [];

    for (int i = 1; i < firstWeekday; i++) {
      dates.add(null);
    }

    for (int day = 1; day <= lastDay.day; day++) {
      dates.add(DateTime(year, month, day));
    }

    return dates;
  }

  static DateTime getToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
