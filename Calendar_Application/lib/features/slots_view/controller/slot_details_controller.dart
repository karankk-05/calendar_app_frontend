import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SlotDetailsController with ChangeNotifier {
  bool isLoading = false;
  Map<String, dynamic>? slotDetails;

  Future<void> fetchSlotDetails({required String userId, required String date}) async {
    isLoading = true;
    notifyListeners();

    final url =
        'https://winter-intern-task.onrender.com/slots/details?user_id=$userId&date=$date';

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
