part of 'members_cubit.dart';

@immutable
sealed class MembersState {}

final class MembersInitial extends MembersState {}

class GetRolesLoading extends MembersState {}
class GetRolesSuccess extends MembersState {}
class GetRolesError extends MembersState {
  final String error;

  GetRolesError(this.error);
}

// Change Role States
class ChangeRoleLoading extends MembersState {}
class ChangeRoleSuccess extends MembersState {}
class ChangeRoleError extends MembersState {
  final String error;

  ChangeRoleError(this.error);
}

// Delete Member States
class DeleteMemberLoading extends MembersState {}
class DeleteMemberSuccess extends MembersState {
  final int userId;

  DeleteMemberSuccess(this.userId);
}
class DeleteMemberError extends MembersState {
  final String error;

  DeleteMemberError(this.error);
}

// Transfer Ownership States
class TransferOwnershipLoading extends MembersState {}
class TransferOwnershipSuccess extends MembersState {}
class TransferOwnershipError extends MembersState {
  final String error;

  TransferOwnershipError(this.error);
}
