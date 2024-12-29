import 'package:calendar_application/features/auth/screens/login_screen.dart';
import 'package:calendar_application/features/home/controllers/calendar_grid_controller.dart';
import 'package:calendar_application/features/home/screens/home_screen.dart';
import 'package:calendar_application/features/slots_view/controller/slot_details_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:calendar_application/themes/dark_theme.dart';
import 'package:calendar_application/themes/light_theme.dart';
import 'package:provider/provider.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that bindings are initialized before running the app
  String? username = await getUsernameFromStorage(); // Retrieve the username
  runApp(MyApp(username: username));
}

Future<String?> getUsernameFromStorage() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'username'); // Retrieve the username saved under 'username' key
}

class MyApp extends StatelessWidget {
  final String? username;
  static String baseUrl = 'https://winter-intern-task.onrender.com';
  const MyApp({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalendarController()),
        ChangeNotifierProvider(create: (_) => SlotDetailsController()),
      ],
       child:MaterialApp(
      title: 'Calendar Application',
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.system,
      // home: username == null || (!username!.contains('Karan') && !username!.contains('Lorem'))
      //     ? const LoginScreen()
      //     : const HomeScreen(), // Conditional redirection based on username
      home:const HomeScreen()
     ) );
  }
}
