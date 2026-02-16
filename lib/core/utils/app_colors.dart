import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryValue = 0xFF282a51;

  static const MaterialColor primary =
      MaterialColor(_primaryValue, <int, Color>{
        50: Color(0xFFeaeace),
        100: Color(0xFFbcbdc9),
        200: Color(0xFF9c9daf),
        300: Color(0xFF6f708a),
        400: Color(0xFF535574),
        500: Color(_primaryValue),
        600: Color(0xFF24264a),
        700: Color(0xFF1c1e3a),
        800: Color(0xFF16172d),
        900: Color(0xFF111222),
      });
  static LinearGradient secondary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFE406F), Color(0xFFFD6B38)],
  );
  static const Color textcolor = Color(0xFF1A1A1A);

  // Added for AppTextStyle compatibility
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color textPrimary = textcolor;
  static const Color textSecondary = Colors.grey;
  static const Color lightGray = Color(0xFFE0E0E0); // Colors.grey[300]
  static const Color darkGray = Color(0xFF616161); // Colors.grey[700]
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const MaterialColor brandPrimary = primary;
  static const Color brandSecondary = Color(0xFFFD6B38); // From gradient end
  static const Color splashBackground = Color(
    0xFF282a51,
  ); // From gradient start
}
