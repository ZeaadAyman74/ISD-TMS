import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/notifications/data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.push(Routes.taskDetail, args: TaskDetailArgs(card: CardModel(
        //     id: notification.data!.card!.id,
        //     projectId: notification.data!.project!.id,
        //     listId: 6,
        //     title: notification.data!.card!.title!), boardCubit: boardCubit));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: notification.isRead
              ? Colors.white
              : AppColors.primaryLight.withValues(alpha: 0.3),
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 0.5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Actor avatar
            _buildAvatar(),
            12.horizontalSpace,
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Type badge + actor name + date
                  Row(
                    children: [
                      _TypeBadge(color: _getBadgeColor(), type: _getTypeLabel(context)),
                     8.horizontalSpace,
                      Expanded(
                        child: Text(
                          notification.data?.actorName ?? '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        notification.formattedDate,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                  6.verticalSpace,
                  // Message
                  Text(
                    notification.data?.message ?? notification.description,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.textPrimary,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Card / Project title pill
                  if (_getSubtitle() != null) ...[
                   6.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        _getSubtitle()!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _getSubtitle() {
    // Show card title if available, else project name for project-level notifications
    if (notification.data?.card?.title != null) {
      return notification.data!.card!.title;
    }
    if (notification.type == NotificationType.projectOwnerAssigned ||
        notification.type == NotificationType.projectMemberAdded) {
      return notification.data?.project?.name;
    }
    return null;
  }

  Widget _buildAvatar() {
    final name = notification.data?.actorName ?? '';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'U';
    final color = _getBadgeColor();

    return CircleAvatar(
      radius: 20.r,
      backgroundColor: color,
      child: Text(
        initial,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  Color _getBadgeColor() {
    switch (notification.type) {
      case NotificationType.cardMoved:
        return const Color(0xff80828f);
      case NotificationType.cardMention:
        return const Color(0xff07bad0);
      case NotificationType.cardAssigned:
        return AppColors.taskColor;
      case NotificationType.cardComment:
        return AppColors.inProgressColor;
      case NotificationType.projectOwnerAssigned:
        return AppColors.primary;
      case NotificationType.projectMemberAdded:
        return AppColors.success;
      case NotificationType.unknown:
        return AppColors.textSecondary;
    }
  }

  String _getTypeLabel(BuildContext context) {
    switch (notification.type) {
      case NotificationType.cardMoved:
        return context.localization.notification_moved;
      case NotificationType.cardMention:
        return context.localization.notification_mention;
      case NotificationType.cardAssigned:
        return context.localization.notification_assigned;
      case NotificationType.cardComment:
        return context.localization.notification_comment;
      case NotificationType.projectOwnerAssigned:
        return context.localization.notification_project_owner;
      case NotificationType.projectMemberAdded:
        return context.localization.notification_member_added;
      case NotificationType.unknown:
        return context.localization.notification_default;
    }
  }
}

class _TypeBadge extends StatelessWidget {
  const _TypeBadge({required this.color, required this.type});

  final Color color;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 10.sp,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
