import 'package:calendar_application/common/widgets/common_app_bar.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:calendar_application/features/slots_view/widgets/slots_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/widgets/calendar_screen.dart';
import 'package:calendar_application/features/slots_view/controller/slot_details_service.dart';
import 'package:provider/provider.dart';

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
    final theme=Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      appBar:  CommonAppBar(theme: theme),
      body: Row(
        children: [
          // Left Panel: Calendar Widget from CalendarScreen
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: const CalendarScreen(),
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
                      bottomLeft: Radius.circular(16),
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
