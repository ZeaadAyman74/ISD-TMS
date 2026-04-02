import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/add_member/add_member_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/members/members_cubit.dart';

class MembersSearchDropdown extends StatefulWidget {
  const MembersSearchDropdown({super.key});
  @override
  State<MembersSearchDropdown> createState() => _MembersSearchDropdownState();
}

class _MembersSearchDropdownState extends State<MembersSearchDropdown> {
  MembersCubit get membersCubit => context.read<MembersCubit>();
  AddMemberCubit get cubit => context.read<AddMemberCubit>();

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<BoardMember>(
      selectedItem: cubit.selectedMember,
      compareFn: (item1, item2) => item1.userId == item2.userId,
      itemAsString: (member) => member.name,
      items: (filter, infiniteScrollProps) {
        return cubit.searchInMembers(membersCubit.currentProject!.id,filter);
      },
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: context.localization.assign_members,
          labelStyle: context.appTextTheme.font14TextSecondaryRegular,
          hintText: context.localization.assign_members,
          hintStyle: context.appTextTheme.font14TextSecondaryRegular,
          prefixIcon: Icon(
            Icons.person_search_rounded,
            color: AppColors.primary,
            size: 22.r,
          ),
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
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        fit: FlexFit.loose,
        constraints: BoxConstraints(maxHeight: 300.h),
        menuProps: MenuProps(
          borderRadius: BorderRadius.circular(12.r),
          elevation: 4,
        ),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: context.localization.assign_members,
            hintStyle: context.appTextTheme.font14TextSecondaryRegular,
            prefixIcon: Icon(Icons.search, size: 20.r, color: AppColors.textHint),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        itemBuilder: (context, member, isSelected, isHighlighted) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryLight.withValues(alpha: 0.5)
                  : isHighlighted
                      ? AppColors.primaryLight.withValues(alpha: 0.2)
                      : Colors.transparent,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.12),
                  backgroundImage:
                      member.photo != null ? NetworkImage(member.photo!) : null,
                  child: member.photo == null
                      ? Text(
                          member.initials,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : null,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        member.name,
                        style: context.appTextTheme.font14TextPrimaryRegular,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (member.email != null) ...[
                        SizedBox(height: 2.h),
                        Text(
                          member.email!,
                          style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                if (member.role != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      member.role!,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                if (isSelected)
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.w),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.primary,
                      size: 20.r,
                    ),
                  ),
              ],
            ),
          );
        },
        loadingBuilder: (context, searchEntry) => Padding(
          padding: EdgeInsets.all(16.w),
          child: const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        ),
        emptyBuilder: (context, searchEntry) => Padding(
          padding: EdgeInsets.all(24.w),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person_off_rounded,
                    size: 40.r, color: AppColors.textHint),
                SizedBox(height: 8.h),
                Text(
                 context.localization.no_members_found,
                  style: context.appTextTheme.font14TextSecondaryRegular,
                ),
              ],
            ),
          ),
        ),
        errorBuilder: (context, searchEntry, exception) => Padding(
          padding: EdgeInsets.all(24.w),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline_rounded,
                    size: 40.r, color: AppColors.error),
                SizedBox(height: 8.h),
                Text(
                  context.localization.failed_to_load_members,
                  style: context.appTextTheme.font14TextSecondaryRegular,
                ),
              ],
            ),
          ),
        ),
      ),
      onChanged: (value) {
        cubit.selectedMember = value;
      },
    );
  }
}
