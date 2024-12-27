import 'package:flutter/material.dart';

class DarkGradients {
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color.fromARGB(255, 118, 146, 202), Color.fromARGB(255, 63, 104, 186)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );
  static const LinearGradient isTodayGradient = LinearGradient(
    colors: [Color.fromARGB(255, 4, 25, 79), Color.fromARGB(255, 6, 35, 67)],
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
