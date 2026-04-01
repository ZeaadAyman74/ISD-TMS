import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/add_task/show_add_task.dart';

class AddTaskLowerButton extends StatelessWidget {
  const AddTaskLowerButton({
    super.key,
    required this.listId,
    required this.title,
  });

  final int listId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAddTaskDialog(context, listId: listId, listTitle: title),
      child: Container(
        padding: EdgeInsets.all(12.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.appColors.cardBackground,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 16.r, color: AppColors.textSecondary),
            SizedBox(width: 4.w),
            Text(
              context.localization.add_task,
              style: context.appTextTheme.font13TextPrimaryMedium.copyWith(
                color: context.appColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
