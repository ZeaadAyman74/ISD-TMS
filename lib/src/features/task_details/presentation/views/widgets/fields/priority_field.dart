import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/widgets/custom_field_label.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class PriorityField extends StatefulWidget {
  const PriorityField({super.key});

  @override
  State<PriorityField> createState() => _PriorityFieldState();
}

class _PriorityFieldState extends State<PriorityField> {
  BoardCubit get boardCubit => context.read<BoardCubit>();

  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = cubit.currentCard!.priority;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomFieldLabel(label: 'Priority'),
        SizedBox(height: 4.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: context.appColors.secondaryBackground,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: context.appColors.secondaryBackground),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              items: boardCubit.cardPriorities
                  .map(
                    (p) => DropdownMenuItem(value: p.key, child: Text(p.label)),
                  )
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedValue = val;
                });
                if (val != null) {
                  boardCubit.updateTask(
                    cardId: cubit.currentCard!.id,
                    data: UpdateTaskModel(priority: val),
                  );
                }
              },
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              style: context.appTextTheme.font14TextPrimarySemiBold,
            ),
          ),
        ),
      ],
    );
  }
}
