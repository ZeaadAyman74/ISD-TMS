import 'package:isd_tms/src/core/network/response/general_response_model.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/add_member_request_model.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/search_members_response.dart';
import 'package:isd_tms/src/features/board/data/service/members/members_service.dart';

class MembersRepo {
  final MembersService _service;

  MembersRepo(this._service);

  //----------------------------------------------------------------------------

  Future<NetworkResult<ProjectRolesResponse>> getProjectRoles() async {
    try {
      final response = await _service.getProjectRoles();
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  //----------------------------------------------------------------------------
  Future<NetworkResult<GeneralResponseModel>> addMemberToProject({
    required int projectId,
    required AddMemberRequestModel requestData,
  }) async {
    try {
      final response = await _service.addMember(
        projectId: projectId,
        data: requestData,
      );
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  //----------------------------------------------------------------------------
  Future<NetworkResult<GeneralResponseModel>> deleteMemberFromProject({
    required int projectId,
    required int userId,
  }) async {
    try {
      final response = await _service.deleteMember(
        projectId: projectId,
        data: {'user_id': userId},
      );
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  //----------------------------------------------------------------------------
  Future<NetworkResult<GeneralResponseModel>> changeMemberRole({
    required int projectId,
    required AddMemberRequestModel requestData,
  }) async {
    try {
      final response = await _service.changeMemberRole(
        projectId: projectId,
        data: requestData,
      );
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  //----------------------------------------------------------------------------
  Future<NetworkResult<GeneralResponseModel>> transferOwnership({
    required int projectId,
    required int userId,
  }) async {
    try {
      final response = await _service.transferOwnership(
        projectId: projectId,
        data: {'user_id': userId},
      );
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  //----------------------------------------------------------------------------
  Future<NetworkResult<SearchMembersResponse>> searchInProjectMembers({
    required int projectId,
    required String? text,
  }) async {
    try {
      final response = await _service.searchProjectMembers(
        projectId: projectId,
        text: text,
      );
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
