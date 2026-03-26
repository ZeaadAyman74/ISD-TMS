import 'package:dio/dio.dart';
import 'package:isd_tms/src/features/projects/data/models/projects_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';

part 'projects_service.g.dart';

@RestApi()
abstract class ProjectsService {
  factory ProjectsService(Dio dio, {String baseUrl}) = _ProjectsService;

  @GET(EndPoints.myProjects)
  Future<ProjectsResponse> getMyProjects({@Query('per_page') int perPage = 50});
}
