import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/custom_button.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/priority_filter/priorities_list.dart';

class PriorityFilterBottomSheet extends StatelessWidget {
  const PriorityFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    final prioritiesList = cubit.cardPriorities;
    final selectedPriorities = List<String>.from(cubit.selectedPriorities);

    return StatefulBuilder(
      builder: (context, setModalState) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filter by Priority',
                style: context.appTextTheme.font16TextPrimarySemiBold,
              ),
              const Divider(),
              PrioritiesList(
                priorities: prioritiesList,
                selectedPriorities: selectedPriorities,
                onPriorityChanged: (key, isSelected) {
                  setModalState(() {
                    if (isSelected) {
                      selectedPriorities.add(key);
                    } else {
                      selectedPriorities.remove(key);
                    }
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: CustomButton(
                  onTap: () {
                    cubit.updateFilters(priorities: selectedPriorities);
                    Navigator.pop(context);
                  },
                  title: "Apply",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
