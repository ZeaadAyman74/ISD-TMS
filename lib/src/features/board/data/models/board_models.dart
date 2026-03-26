class BoardResponse {
  const BoardResponse({
    required this.lists,
    required this.cards,
    required this.labels,
    required this.members,
  });

  final List<BoardListModel> lists;
  final List<CardModel> cards;
  final List<LabelModel> labels;
  final List<BoardMember> members;

  factory BoardResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    return BoardResponse(
      lists: (data['lists'] as List?)
              ?.map((e) => BoardListModel.fromJson(e))
              .toList() ??
          [],
      cards: (data['cards'] as List?)
              ?.map((e) => CardModel.fromJson(e))
              .toList() ??
          [],
      labels: (data['labels'] as List?)
              ?.map((e) => LabelModel.fromJson(e))
              .toList() ??
          [],
      members: (data['members'] as List?)
              ?.map((e) => BoardMember.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class BoardListModel {
  const BoardListModel({
    required this.id,
    required this.title,
    required this.position,
    this.statusType,
  });

  final int id;
  final String title;
  final int position;
  final String? statusType;

  factory BoardListModel.fromJson(Map<String, dynamic> json) {
    return BoardListModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      position: json['position'] ?? 0,
      statusType: json['status_type'],
    );
  }
}

class CardModel {
  const CardModel({
    required this.id,
    required this.projectId,
    required this.listId,
    required this.title,
    this.description,
    this.type,
    this.priority,
    this.dueDate,
    this.position = 0,
    this.commentsCount = 0,
    this.assignees = const [],
    this.labels = const [],
    this.createdAt,
  });

  final int id;
  final int projectId;
  final int listId;
  final String title;
  final String? description;
  final String? type;
  final String? priority;
  final String? dueDate;
  final int position;
  final int commentsCount;
  final List<CardAssignee> assignees;
  final List<LabelModel> labels;
  final String? createdAt;

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      listId: json['list_id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'],
      type: json['type'],
      priority: json['priority'],
      dueDate: json['due_date'],
      position: json['position'] ?? 0,
      commentsCount: json['comments_count'] ?? 0,
      assignees: (json['assignees'] as List?)
              ?.map((e) => CardAssignee.fromJson(e))
              .toList() ??
          [],
      labels: (json['labels'] as List?)
              ?.map((e) => LabelModel.fromJson(e))
              .toList() ??
          [],
      createdAt: json['created_at'],
    );
  }
}

class CardAssignee {
  const CardAssignee({
    required this.id,
    required this.fullName,
    this.firstName,
    this.lastName,
    this.email,
    this.photoUrl,
  });

  final int id;
  final String fullName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? photoUrl;

  factory CardAssignee.fromJson(Map<String, dynamic> json) {
    return CardAssignee(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      photoUrl: json['photo_url'],
    );
  }

  String get initials {
    if (firstName != null && lastName != null) {
      return '${firstName![0]}${lastName![0]}'.toUpperCase();
    }
    if (fullName.isNotEmpty) {
      final parts = fullName.split(' ');
      if (parts.length >= 2) {
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      }
      return fullName[0].toUpperCase();
    }
    return '?';
  }
}

class LabelModel {
  const LabelModel({
    required this.id,
    required this.name,
    required this.color,
  });

  final int id;
  final String name;
  final String color;

  factory LabelModel.fromJson(Map<String, dynamic> json) {
    return LabelModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      color: json['color'] ?? '#888888',
    );
  }
}

class BoardMember {
  const BoardMember({
    required this.id,
    required this.userId,
    required this.name,
    this.email,
    this.role,
  });

  final int id;
  final int userId;
  final String name;
  final String? email;
  final String? role;

  factory BoardMember.fromJson(Map<String, dynamic> json) {
    return BoardMember(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'],
      role: json['role'],
    );
  }
}
