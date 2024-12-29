import 'package:flutter/material.dart';
/// A custom button widget that supports a gradient background, text display, and a loading state.
/// The button can be disabled during loading, showing a progress indicator instead of the text.

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient gradient;
  final bool isLoading; // New parameter to indicate loading state

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.gradient,
    this.isLoading = false, // Default is not loading
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: isLoading ? null : onPressed, // Disable button when loading
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white, // Loader color
                  strokeWidth: 2.5,    // Thickness of the loader
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
