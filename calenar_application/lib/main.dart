import 'package:calendar_application/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/themes/dark_theme.dart';
import 'package:calendar_application/themes/light_theme.dart';
void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Calendar Application',
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}

