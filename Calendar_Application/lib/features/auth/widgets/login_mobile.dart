import 'package:animated_analog_clock/animated_analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/auth/widgets/login_form.dart';
import 'package:calendar_application/core/constants/asset_paths.dart';


/// The LoginMobile widget provides a mobile-specific login interface, 
/// incorporating animations and a responsive design for smaller screens.
/// Handles the mobile layout of the login screen.
class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> with SingleTickerProviderStateMixin {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: isDarkMode
                      ? const AssetImage(AssetPaths.darkBackground)
                      : const AssetImage(AssetPaths.lightBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  // Elastic slide-in animation for image 1
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
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
                    left: 140,
                    width: 80,
                    height: 150,
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
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: SlideTransition(
                      position: _imageSlide3,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetPaths.clock),
                          ),
                        ),
                        child:   Center(
        child: AnimatedAnalogClock(
          location: 'Asia/Kolkata',
          size: 150,
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
                  // Elastic slide-in animation for "Login" text
                  Positioned(
                    child: SlideTransition(
                      position: _textSlide,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100),
                          Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
