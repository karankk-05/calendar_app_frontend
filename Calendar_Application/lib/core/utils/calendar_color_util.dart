import 'package:calendar_application/core/constants/gradients.dart';
import 'package:flutter/material.dart';

/// The `getDayColor` function returns a gradient based on the availability of slots for a specific day. 
/// It calculates the filled slots ratio and selects a gradient according to the percentage of filled slots, 
/// while considering the app’s theme (dark or light mode). 
/// The function provides different gradient colors for full, partially full, and empty days.

Gradient getDayColor(Map<String, int>? slots, bool isDarkMode) {
  if (slots == null) {
    return isDarkMode 
        ? DarkGradients.EmptyGradient 
        : LightGradients.EmptyGradient; // Default gradient when all slots are available
  }

  final totalSlots = slots['total_slots']!;
  final availableSlots = slots['available_slots']!;

  final filledSlotsRatio = (totalSlots - availableSlots) / totalSlots;

  if (filledSlotsRatio > 2 / 3) {
    return isDarkMode
        ? DarkGradients.FullGradient
        : LightGradients.FullGradient; // More than 2/3 slots are filled (Red for Full)
  } else if (filledSlotsRatio < 1 / 3) {
    return isDarkMode
        ? DarkGradients.PartiallyEmptyGradient
        : LightGradients.PartiallyEmptyGradient; // More than 2/3 slots are empty (Green for Partially Empty)
  } else {
    return isDarkMode
        ? DarkGradients.PartiallyFullGradient
        : LightGradients.PartiallyFullGradient; // Between 1/3 and 2/3 slots are filled (Orange for Partially Full)
  }
}
