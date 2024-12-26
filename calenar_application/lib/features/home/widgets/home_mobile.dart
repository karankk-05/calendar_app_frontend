import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/screens/calendar_screen.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
    @override
  void initState() {
    super.initState();
    // Initially fetch slots when the grid is built
    final controller = Provider.of<CalendarController>(context, listen: false);
    controller.fetchSlots();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Schedule",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
      body: CalendarScreen());
    }
}