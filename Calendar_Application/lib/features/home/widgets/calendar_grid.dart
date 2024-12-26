import 'package:calendar_application/features/home/controllers/calendar_color_util.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarGrid extends StatefulWidget {
  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CalendarController>(context);
    final daysInMonth = controller.generateDaysInMonth();
    final slotData = controller.slotData;

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
        final formattedDate = _formatDate(day);
        final isCurrentMonth = day.month == controller.focusedDay.month;

        if (!isCurrentMonth) {
          return Container(); // Empty space for non-current month days
        }

        final isToday = day.day == DateTime.now().day &&
            day.month == DateTime.now().month &&
            day.year == DateTime.now().year;

        final isSelected = controller.selectedDay == day;
        final dayColor = getDayColor(slotData[formattedDate]);

        return GestureDetector(
          onTap: () => controller.selectDay(day),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : dayColor,
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

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
