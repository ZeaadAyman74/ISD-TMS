import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/widgets/custom_drop_down.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class StatusDropdown extends StatefulWidget {
  const StatusDropdown({super.key});

  @override
  State<StatusDropdown> createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  BoardCubit get boardCubit => context.read<BoardCubit>();
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  int? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = cubit.currentCard!.listId;
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<int?>(
      selectedValue: selectedValue,
      dropdownItems: List.from(
        boardCubit.lists.map((e) => DropdownModel(title: e.title, value: e.id)),
      ),
      onChanged: (cubit.currentProject!.permissions?.cards?.move ?? false) ? (
          int? val) {
        selectedValue = val;
        if (val != null && val != cubit.currentCard!.listId) {
          boardCubit.updateTask(
            cardId: cubit.currentCard!.id,
            data: UpdateTaskModel(status: val),
          );
        }
      }:null,
    );
  }
}
