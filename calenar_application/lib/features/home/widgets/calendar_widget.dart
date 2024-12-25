import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
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

  List<DateTime> _generateDaysInMonth(DateTime focusedDay) {
    final firstDayOfMonth = DateTime(focusedDay.year, focusedDay.month, 1);
    final lastDayOfMonth = DateTime(focusedDay.year, focusedDay.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;

    final days = <DateTime>[];
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(focusedDay.year, focusedDay.month, i));
    }

    // Add padding for days of the week
    final firstWeekday = firstDayOfMonth.weekday;
    for (int i = 0; i < firstWeekday - 1; i++) {
      days.insert(0, firstDayOfMonth.subtract(Duration(days: firstWeekday - 1 - i)));
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = _generateDaysInMonth(_focusedDay);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          centerTitle: true,
          title: const Text(
            "Schedule",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Replace with actual image
                radius: 18,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Shadowed container wrapping the Month selector and GridView
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Month selector with arrows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _onPreviousMonth,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: const Color(0xFFE0E0E0)),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.chevron_left,
                            size: 28,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Text(
                        "${_getMonthName(_focusedDay.month)} ${_focusedDay.year}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: _onNextMonth,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: const Color(0xFFE0E0E0)),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.chevron_right,
                            size: 28,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Days of the week header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(child: Center(child: Text("Mon"))),
                      Expanded(child: Center(child: Text("Tue"))),
                      Expanded(child: Center(child: Text("Wed"))),
                      Expanded(child: Center(child: Text("Thu"))),
                      Expanded(child: Center(child: Text("Fri"))),
                      Expanded(child: Center(child: Text("Sat"))),
                      Expanded(child: Center(child: Text("Sun"))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Calendar grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7, // 7 days in a week
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: daysInMonth.length,
                    itemBuilder: (context, index) {
                      final day = daysInMonth[index];
                      final isToday = day.day == DateTime.now().day &&
                          day.month == DateTime.now().month &&
                          day.year == DateTime.now().year;
                      final isSelected = _selectedDay == day;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDay = day;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.green
                                : isToday
                                    ? Colors.green.withOpacity(0.3)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.green
                                  : Colors.grey.shade300,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

