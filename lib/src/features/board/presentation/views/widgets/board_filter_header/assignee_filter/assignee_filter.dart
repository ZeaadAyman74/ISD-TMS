import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/assignee_filter/assignee_filter_bottom_sheet.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/filter_button.dart';

class AssigneeFilter extends StatelessWidget {
  const AssigneeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterButton(
      label: context.localization.assignees,
      icon: Icons.group_outlined,
      onTap: () => _showAssigneesFilter(context),
    );
  }

  void _showAssigneesFilter(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: const AssigneeFilterBottomSheet(),
        );
      },
    );
  }
}
