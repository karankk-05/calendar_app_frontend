import 'package:flutter/material.dart';

class SlotDetailsView extends StatelessWidget {
  final bool isLoading;
  final Map<String, dynamic>? slotDetails;
  final ScrollController scrollController;

  const SlotDetailsView({
    Key? key,
    required this.isLoading,
    required this.slotDetails,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (slotDetails == null) {
      return const Center(
        child: Text(
          'No Slots Booked For This Date',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    final slots = slotDetails!['slots'] ?? [];
    final filledSlots = slots.map((slot) => slot['start_time']).toSet();

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Available Slots for ${slotDetails?['date']}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(24, (hour) {
              // Get the two slots for the current hour
              final firstSlotKey =
                  '${hour.toString().padLeft(2, '0')}:00:00';
              final secondSlotKey =
                  '${hour.toString().padLeft(2, '0')}:30:00';

              final isFirstSlotFilled = filledSlots.contains(firstSlotKey);
              final isSecondSlotFilled = filledSlots.contains(secondSlotKey);

              // If both slots are empty, combine into one hour block
              if (!isFirstSlotFilled && !isSecondSlotFilled) {
                return _buildTimelineRow(
                  timeLabel: '${_formatHour(hour)} ${_formatHour(hour + 1)}',
                  isFilled: false,
                );
              }

              // Otherwise, split into two half-hour blocks
              return Column(
                children: [
                  _buildTimelineRow(
                    timeLabel: '${_formatHour(hour)} ${_formatHour(hour, 30)}',
                    isFilled: isFirstSlotFilled,
                  ),
                  _buildTimelineRow(
                    timeLabel: '${_formatHour(hour, 30)} ${_formatHour(hour + 1)}',
                    isFilled: isSecondSlotFilled,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineRow({
    required String timeLabel,
    required bool isFilled,
  }) {
    return Row(
      children: [
        // Time Label
        Container(
          alignment: Alignment.centerLeft,
          width: 70,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            timeLabel,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 8),
        // Timeline Slot
        Expanded(
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              color: isFilled ? Colors.red : Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                isFilled ? 'Filled' : 'Available',
                style: TextStyle(
                  fontSize: 14,
                  color:  Colors.white ,
                  fontWeight: isFilled ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _formatHour(int hour, [int minute = 0]) {
    final period = hour >= 12 ? 'PM' : 'AM';
    final formattedHour = hour % 12 == 0 ? 12 : hour % 12;
    final formattedMinute = minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute $period';
  }
}
