import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/features/board/data/models/members_screen_args.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';

class MembersFab extends StatelessWidget {
  const MembersFab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    return BlocBuilder(
      bloc: cubit,
      buildWhen: (prev, curr) =>
          curr is BoardLoading || curr is BoardLoaded || curr is BoardError,
      builder: (context, state) {
        if (state is BoardLoading ||
            state is BoardError ||
            !(cubit.currentProject?.permissions?.projectMembers?.show ??
                false)) {
          return const SizedBox.shrink();
        }
        return FloatingActionButton(
          onPressed: () {
            final cubit = context.read<BoardCubit>();
            context.push(
              Routes.members,
              args: MembersScreenArgs(
                members: cubit.members,
                projectName: cubit.currentProject?.name ?? '',
              ),
            );
          },
          backgroundColor: context.appColors.primary,
          child: const Icon(Icons.people_outline, color: Colors.white),
        );
      },
    );
  }
}
