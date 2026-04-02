import 'package:bloc/bloc.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/add_member_request_model.dart';
import 'package:isd_tms/src/features/board/data/models/memebers/project_role_model.dart';
import 'package:isd_tms/src/features/board/data/repo/members_repo.dart';
import 'package:meta/meta.dart';

part 'add_member_state.dart';

class AddMemberCubit extends Cubit<AddMemberState> {
  AddMemberCubit(this._repo) : super(AddMemberInitial());
  final MembersRepo _repo;

  //---------------------------------------------------------------------------

  List<BoardMember> allMembers = [];

  Future<List<BoardMember>> searchInMembers(int projectId, String? text) async {
    final result = await _repo.searchInProjectMembers(
      projectId: projectId,
      text: text,
    );
    result.when(
      success: (data) {
        allMembers = data.members;
      },
      failure: (error) {
        allMembers = [];
      },
    );
    return allMembers;
  }

  BoardMember? selectedMember;

  void selectMember(BoardMember member) {
    selectedMember = member;
  }

  ProjectRoleModel? selectedRole;

  void selectRole(ProjectRoleModel? role) {
    selectedRole = role;
  }

  //---------------------------------------------------------------------------

  Future<void> addMember(int projectId) async {
    emit(AddMemberLoading());
    final result = await _repo.addMemberToProject(
      projectId: projectId,
      requestData: AddMemberRequestModel(
        role: selectedRole!.value,
        userId: selectedMember!.userId,
      ),
    );
    result.when(
      success: (data) {
        emit(AddMemberSuccess());
      },
      failure: (error) {
        emit(AddMemberError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }
}
