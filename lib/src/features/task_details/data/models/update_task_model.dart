class UpdateTaskModel {
  String? title;
  String? type;
  String? description;
  String? priority;
  String? date;
  List<int>? assignees;
  int? status;

  UpdateTaskModel({
    this.title,
    this.type,
    this.description,
    this.priority,
    this.date,
    this.assignees,
    this.status,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (title != null) {
      data.addAll({'title': title});
    }
    if (description != null) {
      data.addAll({"description": description});
    }
    if (assignees != null) {
      data.addAll({'assignees': assignees});
    }
    if (status != null) {
      data.addAll({'list_id': status});
    }
    if (type != null) {
      data.addAll({'type': type});
    }
    if (priority != null) {
      data.addAll({'priority': priority});
    }
    if (date != null) {
      data.addAll({'due_date': date});
    }
    return data;
  }
}
