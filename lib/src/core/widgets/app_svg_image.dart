import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSVGImage extends StatelessWidget {
  const AppSVGImage(
      {super.key,
        required this.image,
        this.boxFit,
        this.height,
        this.width,
        this.color});

  final String image;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height?? 22.h,
      width: width?? 22.h,
      fit: boxFit ?? BoxFit.contain,
      colorFilter: color != null
          ? ColorFilter.mode(
        color!,
        BlendMode.srcIn,
      )
          : null,
    );
  }
}
