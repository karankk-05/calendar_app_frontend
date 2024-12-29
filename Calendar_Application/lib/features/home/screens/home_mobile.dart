import 'package:calendar_application/common/widgets/common_app_bar.dart';
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
      appBar:CommonAppBar(theme: theme),
      body: const CalendarScreen(),
    );
  }
}
