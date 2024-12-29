import 'package:flutter/material.dart';
import 'package:calendar_application/core/constants/gradients.dart';

class LegendItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Gradient gradient;

  const LegendItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      children: [
        // Color indicator
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: gradient,
          ),
        ),
        const SizedBox(width: 5),
        // Icon
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 5),
        // Text label
        Text(
          label,
          style: TextStyle(color: theme.onSurface, fontSize: 14),
        ),
      ],
    );
  }
}
