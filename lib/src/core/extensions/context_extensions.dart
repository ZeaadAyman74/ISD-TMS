import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/l10n/app_localizations.dart';
import 'package:isd_tms/src/core/extensions/theme_colors_extensions.dart';
import 'package:isd_tms/src/core/extensions/theme_text_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/theme/app_theme.dart';


extension BuildContextExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get themeData => Theme.of(this);

  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>() ?? AppTheme.lightAppColors;

  AppTextTheme get appTextTheme =>
      Theme.of(this).extension<AppTextTheme>() ?? AppTheme.lightAppTextTheme;

  TextStyle get defaultTextStyle => DefaultTextStyle.of(this).style;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void popDialog() => Navigator.of(this, rootNavigator: true).pop();

  void pop() => Navigator.of(this,rootNavigator: true).pop();

  Future<Object?> push(String routeName, {Object? args}) =>
      Navigator.of(this, rootNavigator: true)
          .pushNamed(routeName, arguments: args);

  void pushReplacement(String routeName, {Object? args}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: args);

  void pushAndRemove(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false,
          arguments: args);

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get topPadding => MediaQuery.of(this).viewPadding.top;

  double get bottom => MediaQuery.of(this).viewInsets.bottom;

  void showAdaptiveDialog(
      {required String title,
        String? content,
        required String actionName,
        Color? actionColor,
        required void Function() onPress}) {
    if (Platform.isAndroid) {
      showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            content: Text(content ?? '',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            elevation: 5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600),
                ),
              ),
              TextButton(
                onPressed: () {
                  onPress();
                  context.pop();
                },
                child: Text(
                  actionName,
                  style: TextStyle(
                      color: actionColor ?? AppColors.primary,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: this,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600)),
          content: Text(content ?? '',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400)),
          insetAnimationCurve: Curves.ease,
          insetAnimationDuration: const Duration(microseconds: 600),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("Cancel",
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600)),
              onPressed: () => context.pop(),
            ),
            CupertinoDialogAction(
              onPressed: () {
                onPress();
                context.pop();
              },
              child: Text(actionName,
                  style: TextStyle(
                      color: actionColor ?? AppColors.primary,
                      fontWeight: FontWeight.w400)),
            )
          ],
        ),
      );
    }
  }

  void showMessageDialog({String? title, required String message}) {
    if (Platform.isAndroid) {
      showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            title: title != null
                ? Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp),
            )
                : null,
            content: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
            elevation: 5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: this,
        builder: (context) => CupertinoAlertDialog(
          title: Text(message,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600)),
          insetAnimationCurve: Curves.ease,
          insetAnimationDuration: const Duration(microseconds: 600),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child:  const Text('Ok',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600)),
              onPressed: () => context.pop(),
            ),
          ],
        ),
      );
    }
  }

  void showSnackBar(String message,IconData icon,Color iconBackgroundColor) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: iconBackgroundColor),
              child: Icon(
                icon,
                size: 20.w,
                color: Colors.white,
              )),
          SizedBox(width: 10.w,),
          Text(
            message,
            style: textTheme.bodySmall!.copyWith(color: Colors.white),
          )
        ],
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsetsDirectional.symmetric(vertical: 20.h, horizontal: 10.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      backgroundColor: AppColors.textPrimary,
      dismissDirection: DismissDirection.down,
      elevation: 5,
    ));
  }
}
