import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/task_comment_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/comments/comment_card.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, this.comments = const []});

  final List<TaskCommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      padding: EdgeInsets.only(top: 16.h, bottom: 30.h),
      itemBuilder: (context, index) {
        final comment = comments[index];
        return CommentCard(
          comment: comment,
          onDelete: () =>
              context.read<TaskDetailsCubit>().deleteComment(comment.id),
        );
      },
    );
  }
}
