import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key, required this.card});

  final CardModel card;

  Color get _typeColor {
    switch (card.type?.toLowerCase()) {
      case 'bug':
        return AppColors.bugColor;
      case 'story':
        return AppColors.storyColor;
      case 'improvement':
        return AppColors.improvementColor;
      case 'task':
      default:
        return AppColors.taskColor;
    }
  }

  Color get _priorityColor {
    switch (card.priority?.toLowerCase()) {
      case 'high':
        return AppColors.highPriority;
      case 'medium':
        return AppColors.mediumPriority;
      case 'low':
        return AppColors.lowPriority;
      default:
        return AppColors.textHint;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.taskDetail,
          arguments: card,
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: context.appColors.cardBackground,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Labels row
            if (card.labels.isNotEmpty) ...[
              Wrap(
                spacing: 4.w,
                runSpacing: 4.h,
                children: card.labels.map((label) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: _parseColor(label.color).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      label.name,
                      style: context.appTextTheme.font10LabelRegular.copyWith(
                        color: _parseColor(label.color),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 6.h),
            ],
            // Title
            Text(
              card.title,
              style: context.appTextTheme.font13TextPrimarySemiBold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),
            // Bottom row: type, priority, assignees
            Row(
              children: [
                // Type chip
                if (card.type != null) ...[
                  _TypeChip(type: card.type!, color: _typeColor),
                  SizedBox(width: 6.w),
                ],
                // Priority icon
                if (card.priority != null) ...[
                  _PriorityIndicator(
                    priority: card.priority!,
                    color: _priorityColor,
                  ),
                ],
                const Spacer(),
                // Comments count
                if (card.commentsCount > 0) ...[
                  Icon(Icons.chat_bubble_outline,
                      size: 12.r, color: context.appColors.textHint),
                  SizedBox(width: 2.w),
                  Text(
                    card.commentsCount.toString(),
                    style: context.appTextTheme.font11TextSecondaryRegular,
                  ),
                  SizedBox(width: 6.w),
                ],
                // Assignees
                if (card.assignees.isNotEmpty) _AssigneeAvatars(card.assignees),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _parseColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.textHint;
    }
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({required this.type, required this.color});

  final String type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        type,
        style: context.appTextTheme.font10LabelRegular.copyWith(
          color: color,
        ),
      ),
    );
  }
}

class _PriorityIndicator extends StatelessWidget {
  const _PriorityIndicator({required this.priority, required this.color});

  final String priority;
  final Color color;

  IconData get _icon {
    switch (priority.toLowerCase()) {
      case 'high':
        return Icons.keyboard_double_arrow_up;
      case 'medium':
        return Icons.drag_handle;
      case 'low':
        return Icons.keyboard_double_arrow_down;
      default:
        return Icons.remove;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(_icon, size: 14.r, color: color),
        SizedBox(width: 2.w),
        Text(
          priority,
          style: context.appTextTheme.font10LabelRegular.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}

class _AssigneeAvatars extends StatelessWidget {
  const _AssigneeAvatars(this.assignees);

  final List<CardAssignee> assignees;

  @override
  Widget build(BuildContext context) {
    final display = assignees.take(3).toList();
    final remaining = assignees.length - 3;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...display.asMap().entries.map((entry) {
          return Transform.translate(
            offset: Offset(-entry.key * 6.0, 0),
            child: CircleAvatar(
              radius: 10.r,
              backgroundColor: context.appColors.primary,
              child: Text(
                entry.value.initials,
                style: context.appTextTheme.font7WhiteSemiBold,
              ),
            ),
          );
        }),
        if (remaining > 0)
          Transform.translate(
            offset: Offset(-display.length * 6.0, 0),
            child: CircleAvatar(
              radius: 10.r,
              backgroundColor: context.appColors.secondaryBackground,
              child: Text(
                '+$remaining',
                style: context.appTextTheme.font7TextSecondaryBold,
              ),
            ),
          ),
      ],
    );
  }
}
