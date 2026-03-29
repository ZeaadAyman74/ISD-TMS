import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/widgets/custom_field_label.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class TypeField extends StatefulWidget {
  const TypeField({super.key});

  @override
  State<TypeField> createState() => _TypeFieldState();
}

class _TypeFieldState extends State<TypeField> {
  BoardCubit get boardCubit => context.read<BoardCubit>();
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = cubit.currentCard!.type;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const CustomFieldLabel(label: 'Type'),
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
              items: boardCubit.cardTypes
                  .map(
                    (t) => DropdownMenuItem(value: t.key, child: Text(t.label)),
                  )
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedValue = val;
                });
                if (val != null) {
                  boardCubit.updateTask(
                    cardId: cubit.currentCard!.id,
                    data: UpdateTaskModel(type: val),
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
