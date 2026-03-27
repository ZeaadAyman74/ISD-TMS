part of 'card_details_cubit.dart';

enum CardDetailsStatus { initial, loading, loaded, error, uploadingAttachment, addingComment }

class CardDetailsState {
  final CardDetailsStatus status;
  final List<CardAttachment> attachments;
  final List<CardComment> comments;
  final List<CardActivity> activities;
  final String? errorMessage;

  const CardDetailsState({
    this.status = CardDetailsStatus.initial,
    this.attachments = const [],
    this.comments = const [],
    this.activities = const [],
    this.errorMessage,
  });

  CardDetailsState copyWith({
    CardDetailsStatus? status,
    List<CardAttachment>? attachments,
    List<CardComment>? comments,
    List<CardActivity>? activities,
    String? errorMessage,
  }) {
    return CardDetailsState(
      status: status ?? this.status,
      attachments: attachments ?? this.attachments,
      comments: comments ?? this.comments,
      activities: activities ?? this.activities,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
