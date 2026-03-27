import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key, this.activities = const []});

  final List<CardActivity> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemBuilder: (context, index) {
        return _ActivityItem(activity: activities[index]);
      },
    );
  }
}

class _ActivityItem extends StatelessWidget {
  const _ActivityItem({required this.activity});
  final CardActivity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12.r,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Text(
              activity.actor?.name.isNotEmpty == true ? activity.actor!.name[0].toUpperCase() : '?',
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(activity.actor?.name ?? 'Admin User', style: context.appTextTheme.font14TextPrimarySemiBold),
                    const Spacer(),
                    Text(activity.date.split('T').first, style: context.appTextTheme.font11TextSecondaryRegular),
                  ],
                ),
                Text(
                  _formatActivityAction(activity),
                  style: context.appTextTheme.font14TextPrimaryRegular,
                ),
                if (activity.changes.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Column(
                      children: activity.changes.map((c) => _ChangeDetail(change: c)).toList(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatActivityAction(CardActivity activity) {
    switch (activity.action) {
      case 'card_created':
        return 'created the task';
      case 'card_updated':
        return 'updated the task';
      case 'attachment_uploaded':
        return 'uploaded an attachment';
      case 'attachment_deleted':
        return 'deleted an attachment';
      case 'card_assignees_updated':
        return 'updated assignees';
       case 'card_moved':
        return 'moved task to another list';
      default:
        return activity.action.replaceAll('_', ' ');
    }
  }
}

class _ChangeDetail extends StatelessWidget {
  const _ChangeDetail({required this.change});
  final ActivityChange change;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${change.field.capitalize()}: ', style: context.appTextTheme.font11TextSecondaryRegular),
        Text(change.oldDisplay?.toString() ?? 'None', style: context.appTextTheme.font11TextSecondaryRegular.copyWith(decoration: TextDecoration.lineThrough)),
        const Icon(Icons.arrow_right_alt, size: 14),
        Text(change.newDisplay?.toString() ?? 'None', style: context.appTextTheme.font11TextSecondaryRegular),
      ],
    );
  }
}

extension _ActivityStringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
