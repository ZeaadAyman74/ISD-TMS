import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageShimmer extends StatelessWidget {
  const ImageShimmer(
      {super.key,
        this.width,
        this.height,
        this.baseColor,
        this.highlightColor,});

  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? const Color(0xFFF7F7F7),
      highlightColor: highlightColor ?? const Color(0xFFD6D6D6),
      child: Container(
        width: width,
        height: height,
        color:  highlightColor,
      ),
    );
  }
}
