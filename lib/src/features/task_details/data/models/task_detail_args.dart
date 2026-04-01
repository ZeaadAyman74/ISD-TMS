import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';

class TaskDetailArgs {
  final CardModel card;
  final ProjectModel project;
  final BoardCubit boardCubit;

  TaskDetailArgs({
    required this.card,
    required this.project,
    required this.boardCubit,
  });
}
