part of 'add_member_cubit.dart';

@immutable
sealed class AddMemberState {}

final class AddMemberInitial extends AddMemberState {}

class AddMemberLoading extends AddMemberState {}

class AddMemberSuccess extends AddMemberState {}
class AddMemberError extends AddMemberState {
  final String error;

  AddMemberError(this.error);
}
