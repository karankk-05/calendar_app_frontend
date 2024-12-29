import 'package:flutter/material.dart';
///Class for defining dark theme colors for the whole app
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
      surface: Color.fromARGB(255, 8, 15, 40),
      onSurface: Colors.white,
      error: Color(0xFFFF453A),
      onError: Colors.black,
      brightness: Brightness.dark,
    ),
  );
}
