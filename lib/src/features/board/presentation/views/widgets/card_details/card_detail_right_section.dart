import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/member_selector_bottom_sheet.dart';

class CardDetailRightSection extends StatelessWidget {
  const CardDetailRightSection({super.key, required this.card, required this.projectId});

  final CardModel card;
  final int projectId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PropertyWrapper(
          label: 'Type',
          child: _ItemSelector<String>(
            value: card.type ?? 'task',
            items: cubit.cardTypes.map((t) => DropdownMenuItem(value: t.key, child: Text(t.label))).toList(),
            onChanged: (val) => _updateCard(context, 'type', val),
          ),
        ),
        SizedBox(height: 16.h),
        _PropertyWrapper(
          label: 'Priority',
          child: _ItemSelector<String>(
            value: card.priority ?? 'medium',
            items: cubit.cardPriorities.map((p) => DropdownMenuItem(value: p.key, child: Text(p.label))).toList(),
            onChanged: (val) => _updateCard(context, 'priority', val),
          ),
        ),
        SizedBox(height: 16.h),
        _PropertyWrapper(
          label: 'Assigned',
          child: _AssigneeSelector(
            card: card,
            onAddPressed: () => _showMemberSelector(context, cubit),
          ),
        ),
        SizedBox(height: 16.h),
        _PropertyWrapper(
          label: 'Due Date',
          child: _DatePicker(
            dueDate: card.dueDate,
            onSelected: (date) => _updateCard(context, 'due_date', date.toIso8601String()),
          ),
        ),
        SizedBox(height: 32.h),
        _DeleteCardButton(onDelete: () {
           // TODO: Implement delete card 
        }),
      ],
    );
  }

  void _showMemberSelector(BuildContext context, BoardCubit cubit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => MemberSelectorBottomSheet(
        allMembers: cubit.members,
        selectedMemberIds: card.assignees.map((a) => a.id).toList(),
        onSelectionChanged: (newIds) {
          _updateCard(context, 'assignee_ids', newIds);
        },
      ),
    );
  }

  void _updateCard(BuildContext context, String field, dynamic value) {
    context.read<BoardCubit>().updateCard(
      cardId: card.id,
      data: {field: value},
    );
  }
}

class _PropertyWrapper extends StatelessWidget {
  const _PropertyWrapper({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 4.h),
        child,
      ],
    );
  }
}

class _ItemSelector<T> extends StatelessWidget {
  const _ItemSelector({required this.value, required this.items, required this.onChanged});
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: context.appColors.secondaryBackground,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: context.appColors.secondaryBackground),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          style: context.appTextTheme.font14TextPrimarySemiBold,
        ),
      ),
    );
  }
}

class _AssigneeSelector extends StatelessWidget {
  const _AssigneeSelector({required this.card, required this.onAddPressed});
  final CardModel card;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...card.assignees.map((a) => Container(
          margin: EdgeInsets.only(right: 4.w),
          child: CircleAvatar(
            radius: 12.r,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Text(
              a.initials,
              style: TextStyle(color: AppColors.primary, fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
          ),
        )),
        IconButton(
          onPressed: onAddPressed,
          icon: const Icon(Icons.add_circle_outline, size: 24),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}

class _DatePicker extends StatelessWidget {
  const _DatePicker({this.dueDate, required this.onSelected});
  final String? dueDate;
  final ValueChanged<DateTime> onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.tryParse(dueDate ?? '') ?? DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 3650)),
        );
        if (date != null) {
          onSelected(date);
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: context.appColors.secondaryBackground,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Text(
              dueDate?.split('T').first ?? 'Not Set',
              style: context.appTextTheme.font14TextPrimarySemiBold,
            ),
            const Spacer(),
            const Icon(Icons.calendar_today, size: 16),
          ],
        ),
      ),
    );
  }
}

class _DeleteCardButton extends StatelessWidget {
  const _DeleteCardButton({required this.onDelete});
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.error,
          side: const BorderSide(color: AppColors.error),
          padding: EdgeInsets.symmetric(vertical: 12.h),
        ),
        icon: const Icon(Icons.delete_outline),
        label: const Text('Delete Card'),
        onPressed: onDelete,
      ),
    );
  }
}
