/// This file contains gradient constants for dark and light themes.

import 'package:flutter/material.dart';

class DarkGradients{
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color.fromARGB(255, 118, 146, 202), Color.fromARGB(255, 63, 104, 186)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    
    
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF32D74B), Color(0xFF32D74B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class LightGradients{
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color.fromARGB(255, 33, 153, 252), Color.fromARGB(255, 109, 188, 252)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF32D74B), Color(0xFF32D74B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}


