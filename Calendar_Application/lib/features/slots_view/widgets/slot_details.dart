import 'package:calendar_application/features/slots_view/widgets/slots_details_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendar_application/features/slots_view/controller/slot_details_service.dart';

class SlotsDetailsBottomSheet extends StatelessWidget {
  const SlotsDetailsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slotDetailsController = Provider.of<SlotDetailsController>(context);

    return DraggableScrollableSheet(
      minChildSize: 0.5,  // Start from half the screen
      maxChildSize: 1,    // Allow full-screen scroll
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          padding: const EdgeInsets.all(16.0),
          child: slotDetailsController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SlotDetailsView(
                  isLoading: slotDetailsController.isLoading,
                  slotDetails: slotDetailsController.slotDetails,
                  scrollController: scrollController,
                ),
        );
      },
    );
  }
}