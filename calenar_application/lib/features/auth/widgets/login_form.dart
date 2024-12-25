import 'package:calendar_application/common/widgets/info_dialog.dart';
import 'package:calendar_application/features/auth/controllers/login_controller.dart';
import 'package:calendar_application/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:calendar_application/core/constants/gradients.dart';
import 'package:calendar_application/common/widgets/app_button.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  void _onLoginPressed() async {
    final username = _usernameController.text.trim();
    final isValid = await LoginController.validateUsername(username, _rememberMe);

    if (isValid) {
      
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
      builder: (context) => HomeScreen(),
      ),
    );
    } else {
      showDialog(
        context: context,
        builder: (context) => InfoDialog(
          title: "Error",
          message: "Incorrect Username. Please try again.",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: theme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.primary),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, .2),
                  blurRadius: 20.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: theme.primary),
                    ),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username (Enter Provided Username)",
                      hintStyle: TextStyle(color: theme.onSurface),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password (You can leave it empty)",
                      hintStyle: TextStyle(color: theme.onSurface),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
              Text(
                "Remember Me",
                style: TextStyle(color: theme.onSurface),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AppButton(
            text: "Login",
            onPressed: _onLoginPressed,
            gradient: theme.brightness == Brightness.dark
                ? DarkGradients.buttonGradient
                : LightGradients.buttonGradient,
          ),
          const SizedBox(height: 30),
          Text(
            "Forgot Password?",
            style: TextStyle(color: theme.onSurface),
          ),
        ],
      ),
    );
  }
}
