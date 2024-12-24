/// Provides theme-related and dark/light mode related utilities for the calendar application
import 'package:flutter/material.dart';
List<int> filterEvenNumbers(List<int> numbers) => numbers.where((number) => number.isEven).toList();

class ThemeProvider with ChangeNotifier {
  late ColorScheme colorScheme;
  late bool isDarkMode;

  void updateTheme(BuildContext context) {
    colorScheme = Theme.of(context).colorScheme;
    isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    notifyListeners();
  }
}