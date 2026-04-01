import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/models/task_utils.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/task_card/task_assignee_avatars.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/task_card/task_status_chip.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_detail_args.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key, required this.card,this.canDelete=true});

  final CardModel card;
  final bool canDelete;

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<BoardCubit>();
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.taskDetail,
          arguments: TaskDetailArgs(
            card: card,
            project: cubit.currentProject!,
            boardCubit: context.read<BoardCubit>(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: context.appColors.cardBackground,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title & Actions
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    card.title,
                    style: context.appTextTheme.font14TextPrimarySemiBold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if(canDelete)
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      showDialog(
                        context: context,
                        builder: (confirmContext) => AlertDialog(
                          title: const Text('Delete Task'),
                          content: const Text(
                              'Are you sure you want to delete this task?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(confirmContext),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(confirmContext);
                                context.read<BoardCubit>().deleteTask(card.id);
                              },
                              child: const Text('Delete',
                                  style: TextStyle(color: AppColors.error)),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline,
                              color: AppColors.error, size: 20),
                          SizedBox(width: 8),
                          Text('Delete',
                              style: TextStyle(color: AppColors.error)),
                        ],
                      ),
                    ),
                  ],
                  child: Icon(Icons.more_vert,
                      size: 20.r, color: context.appColors.textSecondary),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Chips Row
            Row(
              children: [
                TaskStatusChip(
                  label: card.type ?? 'task',
                  color: TaskUtils.getTypeColor(card.type),
                  icon: TaskUtils.getTypeIcon(card.type),
                ),
                SizedBox(width: 8.w),
                TaskStatusChip(
                  label: card.priority ?? 'medium',
                  color: TaskUtils.getPriorityColor(card.priority),
                  icon: TaskUtils.getPriorityIcon(card.priority),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Footer: Metadata & Assignees
            Row(
              children: [
                if (card.dueDate != null) ...[
                  Icon(Icons.access_time, size: 14.r, color: AppColors.textSecondary),
                  SizedBox(width: 4.w),
                ],
                if (card.commentsCount > 0) ...[
                  Icon(Icons.chat_bubble_outline, size: 14.r, color: AppColors.textSecondary),
                  SizedBox(width: 4.w),
                  Text(
                    '${card.commentsCount}',
                    style: context.appTextTheme.font11TextSecondaryRegular,
                  ),
                ],
                const Spacer(),
                if (card.assignees.isNotEmpty)
                  TaskAssigneeAvatars(assignees: card.assignees),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



