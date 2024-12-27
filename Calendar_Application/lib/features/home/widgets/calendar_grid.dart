import 'package:calendar_application/core/constants/gradients.dart';
import 'package:calendar_application/features/home/controllers/calendar_color_util.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:calendar_application/features/slots_view/controller/slot_details_controller.dart';
import 'package:calendar_application/features/slots_view/widgets/slots_details_bottom_sheet.dart';
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
    final theme = Theme.of(context).colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    if (controller.isLoading) {
      // Show the CircularProgressIndicator while data is loading
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 0.85,
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
        final dayColor = getDayColor(slotData[formattedDate], isDarkMode);

        // Check if the day is empty
        bool isEmpty = dayColor == DarkGradients.EmptyGradient || dayColor == LightGradients.EmptyGradient;

        return GestureDetector(
          onTap: () async {
            controller.selectDay(day);
            final slotDetailsController =
                Provider.of<SlotDetailsController>(context, listen: false);

            await slotDetailsController.fetchSlotDetails(
              userId: 'Lorem',
              date: formattedDate,
            );
            showSlotDetailsBottomSheet(context, slotDetailsController);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: isToday
                  ? (isDarkMode
                      ? DarkGradients.isTodayGradient
                      : LightGradients.isTodayGradient)
                  : dayColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: isSelected ? 3 : 0.5,
                color: isSelected ? theme.primary : theme.onPrimaryContainer.withOpacity(0.2),
              ),
            ),
            alignment: isToday ? Alignment.center : Alignment(-0.7, 0.9),
            child: Text(
              '${day.day}',
              style: TextStyle(
                fontSize: isToday ? 19 : 16,
                fontWeight: FontWeight.bold,
                color: isToday || !isEmpty ? theme.onSecondaryContainer : theme.onPrimaryContainer, // White if today or not empty
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
