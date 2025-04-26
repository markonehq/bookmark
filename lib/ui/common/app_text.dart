import 'package:bookmark/utils/file_exporter.dart';

class AppText {
  final String text;
  final BuildContext context;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final String? fontFamily;
  final double? height;
  final bool? softwrap;
  AppText(this.text, this.context,
      {this.color,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.textAlign,
      this.maxLines,
      this.fontFamily,
      this.height,
      this.softwrap});

  Widget _buildText(
    String text, {
    required double fontSize,
    required Color color,
    FontWeight? weight,
    TextOverflow? overflow,
    TextAlign? textAlign,
    bool underline = false,
    String? fontFamily,
  }) =>
      Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily ?? "Gilroy",
          fontSize: fontSize.sp,
          color: color,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          height: height,
        ),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softwrap,
      );

  /// This is a heading1 with a font size of 28 and a weight of 600
  Widget get heading1 => _buildText(
        text,
        fontSize: fontSize ?? 28.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  /// This is a heading2 with a font size of 26 and a weight of 600
  Widget get heading2 => _buildText(
        text,
        fontSize: fontSize ?? 26.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  /// This is a heading3 with a font size of 20 and a weight of 600
  Widget get heading3 => _buildText(
        text,
        fontSize: fontSize ?? 20.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
      );

  /// This is a heading4 with a font size of 22 and a weight of 400
  Widget get heading4 => _buildText(
        text,
        fontSize: fontSize ?? 22.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w400,
        overflow: overflow,
        textAlign: textAlign,
      );

  /// This is a heading5 with a font size of 20 and a weight of 400
  Widget get heading5 => _buildText(
        text,
        fontSize: fontSize ?? 20.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w400,
        overflow: overflow,
        textAlign: textAlign,
      );

  /// This is a body1 with a font size of 18 and a weight of 600
  Widget get body1 => _buildText(
        text,
        fontSize: fontSize ?? 18.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
      );

  /// This is body2 with a font size of 16 and a weight of 500
  Widget get body2 => _buildText(
        text,
        fontSize: fontSize ?? 16.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w500,
        overflow: overflow,
        textAlign: textAlign,
      );

  /// This is body3 with a font size of 14 and a weight of 500
  Widget get body3 => _buildText(
        text,
        fontSize: fontSize ?? 14.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w500,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  /// This is body4 with a font size of 14 and a weight of 500
  Widget get body4 => _buildText(
        text,
        fontSize: fontSize ?? 14.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w500,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  /// This is body5 with a font size of 12 and a weight of 400
  Widget get body5 => _buildText(
        text,
        fontSize: fontSize ?? 12.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w500,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  Widget get title4 => _buildText(
        text,
        fontSize: fontSize ?? 18.sp,
        color: color ?? context.colorScheme.text,
        weight: fontWeight ?? FontWeight.w500,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );
}
