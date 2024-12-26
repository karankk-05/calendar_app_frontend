import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/calendar_controller.dart';
import '../widgets/calendar_header.dart';
import '../widgets/calendar_days_header.dart';
import '../widgets/calendar_grid.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalendarController(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: SingleChildScrollView(  // Ensures content can scroll if needed
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,  // Aligns the content to the left
                children: [
                  CalendarHeader(),
                  const SizedBox(height: 16),
                  CalendarDaysHeader(),
                  const SizedBox(height: 15),
                  // Make sure CalendarGrid doesn't take up too much space
                  CalendarGrid()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
