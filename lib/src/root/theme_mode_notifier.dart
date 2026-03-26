import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';

class ThemeModeNotifier extends ValueNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  // Method to load the saved theme mode from SharedPreferences
  Future<void> _loadThemeMode() async {
    int  themeModeIndex=SharedPrefUtils.themeModeIndex ?? ThemeMode.system.index;
    value = ThemeMode.values[themeModeIndex]; // Update the value and notify listeners
  }

  // Method to save and change the theme mode
  void toggleTheme(bool isDark) {
    final newThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveThemeMode(newThemeMode);
    value = newThemeMode; // Update the value and notify listeners
  }

  // Method to explicitly set the theme mode
  void setThemeMode(ThemeMode mode) {
    if (value != mode) { // Only update if it's actually changing
      _saveThemeMode(mode);
      value = mode; // Update the value and notify listeners
    }
  }

  // Persistence (using shared_preferences)
  Future<void> _saveThemeMode(ThemeMode mode) async {
    await SharedPrefUtils.setThemeMode(mode.index);
  }
}

// Create a global instance of your ThemeModeNotifier
final themeModeNotifier = ThemeModeNotifier();