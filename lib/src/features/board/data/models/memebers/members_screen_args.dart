import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';

class MembersScreenArgs {
  final BoardCubit boardCubit;
  final ProjectModel project;


  MembersScreenArgs({required this.project,required this.boardCubit});
}
