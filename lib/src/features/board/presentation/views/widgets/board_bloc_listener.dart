import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.localization.task_created_success),
              backgroundColor: AppColors.success,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        } else if (state is AddCardError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.error}'),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else if (state is DeleteTaskLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AppLoading(),
          );
        } else if (state is DeleteTaskSuccess) {
          Navigator.of(context).pop(); // pop loader
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.localization.task_deleted_success),
              backgroundColor: AppColors.success,
            ),
          );
        } else if (state is DeleteTaskError) {
          Navigator.of(context).pop(); // pop loader
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: child,
    );
  }
}
