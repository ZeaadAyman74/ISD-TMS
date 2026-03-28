import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/screens/task_details_form.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/header/task_detail_header.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/comments/comment_history_tabs.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/task_details_bloc_listener.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key, required this.card});

  final CardModel card;

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.currentCard = widget.card;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      body: SafeArea(
        child: TaskDetailsBlocListener(
          child: Column(
            children: [
              const TaskDetailHeader(),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TaskDetailsForm(
                            maxWidth: constraints.maxWidth,
                          ),
                          SizedBox(height: 32.h),
                          CommentHistoryTabs(
                            projectId: cubit.currentCard!.projectId,
                            cardId: cubit.currentCard!.id,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
