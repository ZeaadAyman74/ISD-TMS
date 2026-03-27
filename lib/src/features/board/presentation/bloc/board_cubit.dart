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
  List<LookupModel> cardTypes = [];
  List<LookupModel> cardPriorities = [];
  int? currentProjectId;
  String? currentProjectName;

  String searchQuery = '';
  List<int> selectedAssigneeIds = [];
  List<String> selectedPriorities = [];
  List<String> selectedTypeKeys = [];

  Future<void> getBoard(int projectId, {String? projectName}) async {
    currentProjectId = projectId;
    currentProjectName ??= projectName;
    emit(const BoardLoading());

    final results = await Future.wait([
      _repo.getProjectBoard(projectId),
      _repo.getCardTypes(),
      _repo.getCardPriorities(),
    ]);

    final boardResult = results[0] as NetworkResult<BoardResponse>;
    final typesResult = results[1] as NetworkResult<List<LookupModel>>?;
    final prioritiesResult = results[2] as NetworkResult<List<LookupModel>>?;

    boardResult.when(
      success: (board) {
        lists = board.lists..sort((a, b) => a.position.compareTo(b.position));
        cards = board.cards;
        labels = board.labels;
        members = board.members;

        if (typesResult != null) {
          typesResult.when(
            success: (types) => cardTypes = types,
            failure: (_) {},
          );
        }
        if (prioritiesResult != null) {
          prioritiesResult.when(
            success: (priorities) => cardPriorities = priorities,
            failure: (_) {},
          );
        }

        emit(BoardLoaded(lists: lists, cards: cards));
      },
      failure: (error) {
        emit(BoardError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  List<CardModel> getCardsForList(int listId) {
    var listCards = cards.where((c) => c.listId == listId).toList();

    // Search filtration
    if (searchQuery.isNotEmpty) {
      listCards = listCards
          .where((c) =>
              c.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              (c.description != null &&
                  c.description!
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase())))
          .toList();
    }

    // Assignees filtration
    if (selectedAssigneeIds.isNotEmpty) {
      listCards = listCards.where((c) {
        return c.assignees
            .any((a) => selectedAssigneeIds.contains(a.id));
      }).toList();
    }

    // Priority filtration
    if (selectedPriorities.isNotEmpty) {
      listCards = listCards
          .where((c) => selectedPriorities.contains(c.priority))
          .toList();
    }

    // Type filtration
    if (selectedTypeKeys.isNotEmpty) {
      listCards = listCards
          .where((c) => selectedTypeKeys.contains(c.type))
          .toList();
    }

    return listCards..sort((a, b) => a.position.compareTo(b.position));
  }

  void updateFilters({
    String? search,
    List<int>? assigneeIds,
    List<String>? priorities,
    List<String>? typeKeys,
  }) {
    if (search != null) searchQuery = search;
    if (assigneeIds != null) selectedAssigneeIds = assigneeIds;
    if (priorities != null) selectedPriorities = priorities;
    if (typeKeys != null) selectedTypeKeys = typeKeys;

    emit(BoardLoaded(lists: lists, cards: cards));
  }

  void clearFilters() {
    searchQuery = '';
    selectedAssigneeIds = [];
    selectedPriorities = [];
    selectedTypeKeys = [];
    emit(BoardLoaded(lists: lists, cards: cards));
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
