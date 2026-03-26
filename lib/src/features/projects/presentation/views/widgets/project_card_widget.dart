import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.board,
          arguments: project,
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: context.appColors.cardBackground,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Project icon
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.dashboard_outlined,
                color: AppColors.primary,
                size: 22.r,
              ),
            ),
            SizedBox(width: 12.w),
            // Project info
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      project.name,
                      style: context.appTextTheme.font14TextPrimarySemiBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (project.owner != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      '${context.localization.owner_label}${project.owner!.fullName}',
                      style: context.appTextTheme.font11TextSecondaryRegular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            // Arrow
            Icon(
              Icons.chevron_right,
              color: AppColors.textHint,
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}
