import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/assignee_filter/assignee_checkbox_list_tile.dart';

class AssigneesList extends StatelessWidget {
  const AssigneesList({super.key, required this.members});

  final List<BoardMember> members;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        final member = members[index];
        return AssigneeCheckboxListTile(
            member: member);
      },
    );
  }
}
