import 'package:dio/dio.dart';
import 'package:isd_tms/src/core/network/response/general_response_model.dart';
import 'package:isd_tms/src/features/board/data/models/reorder_cards_request_model.dart';
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

  @PUT(EndPoints.updateCard)
  Future<HttpResponse<dynamic>> updateCard(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
    @Body() Map<String, dynamic> data,
  );

  @DELETE(EndPoints.updateCard)
  Future<HttpResponse<dynamic>> deleteCard(
    @Path("projectId") int projectId,
    @Path("cardId") int cardId,
  );
  
  @POST(EndPoints.reorderCards)
  Future<GeneralResponseModel>reorderCards({
    @Path('projectId') required int projectId,
    @Path('listId') required int listId,
    @Body() required ReorderCardsRequestModel data
});

  @GET(EndPoints.cardTypes)
  Future<HttpResponse<dynamic>> getCardTypes();

  @GET(EndPoints.cardPriorities)
  Future<HttpResponse<dynamic>> getCardPriorities();
}
