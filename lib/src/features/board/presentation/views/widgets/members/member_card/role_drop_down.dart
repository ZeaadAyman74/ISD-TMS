import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';

class RoleDropdown extends StatelessWidget {
  const RoleDropdown({super.key,
    required this.member,
    required this.roles,
    required this.onRoleChanged,
  });

  final BoardMember member;
  final List<ProjectRoleModel> roles;
  final void Function(ProjectRoleModel role) onRoleChanged;

  @override
  Widget build(BuildContext context) {
    final availableRoles = roles
        .where((m) => m.value != 'owner')
        .toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: member.role,
          isDense: true,
          borderRadius: BorderRadius.circular(8.r),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18.w,
            color: Colors.grey.shade600,
          ),
          style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
            color: Colors.black87,
          ),
          dropdownColor: context.appColors.scaffoldBackground,
          items: availableRoles
              .map(
                (role) => DropdownMenuItem<String>(
              value: role.value,
              child: Text(
                role.label,
                style: context.appTextTheme.font11TextSecondaryRegular
                    .copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
              .toList(),
          onChanged: (newRoleValue) {
            if (newRoleValue != null && newRoleValue != member.role) {
              final selectedRole = roles.firstWhere(
                    (r) => r.value == newRoleValue,
              );
              onRoleChanged(selectedRole);
            }
          },
        ),
      ),
    );
  }
}

