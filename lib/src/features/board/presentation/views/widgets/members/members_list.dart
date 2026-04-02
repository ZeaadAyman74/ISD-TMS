import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/member_card/member_card.dart';

class MembersList extends StatelessWidget {
  const MembersList({
    super.key,
    required this.members,
    required this.canDeleteMember,
    required this.canChangeRole,
    required this.roles,
    required this.onRoleChanged,
    required this.onDelete,
  });

  final List<BoardMember> members;
  final bool canDeleteMember;
  final bool canChangeRole;
  final List<ProjectRoleModel> roles;
  final void Function(BoardMember member, ProjectRoleModel role) onRoleChanged;
  final void Function(BoardMember member) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: members.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final member = members[index];
        return MemberCard(
          member: member,
          canDeleteMember: canDeleteMember,
          canChangeRole: canChangeRole,
          roles: roles,
          onRoleChanged: (role) => onRoleChanged(member, role),
          onDelete: () => onDelete(member),
        );
      },
    );
  }
}
