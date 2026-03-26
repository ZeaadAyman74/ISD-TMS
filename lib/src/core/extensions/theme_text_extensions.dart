import 'package:flutter/material.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  const AppTextTheme({
    required this.font24Black700,
    required this.font20TextPrimaryBold,
    required this.font22TextPrimaryBold,
    required this.font14TextSecondaryRegular,
    required this.font18TextPrimarySemiBold,
    required this.font12TextSecondarySemiBold,
    required this.font16TextPrimarySemiBold,
    required this.font14TextPrimaryRegular,
    required this.font14TextPrimarySemiBold,
    required this.font14TextPrimaryBold,
    required this.font13TextPrimaryMedium,
    required this.font13TextPrimarySemiBold,
    required this.font11TextSecondaryRegular,
    required this.font10LabelRegular,
    required this.font7WhiteSemiBold,
    required this.font7TextSecondaryBold,
  });

  final TextStyle font24Black700;
  final TextStyle font20TextPrimaryBold;
  final TextStyle font22TextPrimaryBold;
  final TextStyle font14TextSecondaryRegular;
  final TextStyle font18TextPrimarySemiBold;
  final TextStyle font12TextSecondarySemiBold;
  final TextStyle font16TextPrimarySemiBold;
  final TextStyle font14TextPrimaryRegular;
  final TextStyle font14TextPrimarySemiBold;
  final TextStyle font14TextPrimaryBold;
  final TextStyle font13TextPrimaryMedium;
  final TextStyle font13TextPrimarySemiBold;
  final TextStyle font11TextSecondaryRegular;
  final TextStyle font10LabelRegular;
  final TextStyle font7WhiteSemiBold;
  final TextStyle font7TextSecondaryBold;

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? font24Black700,
    TextStyle? font20TextPrimaryBold,
    TextStyle? font22TextPrimaryBold,
    TextStyle? font14TextSecondaryRegular,
    TextStyle? font18TextPrimarySemiBold,
    TextStyle? font12TextSecondarySemiBold,
    TextStyle? font16TextPrimarySemiBold,
    TextStyle? font14TextPrimaryRegular,
    TextStyle? font14TextPrimarySemiBold,
    TextStyle? font14TextPrimaryBold,
    TextStyle? font13TextPrimaryMedium,
    TextStyle? font13TextPrimarySemiBold,
    TextStyle? font11TextSecondaryRegular,
    TextStyle? font10LabelRegular,
    TextStyle? font7WhiteSemiBold,
    TextStyle? font7TextSecondaryBold,
  }) {
    return AppTextTheme(
      font24Black700: font24Black700 ?? this.font24Black700,
      font20TextPrimaryBold:
          font20TextPrimaryBold ?? this.font20TextPrimaryBold,
      font22TextPrimaryBold:
          font22TextPrimaryBold ?? this.font22TextPrimaryBold,
      font14TextSecondaryRegular:
          font14TextSecondaryRegular ?? this.font14TextSecondaryRegular,
      font18TextPrimarySemiBold:
          font18TextPrimarySemiBold ?? this.font18TextPrimarySemiBold,
      font12TextSecondarySemiBold:
          font12TextSecondarySemiBold ?? this.font12TextSecondarySemiBold,
      font16TextPrimarySemiBold:
          font16TextPrimarySemiBold ?? this.font16TextPrimarySemiBold,
      font14TextPrimaryRegular:
          font14TextPrimaryRegular ?? this.font14TextPrimaryRegular,
      font14TextPrimarySemiBold:
          font14TextPrimarySemiBold ?? this.font14TextPrimarySemiBold,
      font14TextPrimaryBold:
          font14TextPrimaryBold ?? this.font14TextPrimaryBold,
      font13TextPrimaryMedium:
          font13TextPrimaryMedium ?? this.font13TextPrimaryMedium,
      font13TextPrimarySemiBold:
          font13TextPrimarySemiBold ?? this.font13TextPrimarySemiBold,
      font11TextSecondaryRegular:
          font11TextSecondaryRegular ?? this.font11TextSecondaryRegular,
      font10LabelRegular: font10LabelRegular ?? this.font10LabelRegular,
      font7WhiteSemiBold: font7WhiteSemiBold ?? this.font7WhiteSemiBold,
      font7TextSecondaryBold:
          font7TextSecondaryBold ?? this.font7TextSecondaryBold,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme(
      font24Black700: TextStyle.lerp(font24Black700, other.font24Black700, t)!,
      font20TextPrimaryBold:
          TextStyle.lerp(font20TextPrimaryBold, other.font20TextPrimaryBold, t)!,
      font22TextPrimaryBold:
          TextStyle.lerp(font22TextPrimaryBold, other.font22TextPrimaryBold, t)!,
      font14TextSecondaryRegular: TextStyle.lerp(
          font14TextSecondaryRegular, other.font14TextSecondaryRegular, t)!,
      font18TextPrimarySemiBold: TextStyle.lerp(
          font18TextPrimarySemiBold, other.font18TextPrimarySemiBold, t)!,
      font12TextSecondarySemiBold: TextStyle.lerp(
          font12TextSecondarySemiBold, other.font12TextSecondarySemiBold, t)!,
      font16TextPrimarySemiBold: TextStyle.lerp(
          font16TextPrimarySemiBold, other.font16TextPrimarySemiBold, t)!,
      font14TextPrimaryRegular: TextStyle.lerp(
          font14TextPrimaryRegular, other.font14TextPrimaryRegular, t)!,
      font14TextPrimarySemiBold: TextStyle.lerp(
          font14TextPrimarySemiBold, other.font14TextPrimarySemiBold, t)!,
      font14TextPrimaryBold:
          TextStyle.lerp(font14TextPrimaryBold, other.font14TextPrimaryBold, t)!,
      font13TextPrimaryMedium: TextStyle.lerp(
          font13TextPrimaryMedium, other.font13TextPrimaryMedium, t)!,
      font13TextPrimarySemiBold: TextStyle.lerp(
          font13TextPrimarySemiBold, other.font13TextPrimarySemiBold, t)!,
      font11TextSecondaryRegular: TextStyle.lerp(
          font11TextSecondaryRegular, other.font11TextSecondaryRegular, t)!,
      font10LabelRegular:
          TextStyle.lerp(font10LabelRegular, other.font10LabelRegular, t)!,
      font7WhiteSemiBold:
          TextStyle.lerp(font7WhiteSemiBold, other.font7WhiteSemiBold, t)!,
      font7TextSecondaryBold: TextStyle.lerp(
          font7TextSecondaryBold, other.font7TextSecondaryBold, t)!,
    );
  }
}
