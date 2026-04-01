import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/gen/assets.gen.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/profile/presentation/views/screens/widgets/settings/language/languages_list.dart';
import 'package:isd_tms/src/root/localization_manager.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical:10.h ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Change Language',
              style: context.appTextTheme.font16TextPrimarySemiBold,
            ),
            const Divider(),
            LanguagesList(
              languages: [
                LocaleModel(
                  localeCode: 'en',
                  languageName: context.localization.english,
                  flagPath: Assets.icons.us,
                ),
                LocaleModel(
                  localeCode: 'ar',
                  languageName: context.localization.arabic,
                  flagPath: Assets.icons.sa,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
