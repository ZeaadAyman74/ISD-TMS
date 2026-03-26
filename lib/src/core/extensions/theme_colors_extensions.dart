import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color primary;
  final Color scaffoldBackground;
  final Color cardBackground;
  final Color appBarBackground;
  final Color textPrimary;
  final Color textSecondary;
  final Color textHint;
  final Color secondaryBackground;

  const AppColorsExtension({
    required this.primary,
    required this.scaffoldBackground,
    required this.cardBackground,
    required this.appBarBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.textHint,
    required this.secondaryBackground,
  });

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? scaffoldBackground,
    Color? cardBackground,
    Color? appBarBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? textHint,
    Color? secondaryBackground,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textHint: textHint ?? this.textHint,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textHint: Color.lerp(textHint, other.textHint, t)!,
      secondaryBackground:
          Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
    );
  }
}
