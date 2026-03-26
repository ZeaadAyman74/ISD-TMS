import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';



class ThemeStyles {
  const ThemeStyles._();

  static DatePickerThemeData lightPickerTheme = DatePickerThemeData(
    backgroundColor: Colors.white,
    headerForegroundColor: Colors.white,
    headerBackgroundColor: AppColors.primary,
    rangePickerBackgroundColor: Colors.white,
    rangePickerHeaderBackgroundColor: Colors.white,
    rangePickerSurfaceTintColor: Colors.white,
    rangeSelectionBackgroundColor: Colors.white,
    headerHeadlineStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        // fontFamily: FontFamily.urbanist
    ),
    weekdayStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: AppColors.primary,
    ),

    dayForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }else if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        return AppColors.primary;
      },
    ),
    todayForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppColors.primary;
      },
    ),
    yearBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return Colors.grey.shade300;
      },
    ),
    yearForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppColors.primary;
      },
    ),
    yearStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    rangeSelectionOverlayColor: WidgetStateProperty.resolveWith(
          (states) => AppColors.primary,
    ),
    dayBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return Colors.transparent;
      },
    ),
    cancelButtonStyle: cancelButtonStyle,
    confirmButtonStyle: confirmButtonStyle,
  );

  static TimePickerThemeData timePickerThemeData = TimePickerThemeData(
    backgroundColor:Colors.white,
    cancelButtonStyle: cancelButtonStyle,
    confirmButtonStyle: confirmButtonStyle,
    hourMinuteTextColor: Colors.black,
    dialTextColor: Colors.black,
  );

  // static TimePickerThemeData darkTimePickerTheme = TimePickerThemeData(
  //   cancelButtonStyle: cancelButtonStyle,
  //   confirmButtonStyle: confirmButtonStyle,
  //   hourMinuteTextColor: Colors.white,
  //   dialTextColor:  AppColors.primary,
  // );
  // static DatePickerThemeData darkDatePickerTheme = DatePickerThemeData(
  //   headerForegroundColor: Colors.white,
  //   rangePickerBackgroundColor: Colors.white,
  //   rangePickerHeaderBackgroundColor: Colors.white,
  //   rangeSelectionBackgroundColor: Colors.white,
  //   rangePickerHeaderForegroundColor: Colors.white,
  //   headerHeadlineStyle: TextStyle(
  //     fontSize: 14.sp,
  //     fontWeight: FontWeight.w300,
  //     color: AppColors.primary,
  //   ),
  //   weekdayStyle: TextStyle(
  //     fontSize: 14.sp,
  //     fontWeight: FontWeight.w300,
  //     color: AppColors.primary,
  //   ),
  //   dayForegroundColor: WidgetStateProperty.resolveWith(
  //         (states) => AppColors.primary,
  //   ),
  //   todayForegroundColor: WidgetStateProperty.resolveWith(
  //         (states) => Colors.black,
  //   ),
  //
  //   yearBackgroundColor: WidgetStateProperty.resolveWith(
  //         (states) {
  //       if (states.contains(WidgetState.selected)) {
  //         return AppColors.primary;
  //       }
  //       return Colors.grey.shade300;
  //     },
  //   ),
  //   yearOverlayColor: WidgetStateProperty.resolveWith(
  //         (states) => AppColors.primaryLight,
  //   ),
  //   yearForegroundColor: WidgetStateProperty.resolveWith(
  //         (states) {
  //       if (states.contains(WidgetState.selected)) {
  //         return Colors.white;
  //       }
  //       return AppColors.blackColor;
  //     },
  //   ),
  //   yearStyle: TextStyle(
  //     fontSize: 14.sp,
  //     fontWeight: FontWeight.w300,
  //     color: Colors.black,
  //   ),
  //   rangeSelectionOverlayColor: WidgetStateProperty.resolveWith(
  //         (states) => AppColors.primaryLight,
  //   ),
  //   dayBackgroundColor: WidgetStateProperty.resolveWith(
  //         (states) {
  //       if (states.contains(WidgetState.selected)) {
  //         return Colors.grey.shade300;
  //       }
  //       return Colors.transparent;
  //     },
  //   ),
  //   cancelButtonStyle: cancelButtonStyle,
  //   confirmButtonStyle: confirmButtonStyle,
  // );

  static ButtonStyle cancelButtonStyle = ButtonStyle(
    textStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: Colors.red,
      ),
    ),
    foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.red),
  );

  static ButtonStyle confirmButtonStyle = ButtonStyle(
    textStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.primary,
      ),
    ),
    foregroundColor: WidgetStateProperty.resolveWith(
          (states) => AppColors.primary,
    ),
  );
}
