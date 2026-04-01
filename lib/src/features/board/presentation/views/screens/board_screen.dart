import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/screens/board_body.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members_fab.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: context.appColors.appBarBackground,
        elevation: 0.5,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: context.appTextTheme.font16TextPrimarySemiBold,
            ),
            Text(
              context.localization.board_view,
              style: context.appTextTheme.font11TextSecondaryRegular,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.textSecondary),
            onPressed: () =>
                context.read<BoardCubit>().getBoard(),
          ),
        ],
      ),
      body: BoardBody(projectId: project.id),
      floatingActionButton: const MembersFab(),
    );
  }
}
