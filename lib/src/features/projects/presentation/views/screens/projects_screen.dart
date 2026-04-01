import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_utils.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/projects/presentation/views/widgets/projects_body.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: context.appColors.appBarBackground,
        elevation: 0.5,
        title: Row(
          children: [
            Icon(Icons.task_alt_rounded, color: AppColors.primary, size: 28.r),
            SizedBox(width: 8.w),
            Text(
              context.localization.app_title,
              style: context.appTextTheme.font20TextPrimaryBold,
            ),
          ],
        ),
        actions: [
          // Notifications icon
          IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary,
              size: 24.r,
            ),
            onPressed: () {
              context.push(Routes.notifications);
            },
          ),
          // User avatar to push to Profile screen
          GestureDetector(
            onTap: () {
              context.push(Routes.profile);
            },
            child: CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 16.r,
              child: Text(
                HiveUtils.user?.fullName.isNotEmpty == true
                    ? HiveUtils.user!.fullName[0].toUpperCase()
                    : 'U',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: const ProjectsBody(),
    );
  }
}

