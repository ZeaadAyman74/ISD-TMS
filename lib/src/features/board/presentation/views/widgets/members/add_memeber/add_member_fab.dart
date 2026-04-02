import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/di/dependency_injection.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/add_member/add_member_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/members/members_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/add_memeber/add_member_dialog.dart';

class AddMemberFab extends StatelessWidget {
  const AddMemberFab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MembersCubit>();
    final boardCubit=context.read<BoardCubit>();
    return BlocBuilder(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is GetRolesError ||
          current is GetRolesLoading ||
          current is GetRolesSuccess,
      builder: (context, state) {
        if(state is GetRolesLoading || state is GetRolesError){
          return const SizedBox.shrink();
        }
        return FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => getIt<AddMemberCubit>(),),
                  BlocProvider.value(
                    value: cubit,
                  ),
                  BlocProvider.value(
                    value: boardCubit,
                  ),
                ],
                child: const AddMemberDialog(),
              ),
            );
          },
          backgroundColor: context.appColors.primary,
          child: const Icon(Icons.add, color: Colors.white),
        );
      },
    );
  }
}
