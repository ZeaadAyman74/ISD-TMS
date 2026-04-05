import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/utils/enums.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';

class BoardBlocListener extends StatelessWidget {
  const BoardBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        if (state is AddCardSuccess) {
          context.showSnackBar(
            context.localization.task_created_success,
            ToastStates.success,
          );
        } else if (state is AddCardError) {
          context.showSnackBar(state.error, ToastStates.error);
        } else if (state is DeleteTaskLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AppLoading(),
          );
        } else if (state is DeleteTaskSuccess) {
          Navigator.of(context).pop(); // pop loader
          context.showSnackBar(
            context.localization.task_deleted_success,
            ToastStates.success,
          );
        } else if (state is DeleteTaskError) {
          Navigator.of(context).pop(); // pop loader
          context.showSnackBar(state.error, ToastStates.error);
        } else if (state is ReorderCardError) {
          context.showSnackBar(state.error, ToastStates.error);
        }
      },
      child: child,
    );
  }
}
