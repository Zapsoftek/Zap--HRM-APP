import 'package:flutter/material.dart';

class AppColors {
  // Primary and Secondary Colors
  static const Color primaryColor = Color(0xFFB98C51);
  static const Color secondaryColor = Color(0xFF03DAC6);

  // Background Colors
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardColor = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF4285F4);

  // Error Colors
  static const Color errorColor = Color(0xFFB00020);

  // Success Colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color appBarColor = Color(0xFFFBBC05);

  // Custom Shades
  static MaterialColor primarySwatch = const MaterialColor(
    0xFF6200EA,
    {
      50: Color(0xFFF2E7FE),
      100: Color(0xFFD7B7FC),
      200: Color(0xFFBB86FC),
      300: Color(0xFF985EFF),
      400: Color(0xFF7F39FB),
      500: Color(0xFF6200EA),
      600: Color(0xFF5600E8),
      700: Color(0xFF3700B3),
      800: Color(0xFF30009C),
      900: Color(0xFF23036A),
    },
  );

  static var primaryColorLight;
}
