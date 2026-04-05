part of 'task_details_cubit.dart';

sealed class TaskDetailsState {
  const TaskDetailsState();
}

final class TaskDetailsInitial extends TaskDetailsState {
  const TaskDetailsInitial();
}

class UpdateCard extends TaskDetailsState {}

class ErrorState extends TaskDetailsState {
  final String error;

  const ErrorState(this.error);

}


class GetAttachmentsLoading extends TaskDetailsState {}
class GetAttachmentsSuccess extends TaskDetailsState {}
class GetAttachmentsError extends ErrorState {
  const GetAttachmentsError(super.error);
}

class UploadAttachmentLoading extends TaskDetailsState {}
class UploadAttachmentSuccess extends TaskDetailsState {}
class UploadAttachmentError extends ErrorState {
  const UploadAttachmentError(super.error);
}

class DeleteAttachmentLoading extends TaskDetailsState {}
class DeleteAttachmentSuccess extends TaskDetailsState {}
class DeleteAttachmentError extends ErrorState {
  const DeleteAttachmentError(super.error);
}

class StartDownload extends TaskDetailsState {}
class DownloadInProgress extends TaskDetailsState {
  final int attachmentId;
  final double progress;

  DownloadInProgress(this.attachmentId, this.progress);
}
class DownloadSuccess extends TaskDetailsState {
  final int attachmentId;
  final String path;

  DownloadSuccess(this.attachmentId, this.path);
}
class DownloadFailure extends TaskDetailsState {
  final String error;
  final int attachmentId;

  DownloadFailure(this.error, this.attachmentId);
}

class AddCommentLoading extends TaskDetailsState {}
class AddCommentSuccess extends TaskDetailsState {}
class AddCommentError extends ErrorState {
  const AddCommentError(super.error);
}

class DeleteCommentLoading extends TaskDetailsState {}
class DeleteCommentSuccess extends TaskDetailsState {}
class DeleteCommentError extends ErrorState {
  const DeleteCommentError(super.error);
}

class GetCommentsLoading extends TaskDetailsState {}
class GetCommentsSuccess extends TaskDetailsState {}
class GetCommentsError extends ErrorState {
  const GetCommentsError(super.error);
}

class GetHistoryLoading extends TaskDetailsState {}
class GetHistorySuccess extends TaskDetailsState {}
class GetHistoryError extends ErrorState {
  const GetHistoryError(super.error);
}