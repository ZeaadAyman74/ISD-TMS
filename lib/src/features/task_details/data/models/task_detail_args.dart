import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';

class TaskDetailArgs {
  final CardModel card;
  final BoardCubit boardCubit;

  TaskDetailArgs({required this.card, required this.boardCubit});
}
