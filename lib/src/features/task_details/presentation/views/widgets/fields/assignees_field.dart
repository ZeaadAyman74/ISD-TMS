import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/widgets/custom_field_label.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/member_selector_bottom_sheet.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class AssigneesField extends StatelessWidget {
  const AssigneesField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      buildWhen: (previous, current) => current is UpdateCard,
      builder: (context, state) {
        final card = context.read<TaskDetailsCubit>().currentCard;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomFieldLabel(label:  'Assigned'),
            Wrap(
              spacing: -8.w,
              runSpacing: 4.h,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...card!.assignees
                    .take(4)
                    .map(
                      (a) =>
                      CircleAvatar(
                        radius: 12.r,
                        backgroundColor: AppColors.primary.withValues(
                            alpha: 0.15),
                        child: Text(
                          a.initials,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                ),

                if (card.assignees.isNotEmpty) SizedBox(width: 12.w),
                InkWell(
                  onTap: () =>
                      _showMemberSelector(context, card.id, card.assignees),
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.appColors.secondaryBackground,
                    ),
                    child: const Icon(Icons.add, size: 16),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showMemberSelector(BuildContext context,
      int cardId,
      List<CardAssignee> selectedAssignees,) {
    final cubit = context.read<BoardCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          MemberSelectorBottomSheet(
            allMembers: cubit.members,
            selectedMemberIds: selectedAssignees.map((a) => a.id).toList(),
            onSelectionChanged: (newIds) {
              cubit.updateTask(
                cardId: cardId,
                data: UpdateTaskModel(assignees: newIds),
              );
            },
          ),
    );
  }
}
