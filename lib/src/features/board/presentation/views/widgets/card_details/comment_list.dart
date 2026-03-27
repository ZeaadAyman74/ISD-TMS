import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/card_details/card_details_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key, required this.projectId, required this.cardId, this.comments = const []});

  final int projectId;
  final int cardId;
  final List<CardComment> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CommentInput(projectId: projectId, cardId: cardId),
        Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            itemBuilder: (context, index) {
              final comment = comments[index];
              return _CommentItem(
                comment: comment,
                onDelete: () => context.read<CardDetailsCubit>().deleteComment(projectId, cardId, comment.id),
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
                    context.read<CardDetailsCubit>().addComment(widget.projectId, widget.cardId, _controller.text);
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

class _CommentItem extends StatelessWidget {
  const _CommentItem({required this.comment, required this.onDelete});
  final CardComment comment;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Text(
              comment.user?.initials ?? '?',
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(comment.user?.name ?? 'Admin User', style: context.appTextTheme.font14TextPrimarySemiBold),
                    const Spacer(),
                    Text(comment.createdAt.split('T').first, style: context.appTextTheme.font11TextSecondaryRegular),
                    IconButton(
                        onPressed: onDelete,
                        icon: const Icon(Icons.delete_outline, size: 16, color: AppColors.error)),
                  ],
                ),
                Text(comment.content, style: context.appTextTheme.font14TextPrimaryRegular),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
