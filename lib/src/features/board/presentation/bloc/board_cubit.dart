import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/repo/board_repo.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit(this._repo) : super(const BoardInitial());
  final BoardRepo _repo;

  List<BoardListModel> lists = [];
  List<CardModel> cards = [];
  List<LabelModel> labels = [];
  List<BoardMember> members = [];
  int? currentProjectId;

  Future<void> getBoard(int projectId) async {
    currentProjectId = projectId;
    emit(const BoardLoading());
    final result = await _repo.getProjectBoard(projectId);

    result.when(
      success: (board) {
        lists = board.lists..sort((a, b) => a.position.compareTo(b.position));
        cards = board.cards;
        labels = board.labels;
        members = board.members;
        emit(BoardLoaded(lists: lists, cards: cards));
      },
      failure: (error) {
        emit(BoardError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  List<CardModel> getCardsForList(int listId) {
    return cards.where((c) => c.listId == listId).toList()
      ..sort((a, b) => a.position.compareTo(b.position));
  }

  Future<void> addCard({
    required String title,
    required int listId,
  }) async {
    if (currentProjectId == null) return;

    final cardsInList = getCardsForList(listId);
    final position = cardsInList.length;

    emit(const AddCardLoading());
    final result = await _repo.createCard(
      projectId: currentProjectId!,
      title: title,
      listId: listId,
      position: position,
    );

    result.when(
      success: (newCard) {
        cards.add(newCard);
        emit(AddCardSuccess(newCard));
        emit(BoardLoaded(lists: lists, cards: cards));
      },
      failure: (error) {
        emit(AddCardError(NetworkExceptions.getErrorMessage(error)));
        emit(BoardLoaded(lists: lists, cards: cards));
      },
    );
  }

  Future<void> updateCard({
    required int cardId,
    required Map<String, dynamic> data,
  }) async {
    if (currentProjectId == null) return;

    emit(const UpdateCardLoading());
    final result = await _repo.updateCard(
      projectId: currentProjectId!,
      cardId: cardId,
      data: data,
    );

    result.when(
      success: (updatedCard) {
        final index = cards.indexWhere((c) => c.id == cardId);
        if (index != -1) {
          cards[index] = updatedCard;
        }
        emit(UpdateCardSuccess(updatedCard));
        emit(BoardLoaded(lists: lists, cards: cards));
      },
      failure: (error) {
        emit(UpdateCardError(NetworkExceptions.getErrorMessage(error)));
        emit(BoardLoaded(lists: lists, cards: cards));
      },
    );
  }
}
