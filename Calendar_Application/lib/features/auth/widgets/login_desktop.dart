import 'package:animated_analog_clock/animated_analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/auth/widgets/login_form.dart';
import 'package:calendar_application/core/constants/asset_paths.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageSlide1;
  late Animation<Offset> _imageSlide2;
  late Animation<Offset> _imageSlide3;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3200), // Faster animation
      vsync: this,
    );

    // Define elastic animations
    _imageSlide1 = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start off-screen to the left
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _imageSlide2 = Tween<Offset>(
      begin: const Offset(0.0, -1.0), // Start off-screen at the top
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _imageSlide3 = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start off-screen to the right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _textSlide = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start off-screen at the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          // Left Section: Animated Images, Clock, and Welcome Text
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
                // Elastic slide-in animation for image 1
                Positioned(
                  left: 50,
                  width: 100,
                  height: 250,
                  child: SlideTransition(
                    position: _imageSlide1,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetPaths.light1),
                        ),
                      ),
                    ),
                  ),
                ),
                // Elastic slide-in animation for image 2
                Positioned(
                  left: 200,
                  width: 100,
                  height: 200,
                  child: SlideTransition(
                    position: _imageSlide2,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetPaths.light2),
                        ),
                      ),
                    ),
                  ),
                ),
                // Elastic slide-in animation for image 3
                Positioned(
                  right: 100,
                  top: 100,
                  width: 120,
                  height: 200,
                  child: SlideTransition(
                    position: _imageSlide3,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetPaths.clock),
                        ),
                      ),
                      child: Center(
                        child: AnimatedAnalogClock(
                          location: 'Asia/Kolkata',
                          size: 220,
                          backgroundColor: theme.onPrimary,
                          hourHandColor: theme.primary,
                          minuteHandColor: theme.primary,
                          secondHandColor: Colors.amber,
                          centerDotColor: Colors.amber,
                          hourDashColor: Colors.lightBlue,
                          minuteDashColor: Colors.blueAccent,
                          dialType: DialType.numbers,
                          numberColor: theme.onPrimary,
                          extendHourHand: true,
                          extendMinuteHand: true,
                        ),
                      ),
                    ),
                  ),
                ),
                // Elastic slide-in animation for "Welcome" text
                Center(
                  child: SlideTransition(
                    position: _textSlide,
                    child: const Text(
                      "Welcome",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                  boxShadow: [
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
