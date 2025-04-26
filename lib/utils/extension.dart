import 'package:flutter/material.dart';
import 'package:bookmark/ui/common/app_font.dart';

extension ThemeContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension FontThemeContextExtension on BuildContext {
  static final FontTheme _fontTheme = FontTheme();

  FontTheme get font => _fontTheme;
}
