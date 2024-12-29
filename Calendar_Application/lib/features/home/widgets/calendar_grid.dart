import 'package:flutter/material.dart';
import 'package:calendar_application/core/constants/gradients.dart';
import 'package:calendar_application/core/utils/calendar_color_util.dart';
import 'package:calendar_application/core/utils/date_time_utils.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:calendar_application/features/slots/controller/slot_details_service.dart';
import 'package:calendar_application/features/slots/widgets/slots_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CalendarGrid extends StatefulWidget {
  const CalendarGrid({super.key});

  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {

  // Get the legend icon for each day based on filled slots
  IconData _getLegendIcon(Map<String, int>? slots) {
    if (slots == null) return Icons.check_circle_outline; // Empty slots
    final totalSlots = slots['total_slots']!;
    final availableSlots = slots['available_slots']!;
    final filledSlotsRatio = (totalSlots - availableSlots) / totalSlots;

    if (filledSlotsRatio > 2 / 3) {
      return Icons.dangerous_outlined; // Fully booked
    } else if (filledSlotsRatio < 1 / 3) {
      return Icons.check_circle_outline; // Available
    } else {
      return Icons.warning_amber; // Partially full
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CalendarController>(context);
    final daysInMonth = controller.generateDaysInMonth();
    final slotData = controller.slotData;
    final theme = Theme.of(context).colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    return controller.isLoading
        ? const SizedBox(
            height: 500,
            child: Center(
              child: CircularProgressIndicator(),
            ),
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
              final formattedDate = formatDateforAPI(day);
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

              final icon = _getLegendIcon(slotData[formattedDate]);

              return GestureDetector(
                onTap: () {
                  controller.selectDay(day);
                  final slotDetailsController =
                      Provider.of<SlotDetailsController>(context, listen: false);

                  if (MediaQuery.of(context).size.width >= 700) {
                    slotDetailsController.fetchSlotDetails(userId: 'Lorem', date: formattedDate);
                  } else {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return ChangeNotifierProvider.value(
                          value: slotDetailsController,
                          child: const SlotsBottomSheet(),
                        );
                      },
                    );
                    slotDetailsController.fetchSlotDetails(userId: 'Lorem', date: formattedDate);
                  }
                },
                child: Stack(
                  children: [
                    Container(
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
                              ? theme.onError
                              : theme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    Positioned(bottom: 5,
                    right: 5,
                      child: Icon(
                          icon,
                          size: 13,
                          color: isEmpty ? theme.onPrimaryContainer : theme.onError,
                        ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
