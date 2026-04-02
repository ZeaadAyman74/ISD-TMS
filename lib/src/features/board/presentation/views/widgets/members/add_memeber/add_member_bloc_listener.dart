import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/utils/enums.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/add_member/add_member_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';

class AddMemberBlocListener extends StatelessWidget {
  const AddMemberBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddMemberCubit>();
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        if(state is AddMemberError){
          context.showSnackBar(state.error,ToastStates.error,icon: Icons.error_outline,);
        }else if(state is AddMemberSuccess){
          context.read<BoardCubit>().getBoard();
          context.showSnackBar(context.localization.member_added_successfully,ToastStates.success,);
          if(context.mounted){
            context.pop();
          }
        }
      },
      child: child,
    );
  }
}
