import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/service/board_service.dart';

class BoardRepo {
  const BoardRepo(this._service);
  final BoardService _service;

  Future<NetworkResult<BoardResponse>> getProjectBoard(int projectId) async {
    try {
      final response = await _service.getProjectBoard(projectId);
      return NetworkResult.success(BoardResponse.fromJson(response.data));
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<CardModel>> createCard({
    required int projectId,
    required String title,
    required int listId,
    required int position,
  }) async {
    try {
      final response = await _service.createCard(
        projectId,
        {
          'title': title,
          'list_id': listId,
          'position': position,
        },
      );
      final data = response.data['data'];
      return NetworkResult.success(CardModel.fromJson(data['data'] ?? data));
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<CardModel>> updateCard({
    required int projectId,
    required int cardId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _service.updateCard(
        projectId,
        cardId,
        data,
      );
      final responseData = response.data['data'];
      return NetworkResult.success(
          CardModel.fromJson(responseData['data'] ?? responseData));
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<List<LookupModel>>> getCardTypes() async {
    try {
      final response = await _service.getCardTypes();
      final List data = response.data['data'];
      return NetworkResult.success(data.map((e) => LookupModel.fromJson(e)).toList());
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<List<LookupModel>>> getCardPriorities() async {
    try {
      final response = await _service.getCardPriorities();
      final List data = response.data['data'];
      return NetworkResult.success(data.map((e) => LookupModel.fromJson(e)).toList());
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
