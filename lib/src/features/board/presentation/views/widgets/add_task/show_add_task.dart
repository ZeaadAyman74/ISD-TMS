import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/add_task/add_task_dialog.dart';

void showAddTaskDialog(
  BuildContext context, {
  required int listId,
  required String listTitle,
}) {
  showDialog(
    context: context,
    builder: (_) => BlocProvider.value(
      value: context.read<BoardCubit>(),
      child: AddTaskDialog(listId: listId, listTitle: listTitle),
    ),
  );
}
