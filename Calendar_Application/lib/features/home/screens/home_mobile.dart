import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/widgets/calendar_screen.dart';
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
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        backgroundColor: theme.surface,
        elevation: 0,
        title:  Text(
          "Schedule",
          style: TextStyle(
            color: theme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu
          ,color: theme.onSurface,), // Navigation Icon
          onPressed: () {
            // Add your action for the navigation icon (e.g., opening a drawer or performing an action)
            print("Navigation Icon Pressed");
          },
          color: theme.primary, // Icon color (blue if theme is blue)
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert,color: theme.onSurface,), // Menu Icon
            onPressed: () {
              // Add your action for the menu icon (e.g., opening a settings menu)
              print("Menu Icon Pressed");
            },
            color: theme.primary, // Icon color (blue if theme is blue)
          ),
        ],
      ),
      body: const CalendarScreen(),
    );
  }
}
