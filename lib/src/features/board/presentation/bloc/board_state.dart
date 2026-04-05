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
final class UpdateTaskLoading extends BoardState {
  const UpdateTaskLoading();
}
final class UpdateTaskSuccess extends BoardState {
  const UpdateTaskSuccess(this.card);
  final CardModel card;
}
final class UpdateTaskError extends BoardState {
  const UpdateTaskError(this.error);
  final String error;
}

// Delete Card States
final class DeleteTaskLoading extends BoardState {
  const DeleteTaskLoading();
}
final class DeleteTaskSuccess extends BoardState {
  const DeleteTaskSuccess();
}
final class DeleteTaskError extends BoardState {
  const DeleteTaskError(this.error);
  final String error;
}

final class ReorderCardLoading extends BoardState {
  const ReorderCardLoading();
}
final class ReorderCardSuccess extends BoardState {
  const ReorderCardSuccess();
}
final class ReorderCardError extends BoardState {
  const ReorderCardError(this.error);
  final String error;
}

