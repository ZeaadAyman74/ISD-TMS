import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/widgets/custom_form_field.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/save_field_button.dart';

class TitleField extends StatefulWidget {
  const TitleField({super.key});

  @override
  State<TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  late TextEditingController _controller;
  bool _isChanged = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: cubit.currentCard!.title);
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
        data: UpdateTaskModel(title: _controller.text.trim()),
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
            CustomFormField(
              labelText: 'Title',
              controller: _controller,
              hintText: 'Task Title',
              onChanged: (val) {
                final changed =
                    val.trim() != cubit.currentCard!.title &&
                    val.trim().isNotEmpty;
                if (_isChanged != changed) {
                  setState(() => _isChanged = changed);
                }
              },
            ),
            if (_isChanged) ...[
              8.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: SaveFieldButton(
                  onPressed: () =>
                      _controller.text.trim().isEmpty ? null : _onSave(),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
