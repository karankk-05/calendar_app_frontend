import 'package:calendar_application/core/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// The SlotsDetails widget displays the details of available or booked slots for a specific date.
/// It shows a loading animation if data is being fetched, and displays the slots in a list format when data is available.
/// The widget also provides visual feedback on whether a slot is available or booked.

class SlotsDetails extends StatelessWidget {
  final bool isLoading;
  final Map<String, dynamic>? slotDetails;
  final ScrollController scrollController;

  const SlotsDetails({
    super.key,
    required this.isLoading,
    required this.slotDetails,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    if (isLoading) {
      return 
    Center(
      child: Lottie.asset(
        'assets/lottie_animation/dark_loading.json',
        width: 250,
        height: 250,
        fit: BoxFit.fill,
      ),
    );
    }

    if (slotDetails == null) {
      return Center(
        child: Text(
          'No Slots Booked For This Date',
          style: TextStyle(fontSize: 16, color: theme.onSurface),
        ),
      );
    }

    final formattedDate = formatDate(slotDetails?['date']); // Use extracted function
    final slots = slotDetails!['slots'] ?? [];
    final filledSlots = slots.map((slot) => slot['start_time']).toSet();

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Available Slots for $formattedDate',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.onSurface,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(24, (hour) {
              final firstSlotKey = '${hour.toString().padLeft(2, '0')}:00:00';
              final secondSlotKey = '${hour.toString().padLeft(2, '0')}:30:00';

              final isFirstSlotFilled = filledSlots.contains(firstSlotKey);
              final isSecondSlotFilled = filledSlots.contains(secondSlotKey);

              if (!isFirstSlotFilled && !isSecondSlotFilled) {
                return _buildTimelineRow(
                  timeLabel: '${formatHour(hour)} ${formatHour(hour + 1)}', // Use extracted function
                  isFilled: false,
                  theme: theme,
                );
              }

              return Column(
                children: [
                  _buildTimelineRow(
                    timeLabel: '${formatHour(hour)} ${formatHour(hour, 30)}', // Use extracted function
                    isFilled: isFirstSlotFilled,
                    theme: theme,
                  ),
                  _buildTimelineRow(
                    timeLabel: '${formatHour(hour, 30)} ${formatHour(hour + 1)}', // Use extracted function
                    isFilled: isSecondSlotFilled,
                    theme: theme,
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
    required ColorScheme theme,
  }) {
    final isDarkMode = theme.brightness == Brightness.dark;
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 70,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            timeLabel,
            style: TextStyle(
              fontSize: 14,
              color: theme.onSurface.withOpacity(0.8),
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 40,
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? (isFilled
                      ? const Color(0xFFFA7268).withOpacity(0.8)
                      : const Color(0xFF69C779).withOpacity(0.8))
                  : (isFilled ? const Color(0xFFE53935) : const Color(0xFF43A047)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                isFilled ? 'Booked' : 'Available',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
