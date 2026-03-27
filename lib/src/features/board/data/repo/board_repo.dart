import 'package:dio/dio.dart';
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

  Future<NetworkResult<List<CardAttachment>>> getCardAttachments(int projectId, int cardId) async {
    try {
      final response = await _service.getCardAttachments(projectId, cardId);
      final List data = response.data['data'];
      return NetworkResult.success(data.map((e) => CardAttachment.fromJson(e)).toList());
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<CardAttachment>> uploadAttachment({
    required int projectId,
    required int cardId,
    required String filePath,
  }) async {
    try {
      final file = await MultipartFile.fromFile(filePath);
      final response = await _service.uploadAttachment(projectId, cardId, file);
      final data = response.data['data'];
      return NetworkResult.success(CardAttachment.fromJson(data));
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<bool>> deleteAttachment(int projectId, int cardId, int attachmentId) async {
    try {
      final response = await _service.deleteAttachment(projectId, cardId, attachmentId);
      final data = response.data['data'];
      return NetworkResult.success(data['success'] == true);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<List<CardComment>>> getCardComments(int projectId, int cardId) async {
    try {
      final response = await _service.getCardComments(projectId, cardId);
      final List data = response.data['data'];
      return NetworkResult.success(data.map((e) => CardComment.fromJson(e)).toList());
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<CardComment>> addComment(int projectId, int cardId, String content) async {
    try {
      final response = await _service.addComment(projectId, cardId, {'content': content});
      final data = response.data['data'];
      return NetworkResult.success(CardComment.fromJson(data));
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<bool>> deleteComment(int projectId, int cardId, int commentId) async {
    try {
      await _service.deleteComment(projectId, cardId, commentId);
      return const NetworkResult.success(true);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<List<CardActivity>>> getCardActivities(int projectId, int cardId) async {
    try {
      final response = await _service.getCardActivities(projectId, cardId);
      final List data = response.data['data'];
      return NetworkResult.success(data.map((e) => CardActivity.fromJson(e)).toList());
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
