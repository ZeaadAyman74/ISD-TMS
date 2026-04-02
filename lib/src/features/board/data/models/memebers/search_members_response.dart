import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class SearchMembersResponse {
  final List<BoardMember> members;

  SearchMembersResponse(this.members);

  factory SearchMembersResponse.fromJson(Map<String, dynamic> json) {
    return SearchMembersResponse(
      json['data'] != null
          ? List.from(json['data'].map((e) => BoardMember.fromJson(e)))
          : [],
    );
  }
}
