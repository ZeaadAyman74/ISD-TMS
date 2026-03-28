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

class TaskActivityModel {
  const TaskActivityModel({
    required this.id,
    required this.action,
    required this.date,
    this.actor,
    this.changes = const [],
  });

  final int id;
  final String action;
  final String date;
  final ActivityActor? actor;
  final List<ActivityChange> changes;

  factory TaskActivityModel.fromJson(Map<String, dynamic> json) {
    return TaskActivityModel(
      id: json['id'] ?? 0,
      action: json['action'] ?? '',
      date: json['date'] ?? '',
      actor: json['actor'] != null
          ? ActivityActor.fromJson(json['actor'])
          : null,
      changes:
          (json['changes'] as List?)
              ?.map((e) => ActivityChange.fromJson(e))
              .toList() ??
          [],
    );
  }
}

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

class ActivityChange {
  const ActivityChange({required this.field, this.oldDisplay, this.newDisplay});

  final String field;
  final dynamic oldDisplay;
  final dynamic newDisplay;

  factory ActivityChange.fromJson(Map<String, dynamic> json) {
    return ActivityChange(
      field: json['field'] ?? '',
      oldDisplay: json['old_display'],
      newDisplay: json['new_display'],
    );
  }
}
