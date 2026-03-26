part of 'board_cubit.dart';

@immutable
sealed class BoardState {
  const BoardState();
}

final class BoardInitial extends BoardState {
  const BoardInitial();
}

final class BoardLoading extends BoardState {
  const BoardLoading();
}

final class BoardLoaded extends BoardState {
  const BoardLoaded({required this.lists, required this.cards});
  final List<BoardListModel> lists;
  final List<CardModel> cards;
}

final class BoardError extends BoardState {
  const BoardError(this.error);
  final String error;
}

// Add Card States
final class AddCardLoading extends BoardState {
  const AddCardLoading();
}

final class AddCardSuccess extends BoardState {
  const AddCardSuccess(this.card);
  final CardModel card;
}

final class AddCardError extends BoardState {
  const AddCardError(this.error);
  final String error;
}

// Update Card States
final class UpdateCardLoading extends BoardState {
  const UpdateCardLoading();
}

final class UpdateCardSuccess extends BoardState {
  const UpdateCardSuccess(this.card);
  final CardModel card;
}

final class UpdateCardError extends BoardState {
  const UpdateCardError(this.error);
  final String error;
}
