import 'package:flutter/material.dart';
import 'package:calendar_application/core/constants/gradients.dart';
import 'package:calendar_application/common/widgets/app_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
          const SizedBox(height: 30),
          AppButton(
            text: "Login",
            onPressed: () {},
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
