import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/l10n/app_localizations.dart';
import 'package:isd_tms/src/core/router/router.main.dart';
import 'package:isd_tms/src/core/theme/app_theme.dart';

class IsdTmsApp extends StatelessWidget {
  const IsdTmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'ISD TMS',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          localeListResolutionCallback: (_, __) {
            return const Locale("en");
          },
          locale: const Locale("en"),
          localeResolutionCallback: (_, __) {
            return const Locale("en");
          },
          navigatorKey: AppRouter.navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: '/',
        );
      },
    );
  }
}
