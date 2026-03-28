part of 'task_details_cubit.dart';

enum TaskDetailsStatus { initial, loading, loaded, error, uploadingAttachment, addingComment ,updateCard}

class TaskDetailsState {
  final TaskDetailsStatus status;
  final List<TaskAttachmentModel> attachments;
  final List<TaskCommentModel> comments;
  final List<TaskActivityModel> activities;
  final String? errorMessage;

  const TaskDetailsState({
    this.status = TaskDetailsStatus.initial,
    this.attachments = const [],
    this.comments = const [],
    this.activities = const [],
    this.errorMessage,
  });

  TaskDetailsState copyWith({
    TaskDetailsStatus? status,
    List<TaskAttachmentModel>? attachments,
    List<TaskCommentModel>? comments,
    List<TaskActivityModel>? activities,
    String? errorMessage,
  }) {
    return TaskDetailsState(
      status: status ?? this.status,
      attachments: attachments ?? this.attachments,
      comments: comments ?? this.comments,
      activities: activities ?? this.activities,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
