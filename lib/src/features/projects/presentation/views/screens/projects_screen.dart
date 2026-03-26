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
              'TMS',
              style: context.appTextTheme.font20TextPrimaryBold,
            ),
          ],
        ),
        actions: [
          // User avatar / name
          if (HiveUtils.user != null)
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Center(
                child: Text(
                  HiveUtils.user!.fullName,
                  style: context.appTextTheme.font14TextSecondaryRegular,
                ),
              ),
            ),
          PopupMenuButton<String>(
            icon: CircleAvatar(
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
            onSelected: (value) async {
              if (value == 'logout') {
                await HiveUtils.resetUserCache();
                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.login,
                    (route) => false,
                  );
                }
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: AppColors.error, size: 20),
                   8.horizontalSpace,
                    Text(context.localization.logout),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: const ProjectsBody(),
    );
  }
}
