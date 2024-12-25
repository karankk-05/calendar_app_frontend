import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/widgets/calendar_widget.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CalendarWidget();}
}