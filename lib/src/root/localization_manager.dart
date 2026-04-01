import 'package:flutter/material.dart';
import 'package:isd_tms/gen/assets.gen.dart';
import 'package:isd_tms/l10n/app_localizations.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';

class LocalizationManager {
  // A null value means "use device locale preference".
  final ValueNotifier<Locale?> appLocaleNotifier = ValueNotifier(null);

  LocalizationManager() {
    _loadLocalePreference();
  }

  // Called to load the user's saved preference from SharedPreferences
  Future<void> _loadLocalePreference() async {
    final localeCode = SharedPrefUtils.locale;

    Locale? loadedLocale;
    if (localeCode != null) {
      final parts = localeCode.split('_');
      loadedLocale =
      parts.length == 2 ? Locale(parts[0], parts[1]) : Locale(parts[0]);
    }
    appLocaleNotifier.value = loadedLocale;
  }

  // Method to set a new locale for the app
  // Passing null will revert to using the device's locale
  Future<void> setAppLocale(Locale? locale) async {
    appLocaleNotifier.value = locale; // Update the ValueNotifier
    if (locale == null) {
      await SharedPrefUtils
          .deleteLocale(); // Remove preference to indicate device default
    } else {
      AppLocalizations.delegate.load(locale);
      await SharedPrefUtils.setLocale(locale.languageCode);
    }
    // ValueNotifier handles the notification to listeners automatically when its value changes
  }

  // This is the crucial method for resolving the *effective* locale for MaterialApp
  Locale? resolveAppLocale(
      Locale? deviceLocale, Iterable<Locale> supportedLocales) {
    Locale? resolvedLocale;
    // 1. If the user has explicitly chosen a locale in the app (stored in appLocaleNotifier.value)
    if (appLocaleNotifier.value != null) {
      resolvedLocale = appLocaleNotifier.value!;
      // Check if the chosen locale is actually supported by the app
      if (supportedLocales.contains(resolvedLocale)) {
        return resolvedLocale;
      }
      // If chosen locale is not supported, fallback to app's default (e.g., English)
      return const Locale('en');
    }

    // 2. If no explicit choice, use device locale
    if (deviceLocale != null) {
      // Check if device locale is directly supported (e.g., en_US matches en_US)
      if (supportedLocales.contains(deviceLocale)) {
        resolvedLocale = Locale(deviceLocale.languageCode);
      } else {
        // Check if device language is supported, even if region isn't exact (e.g., en_GB for en_US)
        final languageOnlyLocale = Locale(deviceLocale.languageCode);
        if (supportedLocales.any((supported) =>
        supported.languageCode == languageOnlyLocale.languageCode)) {
          // Find the first supported locale that matches the language code
          resolvedLocale = supportedLocales.firstWhere((supported) =>
          supported.languageCode == languageOnlyLocale.languageCode);
        }
      }
    }

    resolvedLocale ??= const Locale('en');
    SharedPrefUtils.setLocale(resolvedLocale.languageCode);
    // 3. Fallback to app's default locale if neither user choice nor device locale leads to a supported language
    return resolvedLocale;
  }

  static String getLanguageName(String locale, BuildContext context) {
    switch (locale) {
      case 'ar':
        return context.localization.arabic;
      case 'en':
        return context.localization.english;
      default:
        return context.localization.english;
    }
  }

  static Map<String, String> languagesFlags = {
    'ar': Assets.icons.sa,
    'en': Assets.icons.us,
  };

  // Remember to dispose the ValueNotifier when the manager is no longer needed
  void dispose() {
    appLocaleNotifier.dispose();
  }
}
class LocaleModel {
  final String localeCode;
  final String languageName;
  final String flagPath;

  LocaleModel(
      {required this.localeCode,
        required this.languageName,
        required this.flagPath});
}
