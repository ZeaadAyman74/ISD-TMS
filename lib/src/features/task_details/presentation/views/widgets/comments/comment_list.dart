import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/task_comment_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/comments/comment_card.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key, required this.projectId, required this.cardId, this.comments = const []});

  final int projectId;
  final int cardId;
  final List<TaskCommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CommentInput(projectId: projectId, cardId: cardId),
        Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            padding: EdgeInsets.only(top: 16.h,bottom: 30.h),
            itemBuilder: (context, index) {
              final comment = comments[index];
              return CommentCard(
                comment: comment,
                onDelete: () => context.read<TaskDetailsCubit>().deleteComment(projectId, cardId, comment.id),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CommentInput extends StatefulWidget {
  const _CommentInput({required this.projectId, required this.cardId});
  final int projectId;
  final int cardId;

  @override
  State<_CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<_CommentInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.appColors.secondaryBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.appColors.secondaryBackground),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.format_bold, size: 20)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.format_italic, size: 20)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.format_list_bulleted, size: 20)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.format_list_numbered, size: 20)),
            ],
          ),
          TextField(
            controller: _controller,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Add a comment...',
              border: InputBorder.none,
            ),
          ),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    context.read<TaskDetailsCubit>().addComment(widget.projectId, widget.cardId, '<p>${_controller.text.trim()}</p>');
                    _controller.clear();
                  }
                },
                child: const Text('Comment'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
