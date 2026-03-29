import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_html_field.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/save_field_button.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CommentInputField extends StatefulWidget {
  const CommentInputField({super.key});

  @override
  State<CommentInputField> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  late QuillEditorController controller;

  @override
  void initState() {
    controller = QuillEditorController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
          AppHtmlField(
            controller: controller,
            hint: "Add Comment...",
            initialText:'',
          ),
          Row(
            children: [
              const Spacer(),
              SaveFieldButton(title: "Comment",onPressed: () {
                _onSave();
              }),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onSave() async {
    final text = await controller.getText();
    if (text.isNotEmpty) {
      cubit.addComment(text);
      controller.clear();
    }
  }
}
