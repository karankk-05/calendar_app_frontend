import 'package:calendar_application/common/widgets/common_app_bar.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:calendar_application/features/home/widgets/calendar_legend.dart';
import 'package:calendar_application/features/home/widgets/calendar_screen.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/core/constants/gradients.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<CalendarController>(context, listen: false);
      controller.fetchSlots();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.surface,
      appBar: CommonAppBar(theme: theme),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Screen
            const CalendarScreen(),
            const SizedBox(height: 20),
            // Legends below the calendar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  LegendItem(
                    label: "All Empty Slots",
                    icon: Icons.check_circle_outline,
                    color: theme.onSurface,
                    gradient: isDarkMode
                        ? DarkGradients.EmptyGradient
                        : LightGradients.EmptyGradient,
                  ),const SizedBox(height: 10),
                  LegendItem(
                    label: "Available",
                    icon: Icons.check_circle_outline,
                    color: Colors.green,
                    gradient: isDarkMode
                        ? DarkGradients.PartiallyEmptyGradient
                        : LightGradients.PartiallyEmptyGradient,
                  ),
                  const SizedBox(height: 10),
                  LegendItem(
                    label: "Limited Slots",
                    icon: Icons.warning_amber,
                    color: Colors.orange,
                    gradient: isDarkMode
                        ? DarkGradients.PartiallyFullGradient
                        : LightGradients.PartiallyFullGradient,
                  ),
                  const SizedBox(height: 10),
                  LegendItem(
                    label: "Almost Full",
                    icon: Icons.dangerous_outlined,
                    color: Colors.red,
                    gradient: isDarkMode
                        ? DarkGradients.FullGradient
                        : LightGradients.FullGradient,
                  ),
                  const SizedBox(height: 10),
                  LegendItem(
                    label: "Current Date",
                    icon: Icons.calendar_today,
                    color: theme.onSurface,
                    gradient: isDarkMode
                        ? DarkGradients.isTodayGradient
                        : LightGradients.isTodayGradient,
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
