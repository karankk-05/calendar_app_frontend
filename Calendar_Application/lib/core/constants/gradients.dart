import 'package:flutter/material.dart';

class DarkGradients {
  // A soothing gradient for buttons
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF4A90E2), Color(0xFF1C4E80)], // Light to dark blue
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  // A gradient indicating "today" with a cool blue tone
  static const LinearGradient isTodayGradient = LinearGradient(
    colors: [Color(0xFF0A74DA), Color(0xFF042B5C)], // Bright blue to navy
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A gradient for empty days with subtle dark grey tones
  static const LinearGradient EmptyGradient = LinearGradient(
    colors: [Color.fromARGB(255, 2, 7, 36), Color.fromARGB(255, 2, 7, 36)], // Subtle dark grey
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A gradient for partially empty days with fresh teal tones
  static const LinearGradient PartiallyEmptyGradient = LinearGradient(
    colors: [Color.fromARGB(255, 32, 201, 105), Color.fromARGB(255, 18, 138, 68)], // Light to dark teal
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A gradient for fully booked days with striking red tones
  static const LinearGradient FullGradient = LinearGradient(
    colors: [Color(0xFFFF4D4D), Color(0xFFB22222)], // Bright red to deep crimson
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A gradient for partially booked days with warm amber tones
  static const LinearGradient PartiallyFullGradient = LinearGradient(
    colors: [Color(0xFFFFA726), Color(0xFFD2691E)], // Orange to burnt orange
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A bonus gradient for selected days
  static const LinearGradient SelectedDayGradient = LinearGradient(
    colors: [Color(0xFF673AB7), Color(0xFF311B92)], // Deep purple tones
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );
}


class LightGradients {
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color.fromARGB(255, 33, 153, 252), Color.fromARGB(255, 109, 188, 252)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );
  static const LinearGradient isTodayGradient = LinearGradient(
    colors: [Color.fromARGB(255, 148, 186, 238), Color.fromARGB(255, 38, 148, 191)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient EmptyGradient = LinearGradient(
    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)], // Grey for Empty
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient PartiallyEmptyGradient = LinearGradient(
    colors: [Color.fromARGB(255, 90, 228, 102), Color.fromARGB(255, 7, 116, 22)], // Green for Partially Empty
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient FullGradient = LinearGradient(
    colors: [Color.fromARGB(255, 255, 0, 0), Color.fromARGB(255, 200, 0, 0)], // Red for Full
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient PartiallyFullGradient = LinearGradient(
    colors: [Color.fromARGB(255, 255, 165, 0), Color.fromARGB(255, 255, 140, 0)], // Orange for Partially Full
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
