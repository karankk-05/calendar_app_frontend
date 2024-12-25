import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/widgets/calendar_widget.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CalendarWidget();
  }
}