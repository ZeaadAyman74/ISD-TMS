import 'package:dio/dio.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';
import 'package:isd_tms/src/features/projects/data/models/projects_response.dart';
import 'package:retrofit/retrofit.dart';

part 'projects_management_service.g.dart';

@RestApi()
abstract class ProjectsManagementService {
  factory ProjectsManagementService(Dio dio, {String baseUrl}) =
      _ProjectsManagementService;

  @GET(EndPoints.getAllProjects)
  Future<ProjectsResponse> getAllProjects({
    @Queries() Map<String, dynamic>? queries,
  });
}
