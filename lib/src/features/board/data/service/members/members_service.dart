import 'package:dio/dio.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';
import 'package:isd_tms/src/core/network/response/general_response_model.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/add_member_request_model.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/search_members_response.dart';
import 'package:retrofit/retrofit.dart';

part 'members_service.g.dart';

@RestApi()
abstract class MembersService {
  factory MembersService(Dio dio, {String baseUrl}) = _MembersService;

  @GET(EndPoints.projectRoles)
  Future<ProjectRolesResponse> getProjectRoles();

  @POST(EndPoints.addProjectMember)
  Future<GeneralResponseModel> addMember({
    @Path('projectId') required int projectId,
    @Body() required AddMemberRequestModel data,
  });

  @PATCH(EndPoints.changeMemberRole)
  Future<GeneralResponseModel> changeMemberRole({
    @Path('projectId') required int projectId,
    @Body() required AddMemberRequestModel data,
  });

  @DELETE(EndPoints.deleteProjectMember)
  Future<GeneralResponseModel> deleteMember({
    @Path('projectId') required int projectId,
    @Body() required Map<String, dynamic> data,
  });

  @POST(EndPoints.transferOwnership)
  Future<GeneralResponseModel> transferOwnership({
    @Path('projectId') required int projectId,
    @Body() required Map<String, dynamic> data,
  });

  @GET(EndPoints.searchProjectMembers)
  Future<SearchMembersResponse> searchProjectMembers({
    @Path('projectId') required int projectId,
    @Query('search_text') required String? text,
  });
}
