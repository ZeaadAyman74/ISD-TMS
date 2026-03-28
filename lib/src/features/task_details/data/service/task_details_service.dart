import 'package:dio/dio.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_activity/task_activity_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/upload_attachment_response.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/add_comment_response.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_comments/task_comment_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';

part 'task_details_service.g.dart';

@RestApi()
abstract class TaskDetailsService {
  factory TaskDetailsService(Dio dio, {String baseUrl}) = _TaskDetailsService;

  @PUT(EndPoints.cardDetail)
  Future<HttpResponse<dynamic>> updateTask(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
    @Body() Map<String, dynamic> data,
  );

  @GET(EndPoints.cardTypes)
  Future<HttpResponse<dynamic>> getCardTypes();

  @GET(EndPoints.cardPriorities)
  Future<HttpResponse<dynamic>> getCardPriorities();

  @GET(EndPoints.cardAttachments)
  Future<TaskAttachmentsResponse> getTaskAttachments(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
  );

  @MultiPart()
  @POST(EndPoints.cardAttachments)
  Future<UploadAttachmentResponse> uploadAttachment(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
    @Part(name: "file") MultipartFile file,
  );

  @DELETE(EndPoints.cardAttachmentDetail)
  Future<HttpResponse<dynamic>> deleteAttachment(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
    @Path("attachmentId") int attachmentId,
  );

  @GET(EndPoints.cardComments)
  Future<TaskCommentsResponse> getTaskComments(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
  );

  @POST(EndPoints.cardComments)
  Future<AddCommentResponse> addComment(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(EndPoints.cardCommentDetail)
  Future<HttpResponse<dynamic>> deleteComment(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
    @Path("commentId") int commentId,
  );

  @GET(EndPoints.cardActivities)
  Future<TaskActivitiesResponse> getTaskActivities(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
  );
}
