import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/calendar_grid_controller.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CalendarController>(context);
    final theme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: controller.previousMonth,
          child: Container(
            decoration: BoxDecoration(
              color: theme.primaryContainer,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: theme.onPrimaryContainer.withOpacity(0.3)),
            ),
            padding: const EdgeInsets.all(12),
            child:  Icon(
              Icons.chevron_left,
              size: 28,
              color:  theme.onPrimaryContainer,
            ),
          ),
        ),
        Text(
          "${controller.getMonthName()} ${controller.focusedDay.year}",
          style:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: theme.onPrimaryContainer,
          ),
        ),
        GestureDetector(
          onTap: controller.nextMonth,
          child: Container(
            decoration: BoxDecoration(
              color: theme.primaryContainer,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: theme.onPrimaryContainer.withOpacity(0.3)),
            ),
            padding: const EdgeInsets.all(12),
            child:  Icon(
              Icons.chevron_right,
              size: 28,
              color: theme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
