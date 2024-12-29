import 'package:flutter/material.dart';
/// A dialog box that displays informational messages with a title and a message.
/// It contains an "OK" button to close the dialog after the user reads the information.

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;

  const InfoDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
