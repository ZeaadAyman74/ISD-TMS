import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/projects/data/models/projects_response.dart';
import 'package:isd_tms/src/features/projects_management/data/models/projects_query_model.dart';
import 'package:isd_tms/src/features/projects_management/data/service/projects_management_service.dart';

class ProjectsManagementRepo {
  final ProjectsManagementService _service;

  ProjectsManagementRepo(this._service);

  //-----------------------------------------------------

  Future<NetworkResult<ProjectsResponse>> getAllProjects({
    ProjectsQueryModel? query,
  }) async {
    try {
      final response = await _service.getAllProjects(queries: query?.toJson());
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
