/// This file contains the implementation of the ResponsiveBuilder widget, 
/// which returns different widgets based on the screen width.
library;

import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveBuilder({super.key, 
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 770) {
      return desktop;
    } else {
      return mobile;
    }
  }
}
