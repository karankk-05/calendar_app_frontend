import 'package:http/http.dart' as http;
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:calendar_application/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:calendar_application/themes/dark_theme.dart';
import 'package:calendar_application/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  checkInternetConnection();
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that bindings are initialized before running the app
  String? username = await getUsernameFromStorage(); // Retrieve the username
  runApp(MyApp(username: username));
}

Future<String?> getUsernameFromStorage() async {
  final storage = FlutterSecureStorage();
  
  return await storage.read(key: 'username'); // Retrieve the username saved under 'username' key
}

class MyApp extends StatelessWidget {
  final String? username;
  final String baseUrl="https://winter-intern-task.onrender.com";

  const MyApp({super.key,this.username});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalendarController(), // Wrap the app with the provider
      child: MaterialApp(
        title: 'Calendar Application',
        theme: LightTheme.theme,
        darkTheme: DarkTheme.theme,
        themeMode: ThemeMode.system,
        home: HomeScreen(),
      ),
    );
  }
}


void checkInternetConnection() async {
  try {
    final response = await http.get(Uri.parse('https://www.google.com'));
    if (response.statusCode == 200) {
      print("Internet is available");
    } else {
      print("Unable to reach the server");
    }
  } catch (e) {
    print("No internet connection: $e");
  }
}

