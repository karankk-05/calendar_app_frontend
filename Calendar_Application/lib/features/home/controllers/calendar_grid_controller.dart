import 'package:flutter/material.dart';
import 'calendar_api_service.dart';

class CalendarController extends ChangeNotifier {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final CalendarService _calendarService = CalendarService();
  Map<String, Map<String, int>> _slotData = {};
  
  bool _isLoading = false; // New loading state
  
  DateTime get focusedDay => _focusedDay;
  DateTime? get selectedDay => _selectedDay;
  Map<String, Map<String, int>> get slotData => _slotData;
  bool get isLoading => _isLoading;  // Getter for loading state

  // Fetch slots when the month changes
  void fetchSlots() async {
    _isLoading = true;  // Set loading to true when fetching starts
    notifyListeners();  // Notify listeners to rebuild the UI
    
    final startDate = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final endDate = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
    print("Fetching");
    
    try {
      final data = await _calendarService.fetchSlots('Lorem', startDate, endDate);
      _slotData = data;
      print(data);
    } catch (e) {
      print('Error fetching slots: $e');
    } finally {
      _isLoading = false;  // Set loading to false when fetching is complete
      notifyListeners();  // Notify listeners to rebuild the UI
    }
  }

  set focusedDay(DateTime newDate) {
    _focusedDay = newDate;
    notifyListeners(); // Notify listeners of the change
  }

  void previousMonth() {
    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
    fetchSlots();  // Fetch new slots when month changes
    notifyListeners();
  }

  void nextMonth() {
    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
    fetchSlots();  // Fetch new slots when month changes
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

    final firstWeekday = firstDayOfMonth.weekday;
    final firstDayOffset = (firstWeekday == 7 ? 0 : firstWeekday);

    for (int i = 0; i < firstDayOffset; i++) {
      final prevMonthDay = firstDayOfMonth.subtract(Duration(days: firstDayOffset - i));
      days.add(prevMonthDay);
    }

    for (int i = 1; i <= lastDayOfMonth.day; i++) {
      days.add(DateTime(_focusedDay.year, _focusedDay.month, i));
    }

    final lastWeekday = lastDayOfMonth.weekday;
    final daysToFill = (7 - lastWeekday) % 7;

    for (int i = 1; i <= daysToFill; i++) {
      final nextMonthDay = DateTime(_focusedDay.year, _focusedDay.month + 1, i);
      days.add(nextMonthDay);
    }

    return days;
  }
}
