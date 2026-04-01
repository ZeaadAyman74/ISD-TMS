import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_utils.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.member});

  final BoardMember member;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        radius: 20.r,
        child: Text(
          member.initials,
          style: context.appTextTheme.font14TextPrimarySemiBold.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
      title: Row(
        children: [
          Text(
            member.name,
            style: context.appTextTheme.font14TextPrimarySemiBold,
          ),
          if(HiveUtils.user?.id==member.userId)
          ...[8.horizontalSpace,Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              context.localization.you,
              style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          )],
        ],
      ),
      subtitle: Text(
        member.email ?? 'No email',
        style: context.appTextTheme.font11TextSecondaryRegular,
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          member.role ?? 'Member',
          style: context.appTextTheme.font11TextSecondaryRegular,
        ),
      ),
    );
  }
}
