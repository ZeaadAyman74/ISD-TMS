import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/task_card_widget.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/add_task/add_task_dialog.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class BoardColumnWidget extends StatelessWidget {
  const BoardColumnWidget({super.key, required this.boardList, required this.projectId});

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
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
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
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: () => _showAddTaskDialog(context),
                  child: Icon(Icons.add, size: 20.r, color: AppColors.textHint),
                ),
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
                  child: TaskCardWidget(card: cardsForList[index], projectId: projectId),
                );
              },
            ),
          ),
          // Add task button at bottom
          GestureDetector(
            onTap: () => _showAddTaskDialog(context),
            child: Container(
              padding: EdgeInsets.all(12.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.appColors.cardBackground,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8.r)),
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
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<BoardCubit>(),
        child: AddTaskDialog(listId: boardList.id, listTitle: boardList.title),
      ),
    );
  }
}
