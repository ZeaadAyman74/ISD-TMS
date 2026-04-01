import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';
import 'package:isd_tms/src/features/profile/presentation/views/screens/widgets/settings/language/language_tile.dart';
import 'package:isd_tms/src/root/localization_manager.dart';

class LanguagesList extends StatelessWidget {
  const LanguagesList({super.key, required this.languages});

  final List<LocaleModel> languages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => LanguageTile(
        localeModel: languages[index],
        isSelected: languages[index].localeCode == SharedPrefUtils.locale,
      ),
      separatorBuilder: (context, index) => Padding(
        padding:  EdgeInsets.symmetric(vertical: 5.h),
        child: const Divider(),
      ),
      itemCount: languages.length,
    );
  }
}
