import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ManualDateDialog extends StatelessWidget {
  const ManualDateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    final controller = Provider.of<CalendarController>(context, listen: false);
    final theme=Theme.of(context).colorScheme;
    return AlertDialog(
      backgroundColor: theme.secondaryContainer,
      title: const Text("Enter Date"),
      content: TextField(
        controller: dateController,
        decoration:  InputDecoration(
          labelStyle: TextStyle(color: theme.onSecondaryContainer),
          labelText: "Date (dd/mm/yyyy)",
          hintText: "e.g., 25/12/2024",
        ),
        keyboardType: TextInputType.datetime,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child:  Text("Cancel",style: TextStyle(color:theme.onSecondaryContainer,)),
        ),
        TextButton(
          onPressed: () {
            final input = dateController.text;
            if (RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(input)) {
              final parts = input.split('/');
              final day = int.parse(parts[0]);
              final month = int.parse(parts[1]);
              final year = int.parse(parts[2]);

              final selectedDate = DateTime(year, month, day);
              controller.focusedDay = selectedDate;
              controller.fetchSlots(); // Update slots for the new month
              Navigator.of(context).pop(); // Close the dialog
            } else {
              // Show error message if format is invalid
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Invalid date format. Use dd/mm/yyyy."),
                ),
              );
            }
          },
          child:  Text("Confirm", style: TextStyle(color:theme.onSecondaryContainer,)),
        ),
      ],
    );
  }
}
