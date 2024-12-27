import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendar_application/features/slots_view/controller/slot_details_controller.dart';

void showSlotDetailsBottomSheet(
    BuildContext context, SlotDetailsController controller) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    backgroundColor: Colors.transparent, // Make the bottom sheet transparent
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.5,
        maxChildSize: 1.0,
        expand: true,
        builder: (context, scrollController) {
          return Consumer<SlotDetailsController>(
            builder: (context, slotController, child) {
              if (slotController.isLoading) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (slotController.slotDetails == null) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                  child: const Center(
                    child: Text('Failed to load slots'),
                  ),
                );
              }

              final slots = slotController.slotDetails?['slots'] ?? [];
              final filledSlots =
                  slots.map((slot) => slot['start_time']).toSet();

              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Slots for ${slotController.slotDetails?['date']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 48, // 24 hours * 2 slots per hour
                        itemBuilder: (context, index) {
                          final startHour = index ~/ 2;
                          final startMinute = (index % 2) * 30;
                          final startTime =
                              TimeOfDay(hour: startHour, minute: startMinute);
                          final endTime = TimeOfDay(
                            hour: (startHour + (startMinute + 30) ~/ 60) % 24,
                            minute: (startMinute + 30) % 60,
                          );
                          final formattedStartTime =
                              _formatTimeOfDay(startTime);
                          final formattedEndTime = _formatTimeOfDay(endTime);
                          final isFilled = filledSlots.contains(
                              '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}:00');

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            decoration: BoxDecoration(
                              color: isFilled
                                  ? Colors.green.shade100
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isFilled
                                    ? Colors.green
                                    : Colors.grey.shade400,
                              ),
                            ),
                            child: ListTile(
                              leading: Icon(
                                isFilled
                                    ? Icons.check_circle
                                    : Icons.access_time,
                                color:
                                    isFilled ? Colors.green : Colors.grey,
                              ),
                              title: Text(
                                '$formattedStartTime - $formattedEndTime',
                                style: TextStyle(
                                  fontWeight: isFilled
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isFilled
                                      ? Colors.green.shade800
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}

String _formatTimeOfDay(TimeOfDay time) {
  final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
}
