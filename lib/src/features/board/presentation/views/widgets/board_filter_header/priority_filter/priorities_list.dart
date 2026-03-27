import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/priority_filter/priority_checkbox_list_tile.dart';

class PrioritiesList extends StatelessWidget {
  const PrioritiesList({
    super.key,
    required this.priorities,
    required this.selectedPriorities,
    required this.onPriorityChanged,
  });

  final List<LookupModel> priorities;
  final List<String> selectedPriorities;
  final Function(String key, bool isSelected) onPriorityChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: priorities.map((p) {
        final isSelected = selectedPriorities.contains(p.key);
        return PriorityCheckboxListTile(
          priority: p,
          isSelected: isSelected,
          onChanged: (val) => onPriorityChanged(p.key, val ?? false),
          onTap: () => onPriorityChanged(p.key, !isSelected),
        );
      }).toList(),
    );
  }
}
