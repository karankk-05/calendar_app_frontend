import 'package:calendar_application/core/responsive/responsive_builder.dart';
import 'package:calendar_application/features/slots/widgets/slots_detail_widget.dart';
import 'package:flutter/material.dart';

/// The SlotDetailsScreen widget displays slot details in a responsive layout.
/// It adapts to different screen sizes by showing a bottom sheet for mobile and a dialog for desktop.
/// It uses the SlotsDetails widget to display available or booked slots.

class SlotDetailsScreen extends StatelessWidget {
  final bool isLoading;
  final Map<String, dynamic>? slotDetails;

  const SlotDetailsScreen({
    super.key,
    required this.isLoading,
    required this.slotDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _buildMobileView(context),
      desktop: _buildDesktopView(context),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.5,
        maxChildSize: 1.0,
        expand: true,
        builder: (_, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: SlotsDetails(
              isLoading: isLoading,
              slotDetails: slotDetails,
              scrollController: scrollController,
            ),
          );
        },
      ),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 200),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SlotsDetails(
          isLoading: isLoading,
          slotDetails: slotDetails,
          scrollController: ScrollController(),
        ),
      ),
    );
  }
}
