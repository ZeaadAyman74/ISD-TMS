import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/comments/comment_list.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/activity/activity_list.dart';

class CommentHistoryTabs extends StatefulWidget {
  const CommentHistoryTabs({super.key, required this.projectId, required this.cardId});

  final int projectId;
  final int cardId;

  @override
  State<CommentHistoryTabs> createState() => _CommentHistoryTabsState();
}

class _CommentHistoryTabsState extends State<CommentHistoryTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: context.appColors.secondaryBackground)),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                labelStyle: context.appTextTheme.font14TextPrimarySemiBold,
                tabs: [
                  Tab(text: 'Comments (${state.comments.length})'),
                  const Tab(text: 'History'),
                ],
              ),
            ),
            SizedBox(
              height: 480.h, 
              child: TabBarView(
                controller: _tabController,
                children: [
                  CommentList(projectId: widget.projectId, cardId: widget.cardId, comments: state.comments),
                  ActivityList(activities: state.activities),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
