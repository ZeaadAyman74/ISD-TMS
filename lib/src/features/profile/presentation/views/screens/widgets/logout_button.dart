import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_utils.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/widgets/custom_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 40.h,horizontal: 16.w),
      child: CustomButton(
        onTap: () async {
          await HiveUtils.resetUserCache();
          if (context.mounted) {
            context.pushAndRemove(Routes.login);
          }
        },
        backgroundColor: AppColors.error,
        title: context.localization.logout,
      ),
    );
  }
}
