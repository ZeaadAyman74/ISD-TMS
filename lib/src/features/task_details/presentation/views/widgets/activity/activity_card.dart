import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_activity/task_activity_model.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.activity});

  final TaskActivityModel activity;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy, h:mm a');
    final formattedDate = dateFormat.format(
      DateTime.tryParse(activity.date)?.toLocal() ?? DateTime.now(),
    );

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 10.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 1.w,
                  color: context.appColors.secondaryBackground,
                ),
                Positioned(
                  top: 24.h,
                  child: Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          5.horizontalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.appColors.secondaryBackground,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${activity.actor?.name ?? context.localization.admin_user} ${_formatActivityAction(activity,context)}',
                          style: context
                              .appTextTheme
                              .font11TextSecondaryRegular
                              .copyWith(color: AppColors.textSecondary),
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        formattedDate,
                        style: context.appTextTheme.font11TextSecondaryRegular
                            .copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                  if (activity.changes.isNotEmpty) ...[
                    8.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: activity.changes
                          .map((c) => _ChangeDetail(change: c))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatActivityAction(TaskActivityModel activity,BuildContext context) {
    switch (activity.action) {
      case ActivityAction.cardCreated:
        return context.localization.created_card;
      case ActivityAction.cardUpdated:
        return context.localization.updated_the_card;
      case ActivityAction.cardMoved:
        return context.localization.moved_the_card;
      case ActivityAction.attachmentUploaded:
        return context.localization.uploaded_attachment;
      case ActivityAction.attachmentDeleted:
        return context.localization.deleted_attachment;
      case ActivityAction.cardAssigneesUpdated:
        return context.localization.change_the_assignee;
    }
  }
}
class _ChangeDetail extends StatelessWidget {
  const _ChangeDetail({required this.change});
  final ActivityChange change;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: RichText(
        text: TextSpan(
          style: context.appTextTheme.font11TextSecondaryRegular.copyWith(height: 1.5),
          children: [
            TextSpan(text: '${getFieldName(change.field!, context)}: '),
            TextSpan(text: change.oldAssignees??change.oldDisplay),
            const TextSpan(text: '  →  '),
            TextSpan(text: change.newAssignees??change.newDisplay),
          ],
        ),
      ),
    );
  }

  String? getFieldName(ActivityField field,BuildContext context){
    switch (field){
      case ActivityField.title:
        return context.localization.title;
      case ActivityField.description:
        return context.localization.description;
      case ActivityField.type:
        return context.localization.type;
      case ActivityField.priority:
        return context.localization.priority;
      case ActivityField.status:
        return context.localization.status;
      case ActivityField.assignees:
        return context.localization.assignees;
      case ActivityField.attachments:
        return context.localization.attachments;
      case ActivityField.dueDate:
        return context.localization.due_date;
    }
  }
}