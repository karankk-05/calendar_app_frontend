import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// This controller manages login functionality, including username validation 
/// and secure storage for the "Remember Me" feature.

class LoginController {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<bool> validateUsername(String username, bool rememberMe) async {
    if (username == 'Lorem') {
      if (rememberMe) {
        await _secureStorage.write(key: 'username', value: username);
      }
      return true;
    }
    return false;
  }
}
