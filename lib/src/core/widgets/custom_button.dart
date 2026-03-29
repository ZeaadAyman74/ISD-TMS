import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.isActive = true,
    this.titleStyle,
    this.child,
    this.borderColor,
    this.withBorder = false,
  });

  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final bool isLoading;
  final bool isActive;
  final TextStyle? titleStyle;
  final Widget? child;
  final Color? borderColor;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isLoading && isActive) {
          onTap();
        }
      },
      child: Container(
        height: height ?? 45.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: !isActive
              ? Colors.grey.shade400
              : backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          border: withBorder
              ? Border.all(
                  color: borderColor ?? AppColors.primary,
                  width: 1,
                )
              : null,
        ),
        child: isLoading
            ? const Center(
                child: CupertinoActivityIndicator(color: Colors.white),
              )
            : Center(
                child: child ??
                    Text(
                      title,
                      style: titleStyle ??
                          TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
              ),
      ),
    );
  }
}
