import 'package:flutter/material.dart';

/// Colors extracted from the TMS website screenshots
abstract class AppColors {
  // Primary
  static const Color primary = Color(0xFF7C6BF0);
  static const Color primaryLight = Color(0xFFEAE7FD);

  // Sidebar / Dark
  static const Color sidebarDark = Color(0xFF2B2C40);
  static const Color darkText = Color(0xFF2B2C40);

  // Backgrounds
  static const Color background = Color(0xFFF5F5F9);
  static const Color cardBackground = Colors.white;

  // Text
  static const Color textPrimary = Color(0xFF2B2C40);
  static const Color textSecondary = Color(0xFF6C6C80);
  static const Color textHint = Color(0xFFAAAAAA);

  // Status
  static const Color error = Color(0xFFFF4757);
  static const Color success = Color(0xFF28C76F);
  static const Color warning = Color(0xFFFF9F43);

  // Board Column Headers (from website screenshot)
  static const Color todoColor = Color(0xFF6C757D);
  static const Color inProgressColor = Color(0xFF0D6EFD);
  static const Color reviewColor = Color(0xFFFFC107);
  static const Color doneColor = Color(0xFF198754);

  // Card Type Colors
  static const Color taskColor = Color(0xFF1976D2);
  static const Color bugColor = Color(0xFFE57373);
  static const Color storyColor = Color(0xFF26A69A);
  static const Color improvementColor = Color(0xFF7E57C2);

  // Priority Colors
  static const Color highPriority = Color(0xFFE57373);
  static const Color mediumPriority = Color(0xFFFBC02D);
  static const Color lowPriority = Color(0xFF388E3C);

  // Gradient
  static final List<Color> primaryGradient = [
    primary,
    const Color(0xFF9B8FF5),
  ];
}
