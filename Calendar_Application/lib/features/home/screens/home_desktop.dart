import 'package:calendar_application/common/widgets/common_app_bar.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:calendar_application/features/home/widgets/calendar_legend.dart';
import 'package:calendar_application/features/slots/widgets/slots_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/widgets/calendar_screen.dart';
import 'package:calendar_application/features/slots/controller/slot_details_service.dart';
import 'package:provider/provider.dart';
import 'package:calendar_application/core/constants/gradients.dart';

/// The HomeDesktop widget defines the desktop layout for the calendar application.
/// Includes a calendar widget, legends for slot availability, and a details panel.
/// Adapts its UI based on the current theme (light or dark).
/// Fetches slot data on initialization using the CalendarController.

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
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
    // Create a scroll controller
    final ScrollController scrollController = ScrollController();
    final theme = Theme.of(context).colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.surface,
      appBar: CommonAppBar(theme: theme),
      body: Row(
        children: [
          // Left Panel: Calendar Widget and Legends
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // Calendar Screen
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.surface,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: const CalendarScreen(),
                  ),
                ),
                // Legends
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row with three legends
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LegendItem(
                              label: "Available",
                              icon: Icons.check_circle_outline,
                              color: Colors.green,
                              gradient: isDarkMode
                                  ? DarkGradients.PartiallyEmptyGradient
                                  : LightGradients.PartiallyEmptyGradient,
                            ),
                            LegendItem(
                              label: "Limited Slots",
                              icon: Icons.warning_amber,
                              color: Colors.orange,
                              gradient: isDarkMode
                                  ? DarkGradients.PartiallyFullGradient
                                  : LightGradients.PartiallyFullGradient,
                            ),
                            LegendItem(
                              label: "Almost Full",
                              icon: Icons.dangerous_outlined,
                              color: Colors.red,
                              gradient: isDarkMode
                                  ? DarkGradients.FullGradient
                                  : LightGradients.FullGradient,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Bottom row with two legends
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LegendItem(
                              label: "Current Date",
                              icon: Icons.calendar_today,
                              color: theme.onSurface,
                              gradient: isDarkMode
                                  ? DarkGradients.isTodayGradient
                                  : LightGradients.isTodayGradient,
                            ),
                            LegendItem(
                              label: "All Empty Slots",
                              icon: Icons.check_circle_outline,
                              color: theme.onSurface,
                              gradient: isDarkMode
                                  ? DarkGradients.EmptyGradient
                                  : LightGradients.EmptyGradient,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Right Panel: Details or Events Panel
          Expanded(
            flex: 1,
            child: Consumer<SlotDetailsController>(
              builder: (context, slotDetailsController, _) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: theme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SlotsDetails(
                          isLoading: slotDetailsController.isLoading,
                          slotDetails: slotDetailsController.slotDetails,
                          scrollController: scrollController, // Pass the scrollController here
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
