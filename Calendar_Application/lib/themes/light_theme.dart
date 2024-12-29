import 'package:flutter/material.dart';


/// This file defines the light theme configuration for the application.
/// It includes color schemes and styles used when the app is in light mode.

class LightTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
      primary: Color.fromARGB(255, 61, 162, 244),
      onPrimary: Colors.white,
      primaryContainer: Color.fromARGB(255, 255, 255, 255),
      onPrimaryContainer: Color.fromARGB(255, 0, 0, 0),
      secondary: Color(0xFF32D74B),
      onSecondary: Colors.white,
      secondaryContainer: Color.fromARGB(255, 221, 240, 252),
      onSecondaryContainer: Color.fromARGB(255, 0, 0, 0),
      surface: Color.fromARGB(255, 233, 247, 253),
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
  );
}
  