import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/core/widgets/error_state_widget.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/comments/comment_input_field.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/comments/comment_list.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({super.key});

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView>with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cubit = context.read<TaskDetailsCubit>();
    return Column(
      children: [
        const CommentInputField(),
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            buildWhen: (previous, current) =>
                current is GetCommentsLoading ||
                current is GetCommentsError ||
                current is GetCommentsSuccess ||
                current is AddCommentSuccess,
            builder: (context, state) {
              if (state is GetCommentsLoading) {
                return const AppLoading();
              }
              if (state is GetCommentsError) {
                return ErrorStateWidget(message: state.error);
              }
              return CommentsList(comments: cubit.comments);
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
