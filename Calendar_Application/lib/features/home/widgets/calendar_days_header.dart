import 'package:flutter/material.dart';

class CalendarDaysHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const daysOfWeek = [ "Sun","Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: daysOfWeek
          .map((day) => Expanded(
                child: Center(child: Text(day, style: TextStyle(color: Colors.black),)),
              ))

          .toList(),
    );
  }
}
