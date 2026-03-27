import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: context.appColors.scaffoldBackground,
          border: Border.all(color: context.appColors.secondaryBackground),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: context.appColors.textSecondary),
            SizedBox(width: 4.w),
            Text(
              label,
              style: context.appTextTheme.font11TextSecondaryRegular,
            ),
            const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
