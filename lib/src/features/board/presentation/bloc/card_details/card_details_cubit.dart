import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/repo/board_repo.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';

part 'card_details_state.dart';

class CardDetailsCubit extends Cubit<CardDetailsState> {
  CardDetailsCubit(this._repo) : super(const CardDetailsState());
  final BoardRepo _repo;

  List<CardAttachment> _attachments = [];
  List<CardComment> _comments = [];
  List<CardActivity> _activities = [];

  Future<void> getCardDetails(int projectId, int cardId) async {
    emit(state.copyWith(status: CardDetailsStatus.loading));
    
    final results = await Future.wait([
      _repo.getCardAttachments(projectId, cardId),
      _repo.getCardComments(projectId, cardId),
      _repo.getCardActivities(projectId, cardId),
    ]);

    final attachmentsResult = results[0];
    final commentsResult = results[1];
    final activitiesResult = results[2];

    String? errorMessage;

    if (attachmentsResult is Success<List<CardAttachment>>) {
      _attachments = attachmentsResult.data;
    } else if (attachmentsResult is Failure<List<CardAttachment>>) {
      errorMessage = NetworkExceptions.getErrorMessage(attachmentsResult.error);
    }

    if (commentsResult is Success<List<CardComment>>) {
      _comments = commentsResult.data;
    } else if (commentsResult is Failure<List<CardComment>>) {
      errorMessage ??= NetworkExceptions.getErrorMessage(commentsResult.error);
    }

    if (activitiesResult is Success<List<CardActivity>>) {
      _activities = activitiesResult.data;
    } else if (activitiesResult is Failure<List<CardActivity>>) {
      errorMessage ??= NetworkExceptions.getErrorMessage(activitiesResult.error);
    }

    if (errorMessage != null && _attachments.isEmpty && _comments.isEmpty && _activities.isEmpty) {
      emit(state.copyWith(status: CardDetailsStatus.error, errorMessage: errorMessage));
    } else {
      _emitLoaded();
    }
  }

  void _emitLoaded({CardDetailsStatus status = CardDetailsStatus.loaded}) {
    emit(state.copyWith(
      status: status,
      attachments: List.from(_attachments),
      comments: List.from(_comments),
      activities: List.from(_activities),
    ));
  }

  Future<void> uploadAttachment(int projectId, int cardId, String filePath) async {
    emit(state.copyWith(status: CardDetailsStatus.uploadingAttachment));
    final result = await _repo.uploadAttachment(
      projectId: projectId,
      cardId: cardId,
      filePath: filePath,
    );

    if (result is Success<CardAttachment>) {
       _attachments.insert(0, result.data);
    }
    _emitLoaded();
  }

  Future<void> deleteAttachment(int projectId, int cardId, int attachmentId) async {
    final result = await _repo.deleteAttachment(projectId, cardId, attachmentId);
    if (result is Success<bool>) {
      if (result.data) {
        _attachments.removeWhere((a) => a.id == attachmentId);
        _emitLoaded();
      }
    }
  }

  Future<void> addComment(int projectId, int cardId, String content) async {
    emit(state.copyWith(status: CardDetailsStatus.addingComment));
    final result = await _repo.addComment(projectId, cardId, content);
    if (result is Success<CardComment>) {
      _comments.insert(0, result.data);
    }
    _emitLoaded();
  }

  Future<void> deleteComment(int projectId, int cardId, int commentId) async {
    final result = await _repo.deleteComment(projectId, cardId, commentId);
    if (result is Success) {
      _comments.removeWhere((c) => c.id == commentId);
      _emitLoaded();
    }
  }
}
