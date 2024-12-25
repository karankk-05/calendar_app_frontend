import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Custom arrow icons for better visibility
  final Widget leftArrow = Container(
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFE0E0E0)),
      borderRadius: BorderRadius.circular(100),
    ),
    padding: const EdgeInsets.all(8),
    child: const Icon(
      Icons.chevron_left,
      size: 24,
      color: Color(0xFF2D2D2D),
    ),
  );

  final Widget rightArrow = Container(
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFE0E0E0)),
      borderRadius: BorderRadius.circular(100),
    ),
    padding: const EdgeInsets.all(8),
    child: const Icon(
      Icons.chevron_right,
      size: 24,
      color: Color(0xFF2D2D2D),
    ),
  );

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  void _onPreviousMonth() {
    setState(() {
      _focusedDay = DateTime(
        _focusedDay.year,
        _focusedDay.month - 1,
      );
    });
  }

  void _onNextMonth() {
    setState(() {
      _focusedDay = DateTime(
        _focusedDay.year,
        _focusedDay.month + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Add navigation drawer logic here
          },
        ),
        title: const Text(
          "Schedule",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Add menu button logic here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: theme.onSurface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Month selector with arrows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: _onPreviousMonth,
                            child: leftArrow,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            "${_getMonthName(_focusedDay.month)} ${_focusedDay.year}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D2D2D),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: _onNextMonth,
                            child: rightArrow,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Calendar
                      TableCalendar(
                        firstDay: DateTime(2000, 1),
                        lastDay: DateTime(2050, 12),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        onPageChanged: (focusedDay) {
                          setState(() {
                            _focusedDay = focusedDay;
                          });
                        },
                        headerVisible: false,
                        daysOfWeekHeight: 40,
                        rowHeight: 45,
                        calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                          cellMargin: const EdgeInsets.all(4),
                          defaultDecoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          weekendDecoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          selectedDecoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          todayDecoration: BoxDecoration(
                            color: const Color(0xFF4CAF50).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Color(0xFF757575),
                            fontWeight: FontWeight.w500,
                          ),
                          weekendStyle: TextStyle(
                            color: Color(0xFF757575),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
