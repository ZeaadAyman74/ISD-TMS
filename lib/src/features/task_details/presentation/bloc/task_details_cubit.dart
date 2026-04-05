import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:isd_tms/src/core/helpers/permissions_helper.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_activity/task_activity_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/task_comment_model.dart';
import 'package:isd_tms/src/features/task_details/data/repo/task_details_repo.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit(this._repo) : super(const TaskDetailsInitial());
  final TaskDetailsRepo _repo;

  // ------------------------------------------------------------------------------

  CardModel? currentCard;

  void updateCurrentCard(CardModel newCard) {
    currentCard = newCard;
    emit(UpdateCard());
  }

  // ------------------------------------------------------------------------------
  List<TaskAttachmentModel> attachments = [];
  List<TaskCommentModel> comments = [];
  List<TaskActivityModel> activities = [];

  Future<void> getCardDetails() async {
    await Future.wait([
      getAttachments(),
      getComments(),
    ]);
  }

  Future<void> getComments() async {
    emit(GetCommentsLoading());
    final response = await _repo.getCardComments(currentCard!.projectId,
      currentCard!.id,);
    response.when(
      success: (data) {
        comments = data.comments;
        emit(GetCommentsSuccess());
      },
      failure: (error) {
        emit(GetCommentsError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  Future<void> getAttachments() async {
    emit(GetAttachmentsLoading());
    final response = await _repo.getCardAttachments(currentCard!.projectId,
      currentCard!.id,);
    response.when(
      success: (data) {
        attachments = data.attachments;
        emit(GetAttachmentsSuccess());
      },
      failure: (error) {
        emit(GetAttachmentsError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  Future<void> getHistory() async {
    emit(GetHistoryLoading());
    final response = await _repo.getCardActivities(currentCard!.projectId,
      currentCard!.id,);
    response.when(
      success: (data) {
        activities = data.activities;
        emit(GetHistorySuccess());
      },
      failure: (error) {
        emit(GetHistoryError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  // ------------------------------------------------------------------------------

  Future<void> uploadAttachment(String filePath) async {
    emit(UploadAttachmentLoading());
    final result = await _repo.uploadAttachment(
      projectId: currentCard!.projectId,
      cardId: currentCard!.id,
      filePath: filePath,
    );

    result.when(
      success: (data) {
        attachments.insert(0, data.attachment);
        emit(UploadAttachmentSuccess());
      },
      failure: (error) {
        emit(UploadAttachmentError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  Future<void> deleteAttachment(int attachmentId) async {
    emit(DeleteAttachmentLoading());
    final result = await _repo.deleteAttachment(
      currentCard!.projectId,
      currentCard!.id,
      attachmentId,
    );
    result.when(
      success: (data) {
        if (data) {
          attachments.removeWhere((a) => a.id == attachmentId);
          emit(DeleteAttachmentSuccess());
        } else {
          emit(const DeleteAttachmentError("Error"));
        }
      },
      failure: (error) {
        emit(DeleteAttachmentError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  void startDownloadFile({required id,required String fileName, required String url}) async {
    if (!(await PermissionsHelper.checkStoragePermission())) return;
    emit(StartDownload());
    final response = await _repo.downloadBook(
      fileName: fileName,
      onProgress: (received, total) {
        final progress = total > 0 ? (received / total) : 0.0;
        printMe(total);
        printMe(progress);
        emit(DownloadInProgress(id,progress));
      },
      url: url,
    );
    response.when(
      success: (filePath) {
        printMeLog("Download Success: $filePath");
        emit(DownloadSuccess(id,filePath));
      },
      failure: (error) {
        printMeLog("Download Error: $error");
        emit(DownloadFailure(NetworkExceptions.getErrorMessage(error),id));
      },
    );
  }

  // ------------------------------------------------------------------------------
  Future<void> addComment(String content) async {
    emit(AddCommentLoading());
    final result = await _repo.addComment(
      currentCard!.projectId,
      currentCard!.id,
      content,
    );
    result.when(
      success: (data) {
        if (data.comment != null) {
          comments.insert(0, data.comment!);
          emit(AddCommentSuccess());
        }
      },
      failure: (error) {
        emit(AddCommentError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  Future<void> deleteComment(int commentId) async {
    emit(DeleteCommentLoading());
    final result = await _repo.deleteComment(
      currentCard!.projectId,
      currentCard!.id,
      commentId,
    );
    result.when(
      success: (data) {
        comments.removeWhere((c) => c.id == commentId);
        emit(DeleteCommentSuccess());
      },
      failure: (error) {
        emit(DeleteCommentError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }
}
