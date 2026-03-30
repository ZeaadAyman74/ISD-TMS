import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'ISD TMS'**
  String get app_title;

  /// The text for the initial page
  ///
  /// In en, this message translates to:
  /// **'Initial Page'**
  String get initial_page;

  /// No description provided for @welcome_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to TMS! 👋'**
  String get welcome_title;

  /// No description provided for @welcome_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to your account and start the adventure'**
  String get welcome_subtitle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email_label;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get email_hint;

  /// No description provided for @password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password_label;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get password_hint;

  /// No description provided for @email_required.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get email_required;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalid_email;

  /// No description provided for @password_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get password_required;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @my_projects.
  ///
  /// In en, this message translates to:
  /// **'MY PROJECTS'**
  String get my_projects;

  /// No description provided for @no_projects_found.
  ///
  /// In en, this message translates to:
  /// **'No projects found'**
  String get no_projects_found;

  /// No description provided for @board_view.
  ///
  /// In en, this message translates to:
  /// **'Board View'**
  String get board_view;

  /// No description provided for @task_created_success.
  ///
  /// In en, this message translates to:
  /// **'Task created successfully'**
  String get task_created_success;

  /// No description provided for @no_board_columns.
  ///
  /// In en, this message translates to:
  /// **'No board columns found'**
  String get no_board_columns;

  /// No description provided for @add_task.
  ///
  /// In en, this message translates to:
  /// **'Add Task'**
  String get add_task;

  /// No description provided for @create_new_task.
  ///
  /// In en, this message translates to:
  /// **'Create New Task'**
  String get create_new_task;

  /// No description provided for @task_title.
  ///
  /// In en, this message translates to:
  /// **'Task Title'**
  String get task_title;

  /// No description provided for @enter_task_title.
  ///
  /// In en, this message translates to:
  /// **'Enter task title'**
  String get enter_task_title;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @owner_label.
  ///
  /// In en, this message translates to:
  /// **'Owner: '**
  String get owner_label;

  /// No description provided for @adding_to.
  ///
  /// In en, this message translates to:
  /// **'Adding to: '**
  String get adding_to;

  /// No description provided for @just_now.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get just_now;

  /// No description provided for @minute_ago.
  ///
  /// In en, this message translates to:
  /// **'minute ago'**
  String get minute_ago;

  /// No description provided for @minutes_ago.
  ///
  /// In en, this message translates to:
  /// **'minutes ago'**
  String get minutes_ago;

  /// No description provided for @hour_ago.
  ///
  /// In en, this message translates to:
  /// **'hour ago'**
  String get hour_ago;

  /// No description provided for @hours_ago.
  ///
  /// In en, this message translates to:
  /// **'hours ago'**
  String get hours_ago;

  /// No description provided for @task_details.
  ///
  /// In en, this message translates to:
  /// **'Task Details'**
  String get task_details;

  /// No description provided for @task_updated_success.
  ///
  /// In en, this message translates to:
  /// **'Task updated successfully'**
  String get task_updated_success;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @due_date.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get due_date;

  /// No description provided for @assignees.
  ///
  /// In en, this message translates to:
  /// **'Assignees'**
  String get assignees;

  /// No description provided for @labels.
  ///
  /// In en, this message translates to:
  /// **'Labels'**
  String get labels;

  /// No description provided for @comment_count.
  ///
  /// In en, this message translates to:
  /// **'comments'**
  String get comment_count;

  /// No description provided for @created_at_prefix.
  ///
  /// In en, this message translates to:
  /// **'Created: '**
  String get created_at_prefix;

  /// No description provided for @edit_task.
  ///
  /// In en, this message translates to:
  /// **'Edit Task'**
  String get edit_task;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @updated_the_card.
  ///
  /// In en, this message translates to:
  /// **'Updated the card'**
  String get updated_the_card;

  /// No description provided for @created_card.
  ///
  /// In en, this message translates to:
  /// **'Created the card'**
  String get created_card;

  /// No description provided for @uploaded_attachment.
  ///
  /// In en, this message translates to:
  /// **'Uploaded an attachment'**
  String get uploaded_attachment;

  /// No description provided for @deleted_attachment.
  ///
  /// In en, this message translates to:
  /// **'Deleted an attachment'**
  String get deleted_attachment;

  /// No description provided for @change_the_assignee.
  ///
  /// In en, this message translates to:
  /// **'Change the assignee'**
  String get change_the_assignee;

  /// No description provided for @moved_the_card.
  ///
  /// In en, this message translates to:
  /// **'Moved the card'**
  String get moved_the_card;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @priority.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get priority;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @attachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
