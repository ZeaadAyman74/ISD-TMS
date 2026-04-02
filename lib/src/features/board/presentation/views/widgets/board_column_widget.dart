import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/add_task/add_task_lower_button.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/add_task/show_add_task.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/task_card/task_card_widget.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class BoardColumnWidget extends StatelessWidget {
  const BoardColumnWidget({
    super.key,
    required this.boardList,
    required this.projectId,
  });

  final BoardListModel boardList;
  final int projectId;

  Color get _columnColor {
    switch (boardList.title.toLowerCase()) {
      case 'to do':
      case 'todo':
        return AppColors.todoColor;
      case 'in progress':
        return AppColors.inProgressColor;
      case 'review':
      case 'in review':
        return AppColors.reviewColor;
      case 'done':
      case 'completed':
        return AppColors.doneColor;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    final cardsForList = cubit.getCardsForList(boardList.id);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.appColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          // Column Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: context.appColors.cardBackground,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
            ),
            child: Row(
              children: [
                Container(
                  width: 10.r,
                  height: 10.r,
                  decoration: BoxDecoration(
                    color: _columnColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    boardList.title,
                    style: context.appTextTheme.font14TextPrimarySemiBold,
                  ),
                ),
                // Card count badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: _columnColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '${cardsForList.length}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: _columnColor,
                    ),
                  ),
                ),
                if(cubit.permissions?.cards?.add??false)
                ...[SizedBox(width: 4.w),
                GestureDetector(
                  onTap: () => showAddTaskDialog(context,listId: boardList.id,listTitle: boardList.title),
                  child: Icon(Icons.add, size: 20.r, color: AppColors.textHint),
                ),]
              ],
            ),
          ),
          // Cards list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              itemCount: cardsForList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: TaskCardWidget(
                    card: cardsForList[index],
                    canDelete:
                        cubit.permissions?.cards?.delete ??
                        false,
                  ),
                );
              },
            ),
          ),
          if(cubit.permissions?.cards?.add??false)
          // Add task button at bottom
          AddTaskLowerButton(listId: boardList.id,title: boardList.title),
        ],
      ),
    );
  }


}
