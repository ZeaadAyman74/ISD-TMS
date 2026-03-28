import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/data/models/task_utils.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/task_card/task_status_chip.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/header/task_status_drop_down.dart';

class TaskDetailHeader extends StatelessWidget {
  const TaskDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      buildWhen: (previous, current) =>
          current.status == TaskDetailsStatus.updateCard,
      builder: (context, state) {
        final card=context.read<TaskDetailsCubit>().currentCard;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: context.appColors.appBarBackground,
            border: Border(
              bottom: BorderSide(
                color: context.appColors.secondaryBackground,
                width: 0.5,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        TaskStatusChip(
                          label: card!.type ?? 'task',
                          icon: TaskUtils.getTypeIcon(card.type),
                          color: TaskUtils.getTypeColor(card.type),
                        ),
                        TaskStatusChip(
                          label: card.priority ?? 'medium',
                          icon: TaskUtils.getTypeIcon(card.priority),
                          color: TaskUtils.getPriorityColor(card.priority),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              12.verticalSpace,
              StatusDropdown(card: card),
            ],
          ),
        );
      },
    );
  }
}
