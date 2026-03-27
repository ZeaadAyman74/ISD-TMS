import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/models/task_detail_args.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key, required this.card, required this.projectId});

  final CardModel card;
  final int projectId;

  Color get _typeColor {
    switch (card.type?.toLowerCase()) {
      case 'task':
        return AppColors.taskColor;
      case 'bug':
        return AppColors.bugColor;
      case 'story':
        return AppColors.storyColor;
      case 'improvement':
        return AppColors.improvementColor;
      default:
        return AppColors.primary;
    }
  }

  IconData get _typeIcon {
    switch (card.type?.toLowerCase()) {
      case 'task':
        return Icons.check_box_outlined;
      case 'bug':
        return Icons.bug_report_outlined;
      case 'story':
        return Icons.book_outlined;
      case 'improvement':
        return Icons.trending_up;
      default:
        return Icons.task_alt;
    }
  }

  Color _getPriorityColor(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'high':
        return AppColors.highPriority;
      case 'medium':
        return AppColors.mediumPriority;
      case 'low':
        return AppColors.lowPriority;
      default:
        return AppColors.textSecondary;
    }
  }

  IconData _getPriorityIcon(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'high':
        return Icons.keyboard_double_arrow_up;
      case 'medium':
        return Icons.trending_flat;
      case 'low':
        return Icons.keyboard_double_arrow_down;
      default:
        return Icons.flag;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.taskDetail,
          arguments: TaskDetailArgs(
            card: card,
            projectId: projectId,
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
            // Title
            Text(
              card.title,
              style: context.appTextTheme.font14TextPrimarySemiBold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12.h),
            // Chips Row
            Row(
              children: [
                _TypeChip(
                  type: card.type ?? 'task',
                  color: _typeColor,
                  icon: _typeIcon,
                ),
                SizedBox(width: 8.w),
                _PriorityChip(
                  priority: card.priority ?? 'medium',
                  color: _getPriorityColor(card.priority),
                  icon: _getPriorityIcon(card.priority),
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
                  _AssigneeAvatars(assignees: card.assignees),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({required this.type, required this.color, required this.icon});

  final String type;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.r, color: color),
          SizedBox(width: 4.w),
          Text(
            type.capitalize(),
            style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PriorityChip extends StatelessWidget {
  const _PriorityChip({required this.priority, required this.color, required this.icon});

  final String priority;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.r, color: color),
          SizedBox(width: 4.w),
          Text(
            priority.capitalize(),
            style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AssigneeAvatars extends StatelessWidget {
  const _AssigneeAvatars({required this.assignees});

  final List<CardAssignee> assignees;

  @override
  Widget build(BuildContext context) {
    final displayAssignees = assignees.take(3).toList();
    final remainingCount = assignees.length - displayAssignees.length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...displayAssignees.asMap().entries.map((entry) {
          final index = entry.key;
          final assignee = entry.value;
          return Transform.translate(
            offset: Offset(index * -8.0, 0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: CircleAvatar(
                radius: 12.r,
                backgroundColor: context.appColors.secondaryBackground,
                child: Text(
                  assignee.initials,
                  style: context.appTextTheme.font10LabelRegular.copyWith(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
        if (remainingCount > 0)
          Transform.translate(
            offset: Offset(displayAssignees.length * -8.0, 0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: CircleAvatar(
                radius: 12.r,
                backgroundColor: AppColors.primary,
                child: Text(
                  '+$remainingCount',
                  style: context.appTextTheme.font10LabelRegular.copyWith(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
