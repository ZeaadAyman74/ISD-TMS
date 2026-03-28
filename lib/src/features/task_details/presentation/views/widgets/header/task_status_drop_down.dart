import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/data/models/update_task_model.dart';

class StatusDropdown extends StatefulWidget {
  const StatusDropdown({super.key, required this.card});

  final CardModel card;

  @override
  State<StatusDropdown> createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  int? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.card.listId;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
      decoration: BoxDecoration(
        color: context.appColors.secondaryBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedValue,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
          style: context.appTextTheme.font13TextPrimaryMedium,
          items: cubit.lists.map((list) {
            return DropdownMenuItem<int>(
              value: list.id,
              child: Text(list.title),
            );
          }).toList(),
          onChanged: (val) {
            selectedValue = val;
            if (val != null && val != widget.card.listId) {
              cubit.updateTask(
                cardId: widget.card.id,
                data: UpdateTaskModel(status: val),
              );
            }
          },
        ),
      ),
    );
  }
}
