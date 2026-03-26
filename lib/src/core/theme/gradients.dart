import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';

class AppGradients {
  static LinearGradient get primaryHorizontal => LinearGradient(
        colors: AppColors.primaryGradient,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );

  static LinearGradient get primaryVertical => LinearGradient(
        colors: AppColors.primaryGradient,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  static LinearGradient get glassEffect => LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.1),
          Colors.white.withValues(alpha: 0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
