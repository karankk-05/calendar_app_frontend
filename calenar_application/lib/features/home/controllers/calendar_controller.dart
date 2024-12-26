import 'package:flutter/material.dart';

class CalendarController extends ChangeNotifier {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  DateTime get focusedDay => _focusedDay;
  DateTime? get selectedDay => _selectedDay;

  void previousMonth() {
    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
    notifyListeners();
  }

  void nextMonth() {
    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
    notifyListeners();
  }

  void selectDay(DateTime day) {
    _selectedDay = day;
    notifyListeners();
  }

  String getMonthName() {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[_focusedDay.month - 1];
  }

  List<DateTime> generateDaysInMonth() {
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final lastDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);

    final days = <DateTime>[];
    
    // Calculate the number of days to skip from the previous month to align the first day
    final firstWeekday = firstDayOfMonth.weekday; // 1 = Monday, 7 = Sunday
    final firstDayOffset = (firstWeekday == 7 ? 0 : firstWeekday);  // Adjust for the start of the week
    
    // Fill in days for the previous month (if any)
    for (int i = 0; i < firstDayOffset; i++) {
      final prevMonthDay = firstDayOfMonth.subtract(Duration(days: firstDayOffset - i));
      days.add(prevMonthDay);
    }

    // Add days for the current month
    for (int i = 1; i <= lastDayOfMonth.day; i++) {
      days.add(DateTime(_focusedDay.year, _focusedDay.month, i));
    }

    // Ensure the calendar has enough days to fill up the last week
    final lastWeekday = lastDayOfMonth.weekday;
    final daysToFill = (7 - lastWeekday) % 7;  // Days to fill up to the next month's first day

    // Add the next month's starting days to fill the last week
    for (int i = 1; i <= daysToFill; i++) {
      final nextMonthDay = DateTime(_focusedDay.year, _focusedDay.month + 1, i);
      days.add(nextMonthDay);
    }

    return days;
  }
}
