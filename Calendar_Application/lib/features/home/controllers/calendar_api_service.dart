import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:calendar_application/core/utils/date_time_utils.dart';
import 'package:calendar_application/main.dart';
import 'package:http/http.dart' as http;

/// The CalendarService class handles API interactions to fetch slot data.
/// It makes HTTP GET requests to retrieve available slots for specified dates.
/// Includes error handling for network, timeout, and unexpected issues.
/// Returns data in a structured Map for further processing.

class CalendarService {
  final String baseUrl = MyApp.baseUrl;

  Future<Map<String, Map<String, int>>> fetchSlots(String userId, DateTime startDate, DateTime endDate) async {
    final url = '$baseUrl/slots/total/?user_id=$userId&start_date=${formatDateforAPI(startDate)}&end_date=${formatDateforAPI(endDate)}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'accept': 'application/json'},
      ).timeout(const Duration(seconds: 90)); 
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
      throw const HttpException('No Internet connection');
    } on TimeoutException {
      throw const HttpException('Request timed out');
    } catch (e) {
      throw HttpException('Unexpected error: $e');
    }
  }

  
}
