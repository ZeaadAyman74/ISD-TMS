import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/projects/presentation/views/widgets/projects_list.dart';

class ProjectsBody extends StatelessWidget {
  const ProjectsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dashboard title
          Text(
            context.localization.dashboard,
            style: context.appTextTheme.font18TextPrimarySemiBold,
          ),
          8.verticalSpace,
          Text(
            context.localization.my_projects,
            style: context.appTextTheme.font12TextSecondarySemiBold,
          ),
          16.verticalSpace,
          // Projects List
          const Expanded(
            child: ProjectsList(),
          ),
        ],
      ),
    );
  }
}
