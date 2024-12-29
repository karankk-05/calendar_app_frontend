import 'package:intl/intl.dart';

/// Formats a time into a readable string like "12:30 PM".
String formatHour(int hour, [int minute = 0]) {
  final period = hour >= 12 ? 'PM' : 'AM';
  final formattedHour = hour % 12 == 0 ? 12 : hour % 12;
  final formattedMinute = minute.toString().padLeft(2, '0');
  return '$formattedHour:$formattedMinute $period';
}

/// Formats a date string (YYYY-MM-DD) into "23 February, 2024".
String formatDate(String? date) {
  if (date == null || date.isEmpty) {
    return 'Invalid Date';
  }
  try {
    final parsedDate = DateTime.parse(date);
    return DateFormat('d MMMM, yyyy').format(parsedDate);
  } catch (e) {
    return 'Invalid Date';
  }
    
}
String formatDateforAPI(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
