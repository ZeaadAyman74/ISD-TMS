import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_back_button.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/core/widgets/error_state_widget.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/members_screen_args.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/members/members_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/add_memeber/add_member_fab.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/members_bloc_listener.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/members_list.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key, required this.args});

  final MembersScreenArgs args;

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  MembersCubit get cubit => context.read<MembersCubit>();
  BoardCubit get boardCubit => context.read<BoardCubit>();

  @override
  void initState() {
    super.initState();
    cubit.setCurrentProject(widget.args.project);
    cubit.setCurrentMembers(boardCubit.members);
    cubit.getRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          context.localization.members_screen_title(widget.args.project.name),
          style: context.appTextTheme.font16TextPrimarySemiBold,
        ),
        leading: const AppBackButton(),
      ),
      body: MembersBlocListener(
        child: BlocBuilder<MembersCubit, MembersState>(
          buildWhen: (previous, current) =>
              current is GetRolesLoading ||
              current is GetRolesError ||
              current is GetRolesSuccess,
          builder: (context, state) {
            if (state is GetRolesLoading) {
              return const AppLoading();
            }
            if (state is GetRolesError) {
              return ErrorStateWidget(message: state.error);
            }
            return BlocBuilder<BoardCubit, BoardState>(
              builder: (context, state) {
                return MembersList(
                  members: boardCubit.members,
                  canDeleteMember:
                      boardCubit

                          .permissions
                          ?.projectMembers
                          ?.remove ??
                      false,
                  canChangeRole:
                      boardCubit

                          .permissions
                          ?.projectMembers
                          ?.changeRole ??
                      false,
                  roles: cubit.roles,
                  onRoleChanged: (member, role) {
                    cubit.changeMemberRole(
                      userId: member.userId,
                      roleValue: role.value,
                    );
                  },
                  onDelete: (member) {
                    context.showAdaptiveDialog(
                      title: context.localization.delete,
                      content: context.localization.remove_member_confirmation(member.name),
                      actionName: context.localization.delete,
                      actionColor: Colors.red,
                      onPress: () {
                        cubit.deleteMember(userId: member.userId);
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton:
          (boardCubit.permissions?.projectMembers?.add ?? false)
          ? const AddMemberFab()
          : null,
    );
  }

  // bool get _canManageMembers {
  //   final currentMember = widget.args.project.currentMember;
  //   if (currentMember == null) return false;
  //   final role = currentMember.role.toLowerCase();
  //   return role == 'owner' || role == 'admin';
  // }
}
