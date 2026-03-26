import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/widgets/custom_button.dart';
import 'package:isd_tms/src/core/widgets/custom_form_field.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: context.appColors.appBarBackground,
        elevation: 0.5,
        title: Text(
          context.localization.task_details,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: AppColors.primary),
            onPressed: () => _showEditDialog(context),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: BlocListener<BoardCubit, BoardState>(
        listener: (context, state) {
          if (state is UpdateCardSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.localization.task_updated_success),
                backgroundColor: AppColors.success,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: BlocBuilder<BoardCubit, BoardState>(
          builder: (context, state) {
            // Use the updated card from cubit if available
            final currentCard = context.read<BoardCubit>().cards.firstWhere(
                  (c) => c.id == card.id,
                  orElse: () => card,
                );

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      currentCard.title,
                      style: context.appTextTheme.font20TextPrimaryBold,
                    ),
                    SizedBox(height: 16.h),

                    // Type & Priority row
                    Row(
                      children: [
                        if (currentCard.type != null)
                          _DetailChip(
                            icon: Icons.category_outlined,
                            label: currentCard.type!,
                            color: _typeColor(currentCard),
                          ),
                        if (currentCard.type != null) SizedBox(width: 12.w),
                        if (currentCard.priority != null)
                          _DetailChip(
                            icon: Icons.flag_outlined,
                            label: currentCard.priority!,
                            color: _priorityColor(currentCard),
                          ),
                      ],
                    ),

                    if (currentCard.description != null &&
                        currentCard.description!.isNotEmpty) ...[
                      SizedBox(height: 24.h),
                      _SectionTitle(title: context.localization.description),
                      SizedBox(height: 8.h),
                      Text(
                        currentCard.description!,
                        style: context.appTextTheme.font14TextSecondaryRegular,
                      ),
                    ],

                    if (currentCard.dueDate != null) ...[
                      SizedBox(height: 24.h),
                      _SectionTitle(title: context.localization.due_date),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(Icons.calendar_today,
                              size: 16.r, color: AppColors.textHint),
                          SizedBox(width: 8.w),
                          Text(
                            currentCard.dueDate!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],

                    if (currentCard.assignees.isNotEmpty) ...[
                      SizedBox(height: 24.h),
                      _SectionTitle(title: context.localization.assignees),
                      SizedBox(height: 8.h),
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: currentCard.assignees.map((a) {
                          return Chip(
                            avatar: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              child: Text(
                                a.initials,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                            label: Text(
                              a.fullName,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            backgroundColor: AppColors.primaryLight,
                            side: BorderSide.none,
                          );
                        }).toList(),
                      ),
                    ],

                    if (currentCard.labels.isNotEmpty) ...[
                      SizedBox(height: 24.h),
                      _SectionTitle(title: context.localization.labels),
                      SizedBox(height: 8.h),
                      Wrap(
                        spacing: 6.w,
                        runSpacing: 6.h,
                        children: currentCard.labels.map((label) {
                          final color = _parseColor(label.color);
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              label.name,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: color,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],

                    SizedBox(height: 32.h),
                    // Info Footer
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.chat_bubble_outline,
                              size: 16.r, color: AppColors.textHint),
                          SizedBox(width: 4.w),
                          Text(
                            '${currentCard.commentsCount} ${context.localization.comment_count}',
                            style: context.appTextTheme.font12TextSecondarySemiBold.copyWith(
                              letterSpacing: 0,
                            ),
                          ),
                          const Spacer(),
                          if (currentCard.createdAt != null)
                            Text(
                              '${context.localization.created_at_prefix}${currentCard.createdAt}',
                              style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
                                color: context.appColors.textHint,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    // Re-fetch current card from cubit
    final currentCard = context.read<BoardCubit>().cards.firstWhere(
          (c) => c.id == card.id,
          orElse: () => card,
        );

    final titleController = TextEditingController(text: currentCard.title);
    final descriptionController =
        TextEditingController(text: currentCard.description);

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: Container(
          width: 400.w,
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.edit_task,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 20.h),
              CustomFormField(
                controller: titleController,
                labelText: context.localization.title,
                hintText: context.localization.task_title,
              ),
              SizedBox(height: 16.h),
              CustomFormField(
                controller: descriptionController,
                labelText: context.localization.description,
                hintText: context.localization.description,
                maxLines: 3,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: context.localization.cancel,
                      backgroundColor: Colors.grey.shade200,
                      titleStyle: const TextStyle(color: Colors.black),
                      onTap: () => Navigator.pop(dialogContext),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      title: context.localization.update,
                      onTap: () {
                        context.read<BoardCubit>().updateCard(
                          cardId: currentCard.id,
                          data: {
                            'title': titleController.text.trim(),
                            'description': descriptionController.text.trim(),
                          },
                        );
                        Navigator.pop(dialogContext);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _typeColor(CardModel card) {
    switch (card.type?.toLowerCase()) {
      case 'bug':
        return AppColors.bugColor;
      case 'story':
        return AppColors.storyColor;
      case 'improvement':
        return AppColors.improvementColor;
      default:
        return AppColors.taskColor;
    }
  }

  Color _priorityColor(CardModel card) {
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

  Color _parseColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.textHint;
    }
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  const _DetailChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.r, color: color),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
