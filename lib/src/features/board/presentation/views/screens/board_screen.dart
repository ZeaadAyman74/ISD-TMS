import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/core/widgets/error_state_widget.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_column_widget.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: context.appColors.appBarBackground,
        elevation: 0.5,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: context.appTextTheme.font16TextPrimarySemiBold,
            ),
            Text(
              context.localization.board_view,
              style: context.appTextTheme.font11TextSecondaryRegular,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.textSecondary),
            onPressed: () =>
                context.read<BoardCubit>().getBoard(project.id),
          ),
        ],
      ),
      body: BlocConsumer<BoardCubit, BoardState>(
        listener: (context, state) {
          if (state is AddCardSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.localization.task_created_success),
                backgroundColor: AppColors.success,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          } else if (state is AddCardError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.error}'),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        buildWhen: (prev, curr) =>
            curr is BoardLoading || curr is BoardLoaded || curr is BoardError,
        builder: (context, state) {
          if (state is BoardLoading) {
            return const AppLoading();
          }
          if (state is BoardError) {
            return ErrorStateWidget(
              message: state.error,
              onRetry: () =>
                  context.read<BoardCubit>().getBoard(project.id),
            );
          }
          if (state is BoardLoaded) {
            if (state.lists.isEmpty) {
              return Center(
                child: Text(
                  context.localization.no_board_columns,
                  style: context.appTextTheme.font16TextPrimarySemiBold.copyWith(
                    color: context.appColors.textSecondary,
                  ),
                ),
              );
            }
            return _BoardColumnsView(lists: state.lists);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _BoardColumnsView extends StatelessWidget {
  const _BoardColumnsView({required this.lists});

  final List<BoardListModel> lists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: BoardColumnWidget(boardList: lists[index]),
          );
        },
      ),
    );
  }
}
