import 'package:calendar_application/core/responsive/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/screens/home_mobile.dart';
import 'package:calendar_application/features/home/screens/home_desktop.dart';

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
