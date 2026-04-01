import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'members_state.dart';

class MembersCubit extends Cubit<MembersState> {
  MembersCubit() : super(MembersInitial());
}
