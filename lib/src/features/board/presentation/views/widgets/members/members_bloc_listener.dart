import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_utils.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/utils/enums.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/members/members_cubit.dart';

class MembersBlocListener extends StatelessWidget {
  const MembersBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    BoardCubit boardCubit = context.read<BoardCubit>();
    return BlocListener<MembersCubit, MembersState>(
      listener: (context, state) {
        // Change Role
        if (state is ChangeRoleError) {
          context.showSnackBar(
            state.error,
            ToastStates.error,
            icon: Icons.error_outline,
          );
        } else if (state is ChangeRoleSuccess) {
          boardCubit.getBoard();
          context.showSnackBar(
            context.localization.role_changed_successfully,
            ToastStates.success,
          );
        }
        // Delete Member
        else if (state is DeleteMemberError) {
          context.showSnackBar(
            state.error,
            ToastStates.error,
            icon: Icons.error_outline,
          );
        } else if (state is DeleteMemberSuccess) {
          if(state.userId!= HiveUtils.user?.id){
            boardCubit.getBoard();
            context.showSnackBar(
              context.localization.member_removed_successfully,
              ToastStates.success,
            );
          }else {
            context.pushAndRemove(Routes.projects);
          }
        }
        // Transfer Ownership
        else if (state is TransferOwnershipError) {
          context.showSnackBar(
            state.error,
            ToastStates.error,
            icon: Icons.error_outline,
          );
        } else if (state is TransferOwnershipSuccess) {
          boardCubit.getBoard();
          context.showSnackBar(
            context.localization.ownership_transferred_successfully,
            ToastStates.success,
          );
        }
      },
      child: child,
    );
  }
}
