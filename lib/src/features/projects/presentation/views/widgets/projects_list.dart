import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/core/widgets/empty_state_widget.dart';
import 'package:isd_tms/src/core/widgets/error_state_widget.dart';
import 'package:isd_tms/src/features/projects/presentation/bloc/projects_cubit.dart';
import 'package:isd_tms/src/features/projects/presentation/views/widgets/project_card_widget.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state is ProjectsLoading) {
          return const AppLoading();
        }
        if (state is ProjectsError) {
          return ErrorStateWidget(
            message: state.error,
            onRetry: () =>
                context.read<ProjectsCubit>().getProjects(),
          );
        }
        if (state is ProjectsLoaded) {
          if (state.projects.isEmpty) {
            return EmptyStateWidget(
              message: context.localization.no_projects_found,
              icon: Icons.folder_open,
            );
          }
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: state.projects.length,
            separatorBuilder: (context, index) =>
               12.verticalSpace,
            itemBuilder: (context, index) {
              return ProjectCardWidget(
                project: state.projects[index],
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
