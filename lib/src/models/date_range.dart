class DateRange {
  const DateRange(this.start, this.end);

  final DateTime start;
  final DateTime end;

  factory DateRange.fromList(List<DateTime> dates) {
    assert(dates.length == 2, 'DateRange must contain exactly 2 elements');
    return DateRange(dates[0], dates[1]);
  }

  List<DateTime?> toList() => [start, end];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateRange && runtimeType == other.runtimeType && start == other.start && end == other.end;

  @override
  int get hashCode => start.hashCode ^ end.hashCode;

  @override
  String toString() => 'DateRange(start: $start, end: $end)';
}
