import 'package:flutter/material.dart';
import 'package:calendar_application/features/home/widgets/calendar_screen.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Desktop Calendar Interface'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Row(
        children: [
          // Left Panel: Calendar Widget from CalendarScreen
          Expanded(
            flex: 1,
            child: Container(height: 500,
            width: 500,
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: const CalendarScreen(), // Integrating your CalendarScreen
            ),
          ),

          // Right Panel: Details or Events Panel
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5, // Example: Number of events/tasks
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.blueGrey[700],
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ListTile(
                            title: Text(
                              'Event ${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'Details for event ${index + 1}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            trailing: Icon(
                              Icons.event,
                              color: Colors.blue[200],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
