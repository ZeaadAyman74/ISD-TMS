import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/profile/data/models/setting_model.dart';
import 'package:isd_tms/src/features/profile/presentation/views/screens/widgets/settings/custom_list_tile.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key, required this.settings});

  final List<SettingModel> settings;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical:16.h ),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          CustomListTile(settingModel: settings[index]),
      separatorBuilder: (context, index) => 10.verticalSpace,
      itemCount: settings.length,
    );
  }
}
