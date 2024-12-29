import 'package:calendar_application/common/controllers/menu_controller.dart';
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
          // Open a drawer or any other action for the menu icon
        },
      ),
      actions: [
        MenuActions(theme: theme),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
