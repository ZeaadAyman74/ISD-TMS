import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/models/reorder_cards_request_model.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';
import 'package:isd_tms/src/features/projects/data/models/project_permissions_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_details_models.dart';
import 'package:isd_tms/src/features/board/data/repo/board_repo.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit(this._repo) : super(const BoardInitial());
  final BoardRepo _repo;

  // ----------------------------------------------------

  ProjectModel? currentProject;
  void setCurrentProject(ProjectModel project){
    currentProject=project;
  }
  //------------------------------------------------------
  List<BoardListModel> lists = [];
  List<CardModel> cards = [];
  List<LabelModel> labels = [];
  List<BoardMember> members = [];
  List<LookupModel> cardTypes = [];
  List<LookupModel> cardPriorities = [];
  ProjectPermissionsModel? permissions;


  String searchQuery = '';
  List<int> selectedAssigneeIds = [];
  List<String> selectedPriorities = [];
  List<String> selectedTypeKeys = [];

  Future<void> getBoard() async {
    emit(const BoardLoading());

    final results = await Future.wait([
      _repo.getProjectBoard(currentProject!.id),
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
        permissions=board.permissions;

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

  //----------------------------------------------------------------------------

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
  //----------------------------------------------------------------------------

  Future<void> addCard({
    required String title,
    required int listId,
  }) async {
    if (currentProject == null) return;

    final cardsInList = getCardsForList(listId);
    final position = cardsInList.length;

    emit(const AddCardLoading());
    final result = await _repo.createCard(
      projectId: currentProject!.id,
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
  //----------------------------------------------------------------------------

  Future<void> updateTask({
    required int cardId,
    required UpdateTaskModel data,
  }) async {
    if (currentProject == null) return;

    emit(const UpdateTaskLoading());
    final result = await _repo.updateCard(
      projectId: currentProject!.id,
      cardId: cardId,
      data: data.toJson(),
    );

    result.when(
      success: (updatedCard) {
        final index = cards.indexWhere((c) => c.id == cardId);
        if (index != -1) {
          final oldCard = cards[index];
          final finalCard = CardModel(
            id: updatedCard.id,
            projectId: updatedCard.projectId,
            listId: updatedCard.listId,
            title: updatedCard.title,
            description: updatedCard.description,
            type: updatedCard.type,
            priority: updatedCard.priority,
            dueDate: updatedCard.dueDate,
            position: updatedCard.position,
            commentsCount: oldCard.commentsCount,
            labels: updatedCard.labels.isNotEmpty ? updatedCard.labels : oldCard.labels,
            assignees: data.assignees != null
                ? members
                    .where((m) => data.assignees!.contains(m.userId))
                    .map((m) => CardAssignee(
                          id: m.userId,
                          fullName: m.name,
                          email: m.email,
                        ))
                    .toList()
                : (updatedCard.assignees.isNotEmpty ? updatedCard.assignees : oldCard.assignees),
            createdAt: updatedCard.createdAt ?? oldCard.createdAt,
          );
          cards[index] = finalCard;
          emit(UpdateTaskSuccess(finalCard));
        } else {
          emit(UpdateTaskSuccess(updatedCard));
        }
        emit(BoardLoaded(lists: lists, cards: cards));
      },
      failure: (error) {
        emit(UpdateTaskError(NetworkExceptions.getErrorMessage(error)));
        emit(BoardLoaded(lists: lists, cards: cards));
      },
    );
  }
  //----------------------------------------------------------------------------

  Future<void> deleteTask(int cardId) async {
    if (currentProject == null) return;

    emit(const DeleteTaskLoading());
    final result = await _repo.deleteCard(
      projectId: currentProject!.id,
      cardId: cardId,
    );

    result.when(
      success: (_) {
        cards.removeWhere((c) => c.id == cardId);
        emit(const DeleteTaskSuccess());
        emit(BoardLoaded(lists: lists, cards: cards));
      },
      failure: (error) {
        emit(DeleteTaskError(NetworkExceptions.getErrorMessage(error)));
        emit(BoardLoaded(lists: lists, cards: cards));
      },
    );
  }
  //----------------------------------------------------------------------------

  Future<void> moveCard({
    required int cardId,
    required int targetListId,
    required int targetPosition,
  }) async {
    final cardIndex = cards.indexWhere((c) => c.id == cardId);
    if (cardIndex == -1) return;

    final card = cards[cardIndex];
    final oldListId = card.listId;
    final oldPosition = card.position;

    if(targetPosition>oldPosition && oldListId==targetListId){
      targetPosition--;
    }

    if (oldListId == targetListId && oldPosition == targetPosition) return;

    // Optimistic update
    final updatedCards = cards.map((c) {
      if (c.id == cardId) {
        return c.copyWith(listId: targetListId, position: targetPosition);
      }

      if (oldListId == targetListId && c.listId == oldListId) {
        // Same list reorder
        if (oldPosition < targetPosition) {
          if (c.position > oldPosition && c.position <= targetPosition) {
            return c.copyWith(position: c.position - 1);
          }
        } else {
          if (c.position >= targetPosition && c.position < oldPosition) {
            return c.copyWith(position: c.position + 1);
          }
        }
      } else {
        // Cross list move
        if (c.listId == oldListId && c.position > oldPosition) {
          return c.copyWith(position: c.position - 1);
        }
        if (c.listId == targetListId && c.position >= targetPosition) {
          return c.copyWith(position: c.position + 1);
        }
      }
      return c;
    }).toList();

    cards = updatedCards;
    emit(BoardLoaded(lists: lists, cards: cards));

    // Call API using reorderCards
    if (oldListId == targetListId) {
      // Same column: call once
      final listCardIds = getCardsForList(targetListId).map((c) => c.id).toList();
      await reorderCards(targetListId, listCardIds);
    } else {
      // Different column: call twice
      final oldListCardIds = getCardsForList(oldListId).map((c) => c.id).toList();
      final newListCardIds = getCardsForList(targetListId).map((c) => c.id).toList();
      
      await reorderCards(targetListId, newListCardIds);
      await reorderCards(oldListId, oldListCardIds);
    }
  }

  //----------------------------------------------------------------------------

  Future<void> reorderCards(int targetListId, List<int> cardIds) async {
    emit(const ReorderCardLoading());
    final result = await _repo.reorderCards(
      projectId: currentProject!.id,
      listId: targetListId,
      data: ReorderCardsRequestModel(cardsIds: cardIds),
    );

    result.when(
      success: (_) {
        emit(const ReorderCardSuccess());
        // Since we did optimistic update in moveCard, we only emit BoardLoaded here
        emit(BoardLoaded(lists: lists, cards: cards));
      },
      failure: (error) {
        emit(ReorderCardError(NetworkExceptions.getErrorMessage(error)));
        getBoard(); // Rollback on failure
      },
    );
  }

//----------------------------------------------------------------------------

}

