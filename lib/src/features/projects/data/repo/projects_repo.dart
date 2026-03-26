import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/projects/data/models/projects_response.dart';
import 'package:isd_tms/src/features/projects/data/service/projects_service.dart';

class ProjectsRepo {
  const ProjectsRepo(this._service);
  final ProjectsService _service;

  Future<NetworkResult<ProjectsResponse>> getMyProjects() async {
    try {
      final response = await _service.getMyProjects();
      return NetworkResult.success(response);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
