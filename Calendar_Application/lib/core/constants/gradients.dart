import 'package:flutter/material.dart';

class DarkGradients {
  // A soothing gradient for buttons (unchanged)
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF4A90E2), Color(0xFF1C4E80)], // Light to dark blue
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  // A gradient indicating "today" with reduced contrast blue tones
  static const LinearGradient isTodayGradient = LinearGradient(
    colors: [Color(0xFF195EA9), Color(0xFF0C3E67)], // Muted bright blue to navy
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A gradient for empty days with softened dark grey tones
  static const LinearGradient EmptyGradient = LinearGradient(
    colors: [Color(0xFF0A1327), Color(0xFF0A1327)], // Subtle dark grey
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A gradient for partially empty days with muted teal tones
  static const LinearGradient PartiallyEmptyGradient = LinearGradient(
    colors: [Color(0xFF219E7A), Color(0xFF155E4C)], // Muted light to dark teal
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A gradient for fully booked days with softer red tones
  static const LinearGradient FullGradient = LinearGradient(
    colors: [Color(0xFFE25C5C), Color(0xFF8B2E2E)], // Soft red to dark crimson
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A gradient for partially booked days with softened amber tones
  static const LinearGradient PartiallyFullGradient = LinearGradient(
    colors: [Color(0xFFDB8841), Color(0xFFA85D23)], // Muted orange to burnt orange
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // A bonus gradient for selected days with reduced purple contrast
  static const LinearGradient SelectedDayGradient = LinearGradient(
    colors: [Color(0xFF4F3A8A), Color(0xFF28195E)], // Muted deep purple tones
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

