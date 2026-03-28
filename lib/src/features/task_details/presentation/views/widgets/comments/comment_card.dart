import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/task_comment_model.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment, required this.onDelete});

  final TaskCommentModel comment;
  final VoidCallback onDelete;

  String _stripHtml(String text) {
    return text
        .replaceAll(
          RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true),
          '',
        )
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Text(
              comment.user?.initials ?? '?',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.user?.fullName ?? 'Admin User',
                      style: context.appTextTheme.font14TextPrimarySemiBold,
                    ),
                    const Spacer(),
                    Text(
                      comment.createdAt.split('T').first,
                      style: context.appTextTheme.font11TextSecondaryRegular,
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 16,
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
                Text(
                  _stripHtml(comment.content),
                  style: context.appTextTheme.font14TextPrimaryRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
