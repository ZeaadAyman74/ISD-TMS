import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/members/members_cubit.dart';

class TransferOwnershipDialog extends StatefulWidget {
  const TransferOwnershipDialog({super.key});

  @override
  State<TransferOwnershipDialog> createState() => _TransferOwnershipDialogState();
}

class _TransferOwnershipDialogState extends State<TransferOwnershipDialog> {
  BoardMember? selectedMember;

  @override
  Widget build(BuildContext context) {
    final boardCubit = context.read<BoardCubit>();
    final membersCubit = context.read<MembersCubit>();
    
    // Filter members to only those who are not the owner
    final availableMembers = boardCubit.members
        .where((m) => m.role != 'owner')
        .toList();

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.deepOrange,
                  size: 24.r,
                ),
                8.horizontalSpace,
                Text(
                  context.localization.transfer_ownership,
                  style: context.appTextTheme.font16TextPrimarySemiBold.copyWith(
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.deepOrange,
                    size: 20.r,
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Text(
                      context.localization.transfer_ownership_critical_warning,
                      style: context.appTextTheme.font13TextPrimaryMedium.copyWith(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Text(
              context.localization.transfer_ownership_description,
              style: context.appTextTheme.font13TextPrimaryMedium.copyWith(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
            20.verticalSpace,
            DropdownButtonFormField<BoardMember>(
              initialValue: selectedMember,
              isExpanded: true,
              borderRadius: BorderRadius.circular(12.r),
              decoration: InputDecoration(
                hintText: context.localization.select_new_owner,
                hintStyle: context.appTextTheme.font14TextSecondaryRegular,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                filled: true,
                fillColor: context.themeData.scaffoldBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.deepOrange, width: 1.5),
                ),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey.shade600,
                size: 24.w,
              ),
              items: availableMembers.map((m) {
                return DropdownMenuItem<BoardMember>(
                  value: m,
                  child: Text(
                    m.name,
                    style: context.appTextTheme.font14TextPrimarySemiBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMember = value;
                });
              },
            ),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade500,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  ),
                  child: Text(
                    context.localization.cancel,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                ),
                12.horizontalSpace,
                BlocConsumer<MembersCubit, MembersState>(
                  bloc: membersCubit,
                  listener: (context, state) {
                    if (state is TransferOwnershipSuccess) {
                      context.pop();
                    }
                  },
                  buildWhen: (previous, current) =>
                      current is TransferOwnershipLoading ||
                      current is TransferOwnershipSuccess ||
                      current is TransferOwnershipError,
                  builder: (context, state) {
                    final isLoading = state is TransferOwnershipLoading;
                    return ElevatedButton(
                      onPressed: selectedMember == null || isLoading
                          ? null
                          : () {
                              membersCubit.transferOwnership(userId: selectedMember!.userId);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                        disabledBackgroundColor: Colors.deepOrange.withValues(alpha: 0.5),
                      ),
                      child: isLoading
                          ? SizedBox(
                              width: 20.r,
                              height: 20.r,
                              child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                            )
                          : Text(
                              context.localization.transfer,
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                            ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
