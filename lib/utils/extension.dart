import 'package:flutter/material.dart';
import 'package:yourappname/utils/font.dart';

extension BuildContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension FontThemeExtension on BuildContext {
  FontTheme get font {
    return FontTheme();
  }
}
