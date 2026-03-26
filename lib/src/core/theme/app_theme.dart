import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/theme_colors_extensions.dart';
import 'package:isd_tms/src/core/extensions/theme_text_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.primary,
      error: AppColors.error,
      surface: AppColors.cardBackground,
      brightness: Brightness.light,
    ),
    fontFamily: 'Public Sans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Public Sans',
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Public Sans',
        ),
      ),
    ),
  );

  static const lightAppColors = AppColorsExtension(
    primary: AppColors.primary,
    scaffoldBackground: AppColors.background,
    cardBackground: AppColors.cardBackground,
    appBarBackground: Colors.white,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    textHint: AppColors.textHint,
    secondaryBackground: Color(0xFFE2E8F0),
  );

  static AppTextTheme lightAppTextTheme = AppTextTheme(
    font24Black700: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    font20TextPrimaryBold: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    font22TextPrimaryBold: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    font14TextSecondaryRegular: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
    ),
    font18TextPrimarySemiBold: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    font12TextSecondarySemiBold: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textSecondary,
      letterSpacing: 1,
    ),
    font16TextPrimarySemiBold: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    font14TextPrimaryRegular: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    font14TextPrimarySemiBold: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    font14TextPrimaryBold: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    font13TextPrimaryMedium: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    font13TextPrimarySemiBold: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    font11TextSecondaryRegular: TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
    ),
    font10LabelRegular: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary, // Assuming primary text color for light theme
    ),
    font7WhiteSemiBold: TextStyle(
      fontSize: 7.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    font7TextSecondaryBold: TextStyle(
      fontSize: 7.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.textSecondary,
    ),
  );

  /// ----------------------------------------------------------
  /// --------------------- Dark ------------------------------
  /// ----------------------------------------------------------

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.primary,
          error: AppColors.error,
          surface: const Color(0xFF1E293B),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Public Sans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F172A),
          elevation: 0,
          centerTitle: true,
        ),
      );

  static const darkAppColors = AppColorsExtension(
    primary: AppColors.primary,
    scaffoldBackground: Color(0xFF0F172A),
    cardBackground: Color(0xFF1E293B),
    appBarBackground: Color(0xFF0F172A),
    textPrimary: Colors.white,
    textSecondary: Color(0xFF94A3B8),
    textHint: Color(0xFF64748B),
    secondaryBackground: Color(0xFF334155),
  );

  static AppTextTheme darkAppTextTheme = AppTextTheme(
    font24Black700: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    font20TextPrimaryBold: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    font22TextPrimaryBold: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    font14TextSecondaryRegular: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF94A3B8),
    ),
    font18TextPrimarySemiBold: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    font12TextSecondarySemiBold: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF94A3B8),
      letterSpacing: 1,
    ),
    font16TextPrimarySemiBold: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    font14TextPrimaryRegular: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    font14TextPrimarySemiBold: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    font14TextPrimaryBold: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    font13TextPrimaryMedium: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    font13TextPrimarySemiBold: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    font11TextSecondaryRegular: TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF94A3B8),
    ),
    font10LabelRegular: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
    ),
    font7WhiteSemiBold: TextStyle(
      fontSize: 7.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    font7TextSecondaryBold: TextStyle(
      fontSize: 7.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF94A3B8),
    ),
  );
}
