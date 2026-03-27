import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';

class CardDetailHeader extends StatelessWidget {
  const CardDetailHeader({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
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
        children: [
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _CardPropertyChip(
                      label: card.type ?? 'task',
                      icon: _getTypeIcon(card.type),
                      color: _getTypeColor(card.type),
                    ),
                    _CardPropertyChip(
                      label: card.priority ?? 'medium',
                      icon: _getPriorityIcon(card.priority),
                      color: _getPriorityColor(card.priority),
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
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Card #${card.id}',
                style: context.appTextTheme.font11TextSecondaryRegular,
              ),
              _StatusDropdown(card: card),
            ],
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(String? type) {
    switch (type?.toLowerCase()) {
      case 'task': return AppColors.taskColor;
      case 'bug': return AppColors.bugColor;
      case 'story': return AppColors.storyColor;
      case 'improvement': return AppColors.improvementColor;
      default: return AppColors.primary;
    }
  }

  IconData _getTypeIcon(String? type) {
    switch (type?.toLowerCase()) {
      case 'task': return Icons.check_box_outlined;
      case 'bug': return Icons.bug_report_outlined;
      case 'story': return Icons.book_outlined;
      case 'improvement': return Icons.trending_up;
      default: return Icons.task_alt;
    }
  }

  Color _getPriorityColor(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'high': return AppColors.highPriority;
      case 'medium': return AppColors.mediumPriority;
      case 'low': return AppColors.lowPriority;
      default: return AppColors.textSecondary;
    }
  }

  IconData _getPriorityIcon(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'high': return Icons.keyboard_double_arrow_up;
      case 'medium': return Icons.trending_flat;
      case 'low': return Icons.keyboard_double_arrow_down;
      default: return Icons.flag_outlined;
    }
  }
}

class _CardPropertyChip extends StatelessWidget {
  const _CardPropertyChip({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: color),
          SizedBox(width: 4.w),
          Text(
            label.toUpperCase(),
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

class _StatusDropdown extends StatelessWidget {
  const _StatusDropdown({required this.card});
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
      decoration: BoxDecoration(
        color: context.appColors.secondaryBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: card.listId,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
          style: context.appTextTheme.font13TextPrimaryMedium,
          items: cubit.lists.map((list) {
            return DropdownMenuItem<int>(
              value: list.id,
              child: Text(list.title),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null && val != card.listId) {
              cubit.updateCard(
                cardId: card.id,
                data: {'list_id': val},
              );
            }
          },
        ),
      ),
    );
  }
}
