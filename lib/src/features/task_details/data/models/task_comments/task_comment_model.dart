import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class TaskCommentsResponse {
  final List<TaskCommentModel> comments;

  TaskCommentsResponse({required this.comments});

  factory TaskCommentsResponse.fromJson(Map<String, dynamic> json) {
    return TaskCommentsResponse(
      comments: json['data'] != null
          ? List.from(json['data'].map((e) => TaskCommentModel.fromJson(e)))
          : [],
    );
  }
}

class TaskCommentModel {
  const TaskCommentModel({
    required this.id,
    required this.cardId,
    required this.content,
    required this.createdAt,
    this.user,
  });

  final int id;
  final int cardId;
  final String content;
  final String createdAt;
  final CardAssignee? user;

  factory TaskCommentModel.fromJson(Map<String, dynamic> json) {
    return TaskCommentModel(
      id: json['id'] ?? 0,
      cardId: json['card_id'] ?? 0,
      content: json['content'] ?? '',
      createdAt: json['created_at'] ?? '',
      user: json['user'] != null ? CardAssignee.fromJson(json['user']) : null,
    );
  }
}
