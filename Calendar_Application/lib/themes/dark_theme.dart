import 'package:flutter/material.dart';

/// This file defines the dark theme configuration for the application.
/// It includes color schemes and styles used when the app is in dark mode.
class DarkTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
      primary: Color.fromARGB(255, 10, 57, 128),
      onPrimary: Colors.white,
      primaryContainer: Color.fromARGB(255, 2, 7, 36),
      onPrimaryContainer: Color.fromARGB(255, 210, 221, 231),
      secondary: Color.fromARGB(255, 50, 119, 215),
      onSecondary: Colors.black,
      secondaryContainer: Color.fromARGB(255, 30, 47, 83),
      onSecondaryContainer: Color.fromARGB(255, 236, 244, 250),
      surface: Color.fromARGB(255, 10, 20, 53),
      onSurface: Colors.white,
      error: Color(0xFFFF453A),
      onError: Color.fromARGB(255, 255, 255, 255),
      brightness: Brightness.dark,
    ),
  );
}
