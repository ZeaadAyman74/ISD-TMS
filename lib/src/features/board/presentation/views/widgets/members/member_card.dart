import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key,required this.member});
final BoardMember member;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Text(
          _getInitials(member.name),
          style: context.appTextTheme.font14TextPrimarySemiBold.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
      title: Text(
        member.name,
        style: context.appTextTheme.font14TextPrimarySemiBold,
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

  String _getInitials(String fullName) {
    if (fullName.isEmpty) return '?';
    final parts = fullName.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return fullName[0].toUpperCase();
  }
}
