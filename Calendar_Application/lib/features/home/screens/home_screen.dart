import 'package:calendar_application/core/responsive/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/screens/home_mobile.dart';
import 'package:calendar_application/features/home/screens/home_desktop.dart';

/// The HomeScreen widget determines the layout based on screen size.
/// Utilizes the ResponsiveBuilder to render either the desktop or mobile layout.
/// Ensures seamless UI transitions across different devices.

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: HomeMobile(),
      desktop: HomeDesktop(),
    );
  }
}
