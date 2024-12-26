import 'package:flutter/material.dart';

Color getDayColor(Map<String, int>? slots) {
  if (slots == null) {
    return Colors.green; // Default color when all slots are available
  }

  final totalSlots = slots['total_slots']!;
  final availableSlots = slots['available_slots']!;

  final filledSlotsRatio = (totalSlots - availableSlots) / totalSlots;

  if (filledSlotsRatio > 2 / 3) {
    return Colors.red; // More than 2/3 slots are filled
  } else if (filledSlotsRatio < 1 / 3) {
    return Colors.green; // More than 2/3 slots are empty
  } else {
    return Colors.pink; // Between 1/3 and 2/3 slots are filled
  }
}
