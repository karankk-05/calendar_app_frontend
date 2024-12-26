import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:calendar_application/main.dart';
import 'package:http/http.dart' as http;

class CalendarService {
  final String baseUrl = MyApp().baseUrl;

  Future<Map<String, Map<String, int>>> fetchSlots(String userId, DateTime startDate, DateTime endDate) async {
    final url = '$baseUrl/slots/total/?user_id=$userId&start_date=${_formatDate(startDate)}&end_date=${_formatDate(endDate)}';
    print("Fetching in service");
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'accept': 'application/json'},
      ).timeout(const Duration(seconds: 30)); // Add timeout
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        return {
          for (var slot in data)
            slot['date']: {
              'total_slots': slot['total_slots'],
              'available_slots': slot['available_slots'],
            }
        };
      } else {
        throw HttpException('Failed to fetch slots: ${response.reasonPhrase}');
      }
    } on SocketException {
      throw HttpException('No Internet connection');
    } on TimeoutException {
      throw HttpException('Request timed out');
    } catch (e) {
      throw HttpException('Unexpected error: $e');
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
