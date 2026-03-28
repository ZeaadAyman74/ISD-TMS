import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_activity/task_activity_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/task_comment_model.dart';
import 'package:isd_tms/src/features/task_details/data/repo/task_details_repo.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit(this._repo) : super(const TaskDetailsState());
  final TaskDetailsRepo _repo;

  // ------------------------------------------------------------------------------

  CardModel? currentCard;

  void updateCurrentCard(CardModel newCard) {
    currentCard = newCard;
    printMe(newCard.assignees);
    emit(state.copyWith(status: TaskDetailsStatus.updateCard));
  }

  // ------------------------------------------------------------------------------
  List<TaskAttachmentModel> _attachments = [];
  List<TaskCommentModel> _comments = [];
  List<TaskActivityModel> _activities = [];

  Future<void> getCardDetails(int projectId, int cardId) async {
    emit(state.copyWith(status: TaskDetailsStatus.loading));

    final results = await Future.wait([
      _repo.getCardAttachments(projectId, cardId),
      _repo.getCardComments(projectId, cardId),
      _repo.getCardActivities(projectId, cardId),
    ]);

    final attachmentsResult = results[0];
    final commentsResult = results[1];
    final activitiesResult = results[2];

    String? errorMessage;

    if (attachmentsResult is Success<TaskAttachmentsResponse>) {
      _attachments = attachmentsResult.data.attachments;
    } else if (attachmentsResult is Failure<TaskAttachmentsResponse>) {
      errorMessage = NetworkExceptions.getErrorMessage(attachmentsResult.error);
    }

    if (commentsResult is Success<TaskCommentsResponse>) {
      _comments = commentsResult.data.comments;
    } else if (commentsResult is Failure<TaskCommentsResponse>) {
      errorMessage ??= NetworkExceptions.getErrorMessage(commentsResult.error);
    }

    if (activitiesResult is Success<TaskActivitiesResponse>) {
      _activities = activitiesResult.data.activities;
    } else if (activitiesResult is Failure<TaskActivitiesResponse>) {
      errorMessage ??= NetworkExceptions.getErrorMessage(
        activitiesResult.error,
      );
    }

    if (errorMessage != null &&
        _attachments.isEmpty &&
        _comments.isEmpty &&
        _activities.isEmpty) {
      emit(
        state.copyWith(
          status: TaskDetailsStatus.error,
          errorMessage: errorMessage,
        ),
      );
    } else {
      _emitLoaded();
    }
  }

  void _emitLoaded({TaskDetailsStatus status = TaskDetailsStatus.loaded}) {
    emit(
      state.copyWith(
        status: status,
        attachments: List.from(_attachments),
        comments: List.from(_comments),
        activities: List.from(_activities),
      ),
    );
  }

  // ------------------------------------------------------------------------------

  Future<void> uploadAttachment(String filePath) async {
    emit(state.copyWith(status: TaskDetailsStatus.uploadingAttachment));
    final result = await _repo.uploadAttachment(
      projectId: currentCard!.projectId,
      cardId: currentCard!.id,
      filePath: filePath,
    );

    result.when(
      success: (data) {
        _attachments.insert(0, data.attachment);
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: TaskDetailsStatus.error,
            errorMessage: NetworkExceptions.getErrorMessage(error),
          ),
        );
      },
    );
    _emitLoaded();
  }

  Future<void> deleteAttachment(int attachmentId) async {
    final result = await _repo.deleteAttachment(
      currentCard!.projectId,
      currentCard!.id,
      attachmentId,
    );
    result.when(
      success: (data) {
        if (data) {
          _attachments.removeWhere((a) => a.id == attachmentId);
          _emitLoaded();
        } else {
          emit(
            state.copyWith(status: TaskDetailsStatus.error, errorMessage: ""),
          );
        }
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: TaskDetailsStatus.error,
            errorMessage: NetworkExceptions.getErrorMessage(error),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------------------------------
  Future<void> addComment(int projectId, int cardId, String content) async {
    emit(state.copyWith(status: TaskDetailsStatus.addingComment));
    final result = await _repo.addComment(projectId, cardId, content);
    result.when(
      success: (data) {
        if (data.comment != null) {
          _comments.insert(0, data.comment!);
        }
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: TaskDetailsStatus.error,
            errorMessage: NetworkExceptions.getErrorMessage(error),
          ),
        );
      },
    );
    _emitLoaded();
  }

  Future<void> deleteComment(int projectId, int cardId, int commentId) async {
    final result = await _repo.deleteComment(projectId, cardId, commentId);
    result.when(
      success: (data) {
        _comments.removeWhere((c) => c.id == commentId);
        _emitLoaded();
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: TaskDetailsStatus.error,
            errorMessage: NetworkExceptions.getErrorMessage(error),
          ),
        );
      },
    );
  }
}
