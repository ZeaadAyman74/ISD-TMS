import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';

class DeleteMemberButton extends StatelessWidget {
  const DeleteMemberButton({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: onDelete,
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Icon(
          Icons.remove_circle_outline,
          color: AppColors.error,
          size: 20.w,
        ),
      ),
    );
  }
}