import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme.surface,
      elevation: 0,
      title: Text(
        "Calendar",
        style: TextStyle(
          color: theme.onSurface,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: theme.onSurface,
        ),
        onPressed: () {
          // Add your action for the navigation icon (e.g., opening a drawer or performing an action)
          print("Navigation Icon Pressed");
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: theme.onSurface,
          ),
          onPressed: () {
            // Add your action for the menu icon (e.g., opening a settings menu)
            print("Menu Icon Pressed");
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
