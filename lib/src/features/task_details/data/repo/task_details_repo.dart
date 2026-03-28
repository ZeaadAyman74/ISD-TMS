import 'package:dio/dio.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_activity/task_activity_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/upload_attachment_response.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/add_comment_response.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/task_comment_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_details_models.dart';
import 'package:isd_tms/src/features/task_details/data/service/task_details_service.dart';

class TaskDetailsRepo {
  const TaskDetailsRepo(this._service);
  final TaskDetailsService _service;

  Future<NetworkResult<CardModel>> updateCard({
    required int projectId,
    required int cardId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _service.updateTask(
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

  Future<NetworkResult<TaskAttachmentsResponse>> getCardAttachments(int projectId, int cardId) async {
    try {
      final response = await _service.getTaskAttachments(projectId, cardId);
      return NetworkResult.success(response);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<UploadAttachmentResponse>> uploadAttachment({
    required int projectId,
    required int cardId,
    required String filePath,
  }) async {
    try {
      final file = await MultipartFile.fromFile(filePath);
      final response = await _service.uploadAttachment(projectId, cardId, file);
      return NetworkResult.success(response);
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

  Future<NetworkResult<TaskCommentsResponse>> getCardComments(int projectId, int cardId) async {
    try {
      final response = await _service.getTaskComments(projectId, cardId);
      return NetworkResult.success(response);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<AddCommentResponse>> addComment(int projectId, int cardId, String content) async {
    try {
      final response = await _service.addComment(projectId, cardId, {'content': content});
      return NetworkResult.success(response);
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

  Future<NetworkResult<TaskActivitiesResponse>> getCardActivities(int projectId, int cardId) async {
    try {
      final response = await _service.getTaskActivities(projectId, cardId);
      return NetworkResult.success(response);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
