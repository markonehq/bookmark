import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontTheme {
  static const String _defaultFont = 'Gilroy';

  TextStyle display({
    Color? color,
    FontWeight fontWeight = FontWeight.w300,
    double fontSize = 42,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle header({
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

  TextStyle eventCard({
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = 30,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle title({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
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

  TextStyle title2({
    Color? color,
    FontWeight fontWeight = FontWeight.w300,
    double fontSize = 22,
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

  TextStyle medium({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
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

  TextStyle paragraph({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 20,
    String fontFamily = _defaultFont,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle body({
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

  TextStyle caption({
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

  TextStyle small({
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
}
