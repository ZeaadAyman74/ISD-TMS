import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/widgets/custom_drop_down.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class PriorityField extends StatefulWidget {
  const PriorityField({super.key});

  @override
  State<PriorityField> createState() => _PriorityFieldState();
}

class _PriorityFieldState extends State<PriorityField> {
  BoardCubit get boardCubit => context.read<BoardCubit>();

  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = cubit.currentCard!.priority;
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String?>(
      selectedValue: selectedValue,
      labelText: context.localization.priority,
      dropdownItems: List.from(
        boardCubit.cardPriorities.map(
          (e) => DropdownModel(title: e.label, value: e.key),
        ),
      ),
      onChanged:
          (cubit.currentProject!.permissions?.cards?.setPriority??false)
          ? (String? val) {
              setState(() {
                selectedValue = val;
              });
              if (val != null) {
                boardCubit.updateTask(
                  cardId: cubit.currentCard!.id,
                  data: UpdateTaskModel(priority: val),
                );
              }
            }
          : null,
    );
  }
}
