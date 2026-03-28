import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class DescriptionField extends StatefulWidget {
  const DescriptionField({super.key});

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  late TextEditingController _controller;
  bool _isChanged = false;

  String _stripHtml(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true), '').trim();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: _stripHtml(cubit.currentCard!.description ?? ''),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_controller.text.trim().isNotEmpty) {
      context.read<BoardCubit>().updateTask(
        cardId: cubit.currentCard!.id,
        data: UpdateTaskModel(description: '<p>${_controller.text.trim()}</p>'),
      );
      setState(() => _isChanged = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      buildWhen: (previous, current) =>
          current.status == TaskDetailsStatus.updateCard,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Description',
              style: context.appTextTheme.font14TextPrimarySemiBold,
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: context.appColors.secondaryBackground,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: context.appColors.secondaryBackground,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.format_bold, size: 20),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.format_italic, size: 20),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.format_list_bulleted, size: 20),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.format_list_numbered, size: 20),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _controller,
                    maxLines: null,
                    minLines: 3,
                    style: context.appTextTheme.font14TextPrimaryRegular,
                    onChanged: (val) {
                      final changed =
                          val.trim() !=
                              _stripHtml(cubit.currentCard!.description ?? '') &&
                          val.trim().isNotEmpty;
                      if (_isChanged != changed) {
                        setState(() => _isChanged = changed);
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Add description...',
                      border: InputBorder.none,
                    ),
                  ),
                  if (_isChanged) ...[
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: _controller.text.trim().isEmpty
                              ? null
                              : _onSave,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            minimumSize: const Size(0, 0),
                          ),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

