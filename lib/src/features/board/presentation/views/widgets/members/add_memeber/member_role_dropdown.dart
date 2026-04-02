import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';

class MemberRoleDropdown extends StatelessWidget {
  const MemberRoleDropdown({
    super.key,
    required this.selectedRole,
    required this.roles,
    required this.onChange,
  });

  final ProjectRoleModel? selectedRole;
  final List<ProjectRoleModel> roles;
  final void Function(ProjectRoleModel? value) onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ProjectRoleModel?>(
      isExpanded: true,
      isDense: true,
      borderRadius: 12.br,
      decoration: InputDecoration(
        labelText: context.localization.role,
        labelStyle: context.appTextTheme.font14TextSecondaryRegular,
        hintText: context.localization.assign_members,
        hintStyle: context.appTextTheme.font14TextSecondaryRegular,
        filled: true,
        fillColor: AppColors.primaryLight.withValues(alpha: 0.3),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: context.themeData.dividerColor,
        size: 25.w,
      ),
      hint: Text(
         context.localization.select_role,
        style: context.appTextTheme.font13TextPrimaryMedium,
      ),
      dropdownColor: context.appColors.scaffoldBackground,
      onChanged: onChange,
      initialValue: selectedRole,
      items: roles
          .map(
            (e) => DropdownMenuItem<ProjectRoleModel?>(
          value: e,
          child: Text(
            e.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.font14TextPrimarySemiBold,
          ),
        ),
      )
          .toList(),
    );
  }
}
