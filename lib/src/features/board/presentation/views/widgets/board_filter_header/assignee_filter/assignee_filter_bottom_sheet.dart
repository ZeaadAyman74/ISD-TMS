import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/custom_button.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/assignee_filter/assignees_list.dart';

class AssigneeFilterBottomSheet extends StatelessWidget {
  const AssigneeFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    final members = cubit.members;
    final selectedAssigneeIds = List<int>.from(cubit.selectedAssigneeIds);
    return StatefulBuilder(
      builder: (context, setModalState) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          height: 0.6.sh,
          child: Column(
            children: [
              Text(
                'Filter by Assignee',
                style: context.appTextTheme.font16TextPrimarySemiBold,
              ),
              const Divider(),
              Expanded(
                child: AssigneesList(
                  members: members,
                  selectedMembers: selectedAssigneeIds,
                  onTypeChanged: (id, isSelected) {
                    setModalState(() {
                      if (isSelected) {
                        selectedAssigneeIds.add(id);
                      } else {
                        selectedAssigneeIds.remove(id);
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: CustomButton(onTap: () {
                  cubit.updateFilters(assigneeIds: selectedAssigneeIds);
                  Navigator.pop(context);
                }, title: "Apply")
              ),
            ],
          ),
        );
      },
    );
  }
}
