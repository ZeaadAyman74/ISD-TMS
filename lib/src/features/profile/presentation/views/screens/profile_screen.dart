import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_back_button.dart';
import 'package:isd_tms/src/features/profile/data/models/setting_model.dart';
import 'package:isd_tms/src/features/profile/presentation/views/screens/widgets/logout_button.dart';
import 'package:isd_tms/src/features/profile/presentation/views/screens/widgets/profile_card.dart';
import 'package:isd_tms/src/features/profile/presentation/views/screens/widgets/settings/language/change_language_dialog.dart';
import 'package:isd_tms/src/features/profile/presentation/views/screens/widgets/settings/settings_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: context.appColors.appBarBackground,
        elevation: 0,
        leading: const AppBackButton(),
        title: Text(
          context.localization.profile,
          style: context.appTextTheme.font18TextPrimarySemiBold,
        ),
      ),
      body: Column(
        children: [
          const ProfileCard(),
          SettingsList(
            settings: [
              SettingModel(
                title: context.localization.language,
                iconData: Icons.language,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ChangeLanguageDialog(),
                  );
                },
              ),
            ],
          ),
          const LogoutButton(),
        ],
      ),
    );
  }
}
