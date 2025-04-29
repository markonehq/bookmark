import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmer({
  double width = double.infinity,
  double height = 150.0,
  BorderRadiusGeometry borderRadius =
      const BorderRadius.all(Radius.circular(12)),
  bool isCircle = false,
  Color baseColor = const Color(0xFFE0E0E0),
  Color highlightColor = const Color(0xFFF5F5F5),
}) {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: isCircle ? null : borderRadius,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
    ),
  );
}
