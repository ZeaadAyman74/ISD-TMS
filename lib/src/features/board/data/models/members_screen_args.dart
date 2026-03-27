import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class MembersScreenArgs {
  final List<BoardMember> members;
  final String projectName;

  MembersScreenArgs({required this.members, required this.projectName});
}
