import 'package:calendar_application/core/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/login.dart';
import 'package:calendar_application/themes/dark_theme.dart';
import 'package:calendar_application/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false).updateTheme(context);
    return MaterialApp(
      title: 'Flutter Theming',
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.system, // Automatically switch based on system settings
      home:  const Login(),
    );
  }
}
