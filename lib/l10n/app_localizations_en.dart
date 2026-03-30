// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'ISD TMS';

  @override
  String get initial_page => 'Initial Page';

  @override
  String get welcome_title => 'Welcome to TMS! 👋';

  @override
  String get welcome_subtitle =>
      'Please sign in to your account and start the adventure';

  @override
  String get login => 'Login';

  @override
  String get email_label => 'Email';

  @override
  String get email_hint => 'Enter your email';

  @override
  String get password_label => 'Password';

  @override
  String get password_hint => 'Enter your password';

  @override
  String get email_required => 'Email is required';

  @override
  String get invalid_email => 'Invalid email';

  @override
  String get password_required => 'Password is required';

  @override
  String get logout => 'Logout';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get my_projects => 'MY PROJECTS';

  @override
  String get no_projects_found => 'No projects found';

  @override
  String get board_view => 'Board View';

  @override
  String get task_created_success => 'Task created successfully';

  @override
  String get no_board_columns => 'No board columns found';

  @override
  String get add_task => 'Add Task';

  @override
  String get create_new_task => 'Create New Task';

  @override
  String get task_title => 'Task Title';

  @override
  String get enter_task_title => 'Enter task title';

  @override
  String get cancel => 'Cancel';

  @override
  String get create => 'Create';

  @override
  String get owner_label => 'Owner: ';

  @override
  String get adding_to => 'Adding to: ';

  @override
  String get just_now => 'just now';

  @override
  String get minute_ago => 'minute ago';

  @override
  String get minutes_ago => 'minutes ago';

  @override
  String get hour_ago => 'hour ago';

  @override
  String get hours_ago => 'hours ago';

  @override
  String get task_details => 'Task Details';

  @override
  String get task_updated_success => 'Task updated successfully';

  @override
  String get description => 'Description';

  @override
  String get due_date => 'Due Date';

  @override
  String get assignees => 'Assignees';

  @override
  String get labels => 'Labels';

  @override
  String get comment_count => 'comments';

  @override
  String get created_at_prefix => 'Created: ';

  @override
  String get edit_task => 'Edit Task';

  @override
  String get title => 'Title';

  @override
  String get update => 'Update';

  @override
  String get updated_the_card => 'Updated the card';

  @override
  String get created_card => 'Created the card';

  @override
  String get uploaded_attachment => 'Uploaded an attachment';

  @override
  String get deleted_attachment => 'Deleted an attachment';

  @override
  String get change_the_assignee => 'Change the assignee';

  @override
  String get moved_the_card => 'Moved the card';

  @override
  String get type => 'Type';

  @override
  String get priority => 'Priority';

  @override
  String get status => 'Status';

  @override
  String get attachments => 'Attachments';
}
