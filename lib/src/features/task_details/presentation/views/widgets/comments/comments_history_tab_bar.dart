import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class CommentsHistoryTabBar extends StatelessWidget {
  const CommentsHistoryTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskDetailsCubit>();
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.appColors.secondaryBackground),
        ),
      ),
      child: BlocBuilder(
        buildWhen: (previous, current) =>
            current is AddCommentSuccess ||
            current is DeleteCommentSuccess ||
            current is GetCommentsSuccess,
        bloc: cubit,
        builder: (context, state) {
          return TabBar(
            controller: tabController,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            labelStyle: context.appTextTheme.font14TextPrimarySemiBold,
            tabs: [
              Tab(text: 'Comments (${cubit.comments.length})'),
              const Tab(text: 'History'),
            ],
          );
        },
      ),
    );
  }
}
