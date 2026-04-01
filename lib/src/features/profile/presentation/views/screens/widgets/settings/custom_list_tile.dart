import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_svg_image.dart';
import 'package:isd_tms/src/features/profile/data/models/setting_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.settingModel});

  final SettingModel settingModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: settingModel.onTap,
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: context.appColors.cardBackground,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: context.appColors.secondaryBackground),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (settingModel.svgIcon != null)
              AppSVGImage(
                image: settingModel.svgIcon!,
                width: 25.w,
                height: 25.w,
              ),
            if (settingModel.iconData != null)
              Icon(
                settingModel.iconData,
                size: 25.w,
                color: context.themeData.primaryColor,
              ),
            10.horizontalSpace,
            Expanded(
              child: Text(
                settingModel.title,
                style: context.appTextTheme.font14TextSecondaryRegular,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
