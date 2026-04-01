import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';
import 'package:isd_tms/src/features/notifications/data/models/notification_model.dart';

part 'notifications_service.g.dart';

@RestApi()
abstract class NotificationsService {
  factory NotificationsService(Dio dio, {String baseUrl}) = _NotificationsService;

  @GET(EndPoints.notifications)
  Future<NotificationsResponse> getNotifications({@Query('page') int page = 1});
}
