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

  @override
  String get retry => 'Retry';

  @override
  String get save => 'Save';

  @override
  String get upload => 'Upload';

  @override
  String get notifications => 'Notifications';

  @override
  String get no_notifications => 'No notifications yet';

  @override
  String get are_you_sure_delete_task =>
      'Are you sure you want to delete this task?';

  @override
  String get task_deleted_success => 'Task deleted successfully';

  @override
  String get delete_task => 'Delete Task';

  @override
  String get delete => 'Delete';

  @override
  String comments_tab(int count) {
    return 'Comments ($count)';
  }

  @override
  String get history_tab => 'History';

  @override
  String get comments => 'Comments';

  @override
  String get add_comment_hint => 'Add Comment...';

  @override
  String get search_cards_hint => 'Search cards...';

  @override
  String get add_description_hint => 'Add Description...';

  @override
  String get assign_members => 'Assign Members';

  @override
  String get assigned_label => 'Assigned';

  @override
  String get not_set => 'Not Set';

  @override
  String get notification_moved => 'Moved';

  @override
  String get notification_mention => 'Mention';

  @override
  String get notification_assigned => 'Assigned';

  @override
  String get notification_comment => 'Comment';

  @override
  String get notification_project_owner => 'Project Owner';

  @override
  String get notification_member_added => 'Member Added';

  @override
  String get notification_default => 'Notification';

  @override
  String get admin_user => 'Admin User';

  @override
  String get ok => 'Ok';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get profile => 'Profile';

  @override
  String get language => 'Language';

  @override
  String get projects_management => 'Projects Management';

  @override
  String get you => 'You';

  @override
  String get add => 'Add';

  @override
  String get add_member => 'Add Member';

  @override
  String get role => 'Role';

  @override
  String get no_members_found => 'No members found';

  @override
  String get failed_to_load_members => 'Failed to load members';

  @override
  String get select_role => 'Select Role';

  @override
  String members_screen_title(String projectName) {
    return '$projectName Members';
  }

  @override
  String remove_member_confirmation(String memberName) {
    return 'Are you sure you want to remove $memberName from this project?';
  }

  @override
  String get role_changed_successfully => 'Role changed successfully';

  @override
  String get member_removed_successfully => 'Member removed successfully';

  @override
  String get ownership_transferred_successfully =>
      'Ownership transferred successfully';

  @override
  String get no_email => 'No email';

  @override
  String get member_role_chip => 'member';

  @override
  String get transfer_ownership => 'Transfer Ownership';

  @override
  String get transfer_ownership_critical_warning =>
      'This is a critical action that cannot be undone easily';

  @override
  String get transfer_ownership_description =>
      'You are about to transfer project ownership. The current owner will become an Admin, and the selected member will become the new Owner with full control.';

  @override
  String get select_new_owner => 'Select New Owner';

  @override
  String get transfer => 'Transfer';

  @override
  String get member_added_successfully => 'Member Added Successfully';
}
