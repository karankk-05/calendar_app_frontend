///Class for defining light theme colors for the whole app

import 'package:flutter/material.dart';
class LightTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
      primary: Color.fromARGB(255, 61, 162, 244),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFE3F2FD),
      onPrimaryContainer: Color(0xFF0A84FF),
      secondary: Color(0xFF32D74B),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFC8FACD),
      onSecondaryContainer: Color(0xFF32D74B),
      surface: Color.fromARGB(255, 233, 238, 253),
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
  );
}
  