import 'package:flutter/material.dart';
///This file defines the visual appearance of various calendar day states, 
///buttons, and selections. It includes different color gradients for both light and 
///dark themes, helping to visually differentiate between states like "fully booked," 
///"partially empty," or "selected day."
class DarkGradients {
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF4A90E2), Color(0xFF1C4E80)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  static const LinearGradient isTodayGradient = LinearGradient(
    colors: [Color(0xFF195EA9), Color(0xFF0C3E67)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient EmptyGradient = LinearGradient(
    colors: [Color(0xFF0A1327), Color(0xFF0A1327)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient PartiallyEmptyGradient = LinearGradient(
    colors: [Color(0xFF219E7A), Color(0xFF155E4C)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient FullGradient = LinearGradient(
    colors: [Color(0xFFE25C5C), Color(0xFF8B2E2E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient PartiallyFullGradient = LinearGradient(
    colors: [Color(0xFFDB8841), Color(0xFFA85D23)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient SelectedDayGradient = LinearGradient(
    colors: [Color(0xFF4F3A8A), Color(0xFF28195E)],
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
    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient PartiallyEmptyGradient = LinearGradient(
    colors: [Color.fromARGB(255, 90, 228, 102), Color.fromARGB(255, 7, 116, 22)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient FullGradient = LinearGradient(
    colors: [Color.fromARGB(255, 255, 0, 0), Color.fromARGB(255, 200, 0, 0)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient PartiallyFullGradient = LinearGradient(
    colors: [Color.fromARGB(255, 255, 165, 0), Color.fromARGB(255, 255, 140, 0)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
