import 'package:dio/dio.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';
import 'package:retrofit/retrofit.dart';

part 'members_service.g.dart';

@RestApi()
abstract class MembersService {
  factory MembersService(Dio dio, {String baseUrl}) = _MembersService;

  @GET(EndPoints.projectRoles)
  Future<ProjectRolesResponse> getProjectRoles();
}