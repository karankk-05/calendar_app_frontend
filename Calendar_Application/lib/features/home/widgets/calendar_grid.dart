import 'package:calendar_application/core/constants/gradients.dart';
import 'package:calendar_application/core/utils/calendar_color_util.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:calendar_application/features/slots_view/controller/slot_details_service.dart';
import 'package:calendar_application/features/slots_view/widgets/slot_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CalendarGrid extends StatefulWidget {
  const CalendarGrid({super.key});

  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {
  static const double calendarHeight = 700; // Fixed height for the calendar

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CalendarController>(context);
    final daysInMonth = controller.generateDaysInMonth();
    final slotData = controller.slotData;
    final theme = Theme.of(context).colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    return SizedBox(
      height: calendarHeight, // Maintain consistent height
      child: controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
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
                  return Container();
                }

                final isToday = day.day == DateTime.now().day &&
                    day.month == DateTime.now().month &&
                    day.year == DateTime.now().year;

                final isSelected = controller.selectedDay == day;
                final dayColor = getDayColor(slotData[formattedDate], isDarkMode);

                bool isEmpty = dayColor == DarkGradients.EmptyGradient ||
                    dayColor == LightGradients.EmptyGradient;

                return GestureDetector(
                  onTap: () {
                    controller.selectDay(day);
                    final slotDetailsController =
                        Provider.of<SlotDetailsController>(context, listen: false);

                    if (MediaQuery.of(context).size.width >= 700) {
                      // For Desktop, update the UI to show slot details on the right panel
                      slotDetailsController.fetchSlotDetails(userId: 'Lorem', date: formattedDate);
                    } else {
                      // For Mobile, show the bottom sheet
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return ChangeNotifierProvider.value(
                            value: slotDetailsController,
                            child: const SlotsDetailsBottomSheet(),
                          );
                        },
                      );
                      slotDetailsController.fetchSlotDetails(userId: 'Lorem', date: formattedDate);
                    }
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
                        color: isSelected
                            ? theme.primary
                            : theme.onPrimaryContainer.withOpacity(0.2),
                      ),
                    ),
                    alignment: isToday ? Alignment.center : const Alignment(-0.7, 0.9),
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        fontSize: isToday ? 19 : 16,
                        fontWeight: FontWeight.bold,
                        color: isToday || !isEmpty
                            ? theme.onSecondaryContainer
                            : theme.onPrimaryContainer,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
