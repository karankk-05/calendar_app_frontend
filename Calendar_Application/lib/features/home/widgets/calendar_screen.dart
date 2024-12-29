import 'package:flutter/material.dart';
import 'calendar_header.dart';
import 'calendar_days_header.dart';
import 'calendar_grid.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: SingleChildScrollView(  // Ensures content can scroll if needed
        child: Container(
          decoration: BoxDecoration(
            color: theme.primaryContainer,
            boxShadow: [
              BoxShadow(
                color: theme.onSurface.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  // Aligns the content to the left
              children: [
                CalendarHeader(),
                SizedBox(height: 16),
                CalendarDaysHeader(),
                SizedBox(height: 15),
                // Make sure CalendarGrid doesn't take up too much space
                CalendarGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
