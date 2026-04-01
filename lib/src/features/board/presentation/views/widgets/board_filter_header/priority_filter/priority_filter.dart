import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/filter_button.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/priority_filter/priority_filter_bottom_sheet.dart';

class PriorityFilter extends StatelessWidget {
  const PriorityFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterButton(
      label: context.localization.priority,
      icon: Icons.flag_outlined,
      onTap: () => _showPriorityFilter(context),
    );
  }

  void _showPriorityFilter(BuildContext context) {
    final cubit=context.read<BoardCubit>();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return BlocProvider.value(value:cubit ,child: const PriorityFilterBottomSheet());
      },
    );
  }
}
