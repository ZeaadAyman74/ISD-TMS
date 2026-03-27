import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';

part 'board_service.g.dart';

@RestApi()
abstract class BoardService {
  factory BoardService(Dio dio, {String baseUrl}) = _BoardService;

  @GET(EndPoints.projectBoard)
  Future<HttpResponse<dynamic>> getProjectBoard(@Path("projectId") int projectId);

  @POST(EndPoints.createCard)
  Future<HttpResponse<dynamic>> createCard(
    @Path("projectId") int projectId, 
    @Body() Map<String, dynamic> body,
  );

  @PUT(EndPoints.cardDetail)
  Future<HttpResponse<dynamic>> updateCard(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
    @Body() Map<String, dynamic> data,
  );

  @GET(EndPoints.cardTypes)
  Future<HttpResponse<dynamic>> getCardTypes();

  @GET(EndPoints.cardPriorities)
  Future<HttpResponse<dynamic>> getCardPriorities();

  @GET(EndPoints.cardAttachments)
  Future<HttpResponse<dynamic>> getCardAttachments(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
  );

  @MultiPart()
  @POST(EndPoints.cardAttachments)
  Future<HttpResponse<dynamic>> uploadAttachment(
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
  Future<HttpResponse<dynamic>> getCardComments(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
  );

  @POST(EndPoints.cardComments)
  Future<HttpResponse<dynamic>> addComment(
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
  Future<HttpResponse<dynamic>> getCardActivities(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
  );
}
