import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/activity/activity_view.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/comments/comments_history_tab_bar.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/comments/comments_view.dart';

class CommentHistoryTabs extends StatefulWidget {
  const CommentHistoryTabs({super.key});

  @override
  State<CommentHistoryTabs> createState() => _CommentHistoryTabsState();
}

class _CommentHistoryTabsState extends State<CommentHistoryTabs>
    with SingleTickerProviderStateMixin {
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
            CommentsHistoryTabBar(tabController: _tabController),
            SizedBox(
              height: 480.h,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  CommentsView(),
                  ActivityView(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
