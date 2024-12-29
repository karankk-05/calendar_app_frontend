import 'package:calendar_application/core/responsive/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/features/auth/widgets/login_mobile.dart';
import 'package:calendar_application/features/auth/widgets/login_desktop.dart';

/// This widget provides a responsive login screen, adapting to both 
/// mobile and desktop devices by using platform-specific layouts.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: LoginMobile(),
      desktop: LoginDesktop(),
    );
  }
}
