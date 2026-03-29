import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';

class TaskDetailsBlocListener extends StatelessWidget {
  const TaskDetailsBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    return BlocListener<TaskDetailsCubit, TaskDetailsState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocListener(
        bloc: cubit,
        listener: (context, state) {
          if (state is UpdateTaskSuccess) {
            printMe(state.card.assignees);
            context.read<TaskDetailsCubit>().updateCurrentCard(state.card);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Task updated successfully'),
                backgroundColor: AppColors.success,
              ),
            );
          } else if (state is UpdateTaskError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is DeleteTaskLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const AppLoading(),
            );
          } else if (state is DeleteTaskSuccess) {
            Navigator.of(context).pop(); // pop loader
            Navigator.of(context).pop(); // pop details screen
          } else if (state is DeleteTaskError) {
            Navigator.of(context).pop(); // pop loader
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: child,
      ),
    );
  }
}
