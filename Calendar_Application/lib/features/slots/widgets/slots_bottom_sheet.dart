import 'package:calendar_application/features/slots/widgets/slots_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:calendar_application/features/slots/controller/slot_details_service.dart';

/// The SlotsBottomSheet widget displays the slot details in a draggable sheet that can be scrolled. 
/// It shows either a loading animation or the available slot details based on the loading state. 
/// The widget adjusts its appearance based on the current theme of the app.

class SlotsBottomSheet extends StatelessWidget {
  const SlotsBottomSheet({super.key});

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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          padding: const EdgeInsets.all(16.0),
          child: slotDetailsController.isLoading
              ?  Center(child: Lottie.asset(
        'assets/lottie_animation/dark_loading.json',
        width: 250,
        height: 250,
        fit: BoxFit.fill,
      ),)
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