import 'package:flutter/material.dart';

/// The CalendarDaysHeader widget displays the days of the week (Sunday to Saturday) as a row.
/// It ensures a consistent style with the app's theme and provides a header for the calendar grid.
class CalendarDaysHeader extends StatelessWidget {
  const CalendarDaysHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context).colorScheme;
    const daysOfWeek = [ "Sun","Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: daysOfWeek
          .map((day) => Expanded(
                child: Center(child: Text(day, style: TextStyle(color: theme.onPrimaryContainer),)),
              ))

          .toList(),
    );
  }
}
