import 'package:calendar_application/features/slots/widgets/slots_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendar_application/features/slots/controller/slot_details_service.dart';

class SlotsBottomSheet extends StatelessWidget {
  const SlotsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slotDetailsController = Provider.of<SlotDetailsController>(context);
    final theme=Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      minChildSize: 0.5,  // Start from half the screen
      maxChildSize: 1,    // Allow full-screen scroll
      builder: (context, scrollController) {
        return Container(
          decoration:  BoxDecoration(
            color: theme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          padding: const EdgeInsets.all(16.0),
          child: slotDetailsController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SlotsDetails(
                  isLoading: slotDetailsController.isLoading,
                  slotDetails: slotDetailsController.slotDetails,
                  scrollController: scrollController,
                ),
        );
      },
    );
  }
}