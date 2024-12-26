import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/calendar_grid_controller.dart';

class CalendarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CalendarController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: controller.previousMonth,
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
          "${controller.getMonthName()} ${controller.focusedDay.year}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        GestureDetector(
          onTap: controller.nextMonth,
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
    );
  }
}
