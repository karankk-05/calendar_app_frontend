import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/calendar_controller.dart';

class CalendarGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CalendarController>(context);
    final daysInMonth = controller.generateDaysInMonth();

    return GridView.builder(
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
        
        // Check if the day is part of the current month
        final isCurrentMonth = day.month == controller.focusedDay.month;

        // If it's not part of the current month, display an empty space
        if (!isCurrentMonth) {
          return Container(); // Empty container for previous month's days
        }

        final isToday = day.day == DateTime.now().day &&
            day.month == DateTime.now().month &&
            day.year == DateTime.now().year;
        final isSelected = controller.selectedDay == day;

        return GestureDetector(
          onTap: () => controller.selectDay(day),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.green
                  : isToday
                      ? Colors.green.withOpacity(0.3)
                      : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? Colors.green : Colors.grey.shade300,
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
    );
  }
}
