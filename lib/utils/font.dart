import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourappname/ui/common/app_colors.dart';
import 'package:yourappname/utils/extension.dart';

class FontTheme {
  TextStyle display(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 42.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? context.colorScheme.text,
    );
  }

  TextStyle header(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 34.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? context.colorScheme.text,
    );
  }

  TextStyle eventCard(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 30.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? context.colorScheme.text,
    );
  }

  TextStyle title(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 28.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? context.colorScheme.text,
    );
  }

  TextStyle title2(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 22.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? context.colorScheme.text,
    );
  }

  TextStyle paragraph(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 20.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? context.colorScheme.text,
    );
  }

  TextStyle body(BuildContext context, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? context.colorScheme.text,
    );
  }

  TextStyle caption(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? context.colorScheme.text,
    );
  }

  TextStyle small(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Gilroy',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? context.colorScheme.text,
    );
  }
}
