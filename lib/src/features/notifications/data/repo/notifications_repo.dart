import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/notifications/data/models/notification_model.dart';
import 'package:isd_tms/src/features/notifications/data/service/notifications_service.dart';

class NotificationsRepo {
  const NotificationsRepo(this._service);
  final NotificationsService _service;

  Future<NetworkResult<NotificationsResponse>> getNotifications({int page = 1}) async {
    try {
      final response = await _service.getNotifications(page: page);
      return NetworkResult.success(response);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
