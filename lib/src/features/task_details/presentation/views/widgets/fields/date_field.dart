import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/widgets/custom_field_label.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class DateField extends StatefulWidget {
  const DateField({super.key});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  BoardCubit get boardCubit=>context.read<BoardCubit>();
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      buildWhen: (previous, current) => current is UpdateCard,
      builder: (context, state) {
        selectedDate = cubit.currentCard!.dueDate;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFieldLabel(label: context.localization.due_date),
            InkWell(
              onTap: () async {
                if(!(boardCubit.permissions?.cards?.setDates??false)) {
                  return ;
                }
                final date = await showDatePicker(
                  context: context,
                  initialDate:
                      DateTime.tryParse(selectedDate ?? '') ?? DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 3650)),
                );
                if (date != null && context.mounted) {
                  selectedDate = date.toIso8601String();
                  context.read<BoardCubit>().updateTask(
                    cardId: cubit.currentCard!.id,
                    data: UpdateTaskModel(date: selectedDate),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: context.appColors.secondaryBackground,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Text(
                      cubit.currentCard!.dueDate?.split('T').first ?? context.localization.not_set,
                      style: context.appTextTheme.font14TextPrimarySemiBold,
                    ),
                    const Spacer(),
                    const Icon(Icons.calendar_today, size: 16),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
