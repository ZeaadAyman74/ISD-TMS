import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/member_card.dart';

class MembersList extends StatelessWidget {
  const MembersList({super.key,required this.members});
final List<BoardMember>members;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: members.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final member = members[index];
        return MemberCard(member: member);
      },
    );
  }
}
