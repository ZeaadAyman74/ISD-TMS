import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
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

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 24.w,
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
            SizedBox(width: 8.w),
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
                            '${activity.actor?.name ?? 'Admin User'} ${_formatActivityAction(activity)}',
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
      ),
    );
  }

  String _formatActivityAction(TaskActivityModel activity) {
    switch (activity.action) {
      case 'card_created':
        return 'User created the card';
      case 'card_updated':
        return 'User updated the card';
      case 'attachment_uploaded':
        return 'User uploaded an attachment';
      case 'attachment_deleted':
        return 'User deleted an attachment';
      case 'card_assignees_updated':
        return 'User changed the Assignee';
      case 'card_moved':
        return 'User moved the card';
      default:
        return activity.action.replaceAll('_', ' ');
    }
  }
}
class _ChangeDetail extends StatelessWidget {
  const _ChangeDetail({required this.change});
  final ActivityChange change;

  String _formatDisplayValue(dynamic value) {
    if (value == null) return 'None';
    if (value is List) {
      if (value.isEmpty) return 'None';
      return value.join(', ');
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: RichText(
        text: TextSpan(
          style: context.appTextTheme.font11TextSecondaryRegular.copyWith(height: 1.5),
          children: [
            TextSpan(text: '${change.field.capitalize()}: '),
            TextSpan(text: _formatDisplayValue(change.oldDisplay)),
            const TextSpan(text: '  →  '),
            TextSpan(text: _formatDisplayValue(change.newDisplay)),
          ],
        ),
      ),
    );
  }
}