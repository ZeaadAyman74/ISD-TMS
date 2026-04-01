import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class TaskAssigneeAvatars extends StatelessWidget {
  const TaskAssigneeAvatars({super.key, required this.assignees});

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
            offset:SharedPrefUtils.locale=='en'? Offset(index * -8.0, 0):Offset(index * 8.0, 0),
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
