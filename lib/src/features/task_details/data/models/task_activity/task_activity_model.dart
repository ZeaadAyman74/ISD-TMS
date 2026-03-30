import 'package:isd_tms/src/core/utils/app_date_formater.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class TaskActivitiesResponse {
  final List<TaskActivityModel> activities;

  TaskActivitiesResponse({required this.activities});

  factory TaskActivitiesResponse.fromJson(Map<String, dynamic> json) {
    return TaskActivitiesResponse(
      activities: json['data'] != null
          ? List.from(json['data'].map((e) => TaskActivityModel.fromJson(e)))
          : [],
    );
  }
}
//-----------------------------------------------------------------------

class TaskActivityModel {
  const TaskActivityModel({
    required this.id,
    required this.action,
    required this.date,
    this.actor,
    this.changes = const [],
  });

  final int id;
  final ActivityAction action;
  final String date;
  final ActivityActor? actor;
  final List<ActivityChange> changes;

  factory TaskActivityModel.fromJson(Map<String, dynamic> json) {
    ActivityAction action = getAction(json['action'] ?? '');
    return TaskActivityModel(
      id: json['id'] ?? 0,
      action: action,
      date: json['date'] ?? '',
      actor: json['actor'] != null
          ? ActivityActor.fromJson(json['actor'])
          : null,
      changes:
          (json['changes'] as List?)
              ?.map((e) => ActivityChange.fromJson(e, action))
              .toList() ??
          [],
    );
  }

  static ActivityAction getAction(String actionStr) {
    switch (actionStr) {
      case 'card_created':
        return ActivityAction.cardCreated;
      case 'card_updated':
        return ActivityAction.cardUpdated;
      case 'card_moved':
        return ActivityAction.cardMoved;
      case 'attachment_deleted':
        return ActivityAction.attachmentDeleted;
      case 'card_assignees_updated':
        return ActivityAction.cardAssigneesUpdated;
      case 'attachment_uploaded':
        return ActivityAction.attachmentUploaded;
      default:
        return ActivityAction.cardUpdated;
    }
  }
}

enum ActivityAction {
  cardCreated,
  cardUpdated,
  cardMoved,
  attachmentUploaded,
  attachmentDeleted,
  cardAssigneesUpdated,
}
//-----------------------------------------------------------------------

class ActivityActor {
  const ActivityActor({
    required this.id,
    required this.name,
    this.avatar,
    this.email,
  });

  final int id;
  final String name;
  final String? avatar;
  final String? email;

  factory ActivityActor.fromJson(Map<String, dynamic> json) {
    return ActivityActor(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      avatar: json['avatar'],
      email: json['email'],
    );
  }
}

//-----------------------------------------------------------------------
class ActivityChange {
  const ActivityChange({
    required this.field,
    this.oldDisplay,
    this.newDisplay,
    this.oldAssignees,
    this.newAssignees,
  });

  final ActivityField? field;
  final dynamic oldDisplay;
  final dynamic newDisplay;
  final String? oldAssignees;
  final String? newAssignees;

  factory ActivityChange.fromJson(
    Map<String, dynamic> json,
    ActivityAction action,
  ) {
    final field =getActivityField(json['field'] ?? '');
    dynamic oldDisplay,newDisplay;
    String? oldAssignees, newAssignees;
     oldDisplay = (json['old_display'] is String? && field==ActivityField.dueDate)
        ? AppDateFormatter.textTFormat(json['old_display'], 'dd/MM/yyyy')
        : json['old_display'] ?? 'None';
     newDisplay =(json['new_display'] is String? && field==ActivityField.dueDate)?
        AppDateFormatter.textTFormat(json['new_display'], 'dd/MM/yyyy'):
        json['new_display'] ??
        'None';

    if (oldDisplay is List<dynamic>) {
      List<BoardMember> members = List.from(
        oldDisplay.map((e) => BoardMember.fromJson(e)),
      );
      oldAssignees = formatDisplay(members);
    }
    if (newDisplay is List<dynamic>) {
      List<BoardMember> members = List.from(
        newDisplay.map((e) => BoardMember.fromJson(e)),
      );
      newAssignees = formatDisplay(members);
    }

    return ActivityChange(
      field: field,
      oldDisplay: oldDisplay,
      newDisplay: newDisplay,
      newAssignees: newAssignees,
      oldAssignees: oldAssignees,
    );
  }

  static String formatDisplay(List<BoardMember>? members) {
    if (members == null || members.isEmpty) {
      return "None";
    }

    return members.map((m) => m.name).join(', ');
  }

  static ActivityField? getActivityField(String field) {
    switch (field) {
      case 'due_date':
        return ActivityField.dueDate;
      case 'priority':
        return ActivityField.priority;
      case 'file_name':
        return ActivityField.attachments;
      case 'assignees':
        return ActivityField.assignees;
      case 'list':
        return ActivityField.status;
      case 'title':
        return ActivityField.title;
      case 'description':
        return ActivityField.description;
      case 'type':
        return ActivityField.type;
    }
    return null;
  }
}

enum ActivityField {
  dueDate,
  priority,
  attachments,
  status,
  description,
  title,
  type,
  assignees,
}
