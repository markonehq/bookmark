import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontTheme {
  static const String _defaultFont = 'Gilroy';

  // Header styles
  TextStyle h1({
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    double fontSize = 34,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle h2({
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = 28,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle h3({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
    double fontSize = 22,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle h4({
    Color? color,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = 18,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle h5({
    Color? color,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = 16,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Body styles
  TextStyle b1({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 16,
    String fontFamily = _defaultFont,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  TextStyle b2({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 14,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle b3({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 12,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle b4({
    Color? color,
    FontWeight fontWeight = FontWeight.w300,
    double fontSize = 10,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle b5({
    Color? color,
    FontWeight fontWeight = FontWeight.w300,
    double fontSize = 8,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
