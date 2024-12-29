import 'package:calendar_application/common/widgets/manual_date_dialog.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuActions extends StatelessWidget {
  const MenuActions({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: theme.secondaryContainer,
      
      icon: Icon(Icons.more_vert, color: theme.onSurface),
      onSelected: (value) {
        if (value == 'jump_to_date') {
          _showManualDateDialog(context);
        } else if (value == 'jump_to_today') {
          _jumpToToday(context);
        }
      },
      itemBuilder: (context) => [
         PopupMenuItem(
          
          value: 'jump_to_date',
          child: Text('Jump to Date',style: TextStyle(color: theme.onSecondaryContainer),),
        ),
         PopupMenuItem(
          value: 'jump_to_today',
          child: Text('Jump to Today',style: TextStyle(color: theme.onSecondaryContainer),),
        ),
      ],
    );
  }

  void _jumpToToday(BuildContext context) {
    final controller = Provider.of<CalendarController>(context, listen: false);
    controller.focusedDay = DateTime.now();
    controller.fetchSlots(); // Fetch slots for the current month
  }

  void _showManualDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return const ManualDateDialog();
      },
    );
  }
}
