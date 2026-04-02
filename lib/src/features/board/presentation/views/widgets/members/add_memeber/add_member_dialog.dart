import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/custom_button.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/add_member/add_member_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/members/members_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/add_memeber/add_member_bloc_listener.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/add_memeber/member_role_dropdown.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/add_memeber/members_search_dropdown.dart';

class AddMemberDialog extends StatelessWidget {
  const AddMemberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final membersCubit = context.read<MembersCubit>();
    final addMemberCubit = context.read<AddMemberCubit>();
    return AddMemberBlocListener(
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: context.appColors.primary,
                    size: 24.r,
                  ),
                  8.horizontalSpace,
                  Text(
                    context.localization.add_member,
                    style: context.appTextTheme.font18TextPrimarySemiBold,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(
                      Icons.close,
                      size: 20.r,
                      color: context.appColors.textHint,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              const MembersSearchDropdown(),
              15.verticalSpace,
              MemberRoleDropdown(
                selectedRole: addMemberCubit.selectedRole,
                roles: membersCubit.roles,
                onChange: addMemberCubit.selectRole,
              ),
              30.verticalSpace,
              BlocBuilder(
                bloc: addMemberCubit,
                buildWhen: (previous, current) =>
                    current is AddMemberError ||
                    current is AddMemberSuccess ||
                    current is AddMemberLoading,
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                      addMemberCubit.addMember(membersCubit.currentProject!.id);
                    },
                    isLoading: state is AddMemberLoading,
                    title: context.localization.add,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
