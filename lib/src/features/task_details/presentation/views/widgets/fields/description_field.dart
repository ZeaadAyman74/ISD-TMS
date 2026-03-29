import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/widgets/app_html_field.dart';
import 'package:isd_tms/src/core/widgets/custom_field_label.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/save_field_button.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class DescriptionField extends StatefulWidget {
  const DescriptionField({super.key});

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  BoardCubit get boardCubit => context.read<BoardCubit>();
  late QuillEditorController controller;
  bool _isChanged = false;

  @override
  void initState() {
    super.initState();
    controller = QuillEditorController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    final text = await controller.getText();
    if (text.isNotEmpty) {
      boardCubit.updateTask(
        cardId: cubit.currentCard!.id,
        data: UpdateTaskModel(description: text),
      );
      setState(() => _isChanged = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      buildWhen: (previous, current) => current is UpdateCard,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          const CustomFieldLabel(label: 'Description'),
            AppHtmlField(
              controller: controller,
              hint: "Add Description...",
              initialText: cubit.currentCard!.description,
              onChange: (val) {
                print(val);
                print(cubit.currentCard!.description);
                final changed = (val != cubit.currentCard!.description);
                if (_isChanged != changed) {
                  setState(() => _isChanged = changed);
                }
              },
            ),
            if (_isChanged) ...[
              Align(
                alignment: Alignment.centerRight,
                child: SaveFieldButton(
                  onPressed: () {
                    _onSave();
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
