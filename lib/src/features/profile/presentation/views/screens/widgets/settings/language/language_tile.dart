import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/main.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/widgets/app_svg_image.dart';
import 'package:isd_tms/src/root/localization_manager.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile(
      {super.key, required this.localeModel, required this.isSelected});

  final LocaleModel localeModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await localizationManager.setAppLocale(Locale(localeModel.localeCode));
        if(context.mounted){
          context.pushAndRemove(Routes.projects);
        }
      },
      child: Row(
        children: [
          AppSVGImage(image: localeModel.flagPath,
            width: 25.w,
            height: 25.w,
            boxFit: BoxFit.cover,),
          10.horizontalSpace,
          Expanded(
            child: Text(
              localeModel.languageName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTextTheme.font14TextPrimaryBold,
            ),
          ),
          10.horizontalSpace,
          if (isSelected)
            const Icon(
              Icons.check,
              color: AppColors.primary,
            )
        ],
      ),
    );
  }
}
