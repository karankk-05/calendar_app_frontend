import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/auth/widgets/login_form.dart';
import 'package:calendar_application/core/constants/asset_paths.dart';

class LoginDesktop extends StatelessWidget {
  const LoginDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          // Left Section: Images and Welcome Text
          Expanded(
            child: Stack(
              children: [
                // Background Image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: isDarkMode
                          ? const AssetImage(AssetPaths.darkBackground)
                          : const AssetImage(AssetPaths.lightBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Positioned Images
                Positioned(
                  left: 50,
                  width: 100,
                  height: 250,
                  child: FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetPaths.light1),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 200,
                  width: 100,
                  height: 200,
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetPaths.light2),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 100,
                  top: 100,
                  width: 120,
                  height: 200,
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetPaths.clock),
                        ),
                      ),
                    ),
                  ),
                ),
                // Welcome Text
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Right Section: Login Form
          Expanded(
            child: Center(
              child: Container(
                width: 400,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.surface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow:  [
                    BoxShadow(
                      color: theme.onSurface.withOpacity(0.3),
                      
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Login Header
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Login Form
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
