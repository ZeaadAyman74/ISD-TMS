import 'package:bloc/bloc.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/add_member_request_model.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';
import 'package:isd_tms/src/features/board/data/repo/members_repo.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';
import 'package:meta/meta.dart';

part 'members_state.dart';

class MembersCubit extends Cubit<MembersState> {
  MembersCubit(this._repo) : super(MembersInitial());
  final MembersRepo _repo;

  //----------------------------------------------------------

  ProjectModel? currentProject;
  void setCurrentProject(ProjectModel project) {
    currentProject = project;
  }

  List<BoardMember> members = [];
  void setCurrentMembers(List<BoardMember> members) {
    this.members = members;
  }

  List<ProjectRoleModel> roles = [];
  Future<void> getRoles() async {
    emit(GetRolesLoading());
    final result = await _repo.getProjectRoles();
    result.when(
      success: (data) {
        roles = data.roles;
        emit(GetRolesSuccess());
      },
      failure: (error) {
        emit(GetRolesError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  //----------------------------------------------------------

  Future<void> changeMemberRole({
    required int userId,
    required String roleValue,
  }) async {
    if (currentProject == null) return;
    emit(ChangeRoleLoading());
    final result = await _repo.changeMemberRole(
      projectId: currentProject!.id,
      requestData: AddMemberRequestModel(
        role: roleValue,
        userId: userId,
      ),
    );
    result.when(
      success: (_) {
        emit(ChangeRoleSuccess());
      },
      failure: (error) {
        emit(ChangeRoleError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  //----------------------------------------------------------

  Future<void> deleteMember({required int userId}) async {
    if (currentProject == null) return;
    emit(DeleteMemberLoading());
    final result = await _repo.deleteMemberFromProject(
      projectId: currentProject!.id,
      userId: userId,
    );
    result.when(
      success: (_) {
        emit(DeleteMemberSuccess(userId));
      },
      failure: (error) {
        emit(DeleteMemberError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  //----------------------------------------------------------

  Future<void> transferOwnership({required int userId}) async {
    if (currentProject == null) return;
    emit(TransferOwnershipLoading());
    final result = await _repo.transferOwnership(
      projectId: currentProject!.id,
      userId: userId,
    );
    result.when(
      success: (_) {
        emit(TransferOwnershipSuccess());
      },
      failure: (error) {
        emit(TransferOwnershipError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }
}
