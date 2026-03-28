import 'package:isd_tms/src/features/task_details/data/models/task_comments/task_comment_model.dart';

class AddCommentResponse {
  final TaskCommentModel? comment;

  AddCommentResponse({required this.comment});

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) {
    return AddCommentResponse(
      comment: json['data'] != null
          ? TaskCommentModel.fromJson(json['data'])
          : null,
    );
  }
}
