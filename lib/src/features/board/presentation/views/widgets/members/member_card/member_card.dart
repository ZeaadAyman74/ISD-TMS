import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_utils.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/member_card/delete_member_button.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/member_card/role_drop_down.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/member_card/transfer_ownership_button.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    super.key,
    required this.member,
    required this.canDeleteMember,
    required this.canChangeRole,
    required this.roles,
    required this.onRoleChanged,
    required this.onDelete,
  });

  final BoardMember member;
  final bool canDeleteMember;
  final bool canChangeRole;
  final List<ProjectRoleModel> roles;
  final void Function(ProjectRoleModel role) onRoleChanged;
  final VoidCallback onDelete;

  bool get _isCurrentUser => HiveUtils.user?.id == member.userId;

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
          Flexible(
            child: Text(
              member.name,
              style: context.appTextTheme.font14TextPrimarySemiBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (_isCurrentUser) ...[
            8.horizontalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                context.localization.you,
                style:
                    context.appTextTheme.font11TextSecondaryRegular.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(
        member.email ?? context.localization.no_email,
        style: context.appTextTheme.font11TextSecondaryRegular,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if ((member.role !='owner') && canChangeRole)
            RoleDropdown(
              member: member,
              roles: roles,
              onRoleChanged: onRoleChanged,
            )
          else
            _RoleChip(role: member.role ?? context.localization.member_role_chip),
          if (canDeleteMember &&  member.role!='owner') ...[
            4.horizontalSpace,
            DeleteMemberButton(onDelete: onDelete),
          ],
          if(canChangeRole && member.role=='owner')...[
            4.horizontalSpace,
            const TransferOwnershipButton()
          ]
        ],
      ),
    );
  }
}


class _RoleChip extends StatelessWidget {
  const _RoleChip({required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color:role=='owner'?AppColors.error.withValues(alpha: .1): Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        role,
        style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
          color: role=='owner'?AppColors.error:null
        ),
      ),
    );
  }
}


