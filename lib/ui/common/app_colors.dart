import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  // General Colors
  Color get black => const Color(0xFF252525);
  Color get white => const Color(0xFFF3F3F3);

  // Primary Colors
  Color get primaryBrandColor => const Color(0xFFFFDB52);

  // Secondary Colors
  // static const Color secondary = Color(0xFFFF5722);
  // static const Color secondaryLight = Color(0xFFFF8A50);
  // static const Color secondaryDark = Color(0xFFD84315);

  // Accent Colors
  Color get beigeAccent => const Color(0xFFF6CB92);
  Color get lightBeigeAccent => const Color(0xFFFDF1D9);
  Color get blueAccent => const Color(0xFF0000F5);
  Color get darkGreenAccent => const Color(0xFF225453);

  // Background Colors
  Color get backgroundLight => white;
  Color get backgroundDark => black;
  Color get scaffoldColor =>
      brightness == Brightness.dark ? backgroundDark : backgroundLight;

  // Text Colors
  Color get textLight => black;
  Color get textDark => white;
  Color get text => Brightness.light == brightness ? textLight : textDark;

  // Secondary Text Colors
  Color get secondaryTextLight => const Color(0xFF787880);
  Color get secondaryTextDark => const Color(0xFF787880);
  Color get secondaryText =>
      Brightness.light == brightness ? secondaryTextLight : secondaryTextDark;

  // Card Colors
  Color get cardLight => const Color(0xFFFFFFFF);
  Color get cardDark => const Color(0xFF1C1C1C);
  Color get card => Brightness.light == brightness ? cardLight : cardDark;

  // Others
  Color get grey => const Color(0xFF787880);

  // Error Colors
  Color get error => const Color(0xFFB7463E);

  // Success Colors
  Color get success => const Color(0xFF4CAF50);

  // Warning Colors
  Color get warning => const Color(0xFFFF9800);

  // Bottom Nav
  Color get bottomNavActive => const Color(0xFF5FCF80);
  Color get bottomNavInactive => const Color(0xFFa6a6a7);

  // Navigation Bar
  // Color get bottomNavBarBg => brightness == Brightness.dark ? black : white;
  // Color get unSelectedBottomNavIcon => const Color(0xFFA0A0A0);
  // Color get selectedBottomNavIcon => primaryColor;
  // Color get selectedBottomNavIconbg => primaryColor.withOpacity(0.4);
}
