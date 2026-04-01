import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/filter_button.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/type_filter/type_filter_bottom_sheet.dart';

class TypeFilter extends StatelessWidget {
  const TypeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterButton(
      label: context.localization.type,
      icon: Icons.label_outline,
      onTap: () => _showTypeFilter(context),
    );
  }

  void _showTypeFilter(BuildContext context) {
    final cubit=context.read<BoardCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return BlocProvider.value(value: cubit,child: const TypeFilterBottomSheet());
      },
    );
  }
}
