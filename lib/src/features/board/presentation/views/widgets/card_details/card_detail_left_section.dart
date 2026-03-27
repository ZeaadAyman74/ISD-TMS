import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/attachment_section.dart';

class CardDetailLeftSection extends StatefulWidget {
  const CardDetailLeftSection({super.key, required this.card, required this.projectId});

  final CardModel card;
  final int projectId;

  @override
  State<CardDetailLeftSection> createState() => _CardDetailLeftSectionState();
}

class _CardDetailLeftSectionState extends State<CardDetailLeftSection> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.card.title);
    _descController = TextEditingController(text: widget.card.description);
  }

  @override
  void didUpdateWidget(covariant CardDetailLeftSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.card.title != widget.card.title && _titleController.text != widget.card.title) {
      _titleController.text = widget.card.title;
    }
    if (oldWidget.card.description != widget.card.description && _descController.text != (widget.card.description ?? '')) {
      _descController.text = widget.card.description ?? '';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const _DetailSectionTitle(title: 'Title'),
        SizedBox(height: 8.h),
        TextField(
          controller: _titleController,
          style: context.appTextTheme.font16TextPrimarySemiBold,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: context.appColors.secondaryBackground),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: context.appColors.secondaryBackground),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            hintText: 'Task Title',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          ),
          onSubmitted: (val) => _updateCard(context, 'title', val),
        ),
        SizedBox(height: 16.h),
        const _DetailSectionTitle(title: 'Description'),
        SizedBox(height: 8.h),
        TextField(
          controller: _descController,
          style: context.appTextTheme.font14TextPrimaryRegular,
          maxLines: null,
          minLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: context.appColors.secondaryBackground),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: context.appColors.secondaryBackground),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            hintText: 'Add description...',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          ),
          onSubmitted: (val) => _updateCard(context, 'description', val),
        ),
        SizedBox(height: 24.h),
        AttachmentSection(projectId: widget.projectId, cardId: widget.card.id),
      ],
    );
  }

  void _updateCard(BuildContext context, String field, String value) {
    context.read<BoardCubit>().updateCard(
      cardId: widget.card.id,
      data: {field: value},
    );
  }
}

class _DetailSectionTitle extends StatelessWidget {
  const _DetailSectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      ),
    );
  }
}
