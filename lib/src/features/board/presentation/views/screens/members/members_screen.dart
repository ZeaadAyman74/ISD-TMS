import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_back_button.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/members_screen_args.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/members_list.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key, required this.args});

  final MembersScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          '${args.projectName} Members',
          style: context.appTextTheme.font16TextPrimarySemiBold,
        ),
        leading: const AppBackButton(),
      ),
      body: MembersList(members: args.members),
    );
  }
}
