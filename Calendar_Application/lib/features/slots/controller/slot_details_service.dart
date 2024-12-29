import 'dart:convert';
import 'package:calendar_application/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// The SlotDetailsController fetches slot details for a given user and date from the server. 
/// It manages the loading state and stores the fetched data. 
/// This class provides functionality to update the UI based on the fetched slot details.

class SlotDetailsController with ChangeNotifier {
  bool isLoading = false;
  Map<String, dynamic>? slotDetails;
  final _baseUrl=MyApp.baseUrl;

  Future<void> fetchSlotDetails({required String userId, required String date}) async {
    isLoading = true;
    notifyListeners();

    final url =
        '$_baseUrl/slots/details?user_id=$userId&date=$date';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        slotDetails = json.decode(response.body);
      } else {
        slotDetails = null;
      }
    } catch (e) {
      slotDetails = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
