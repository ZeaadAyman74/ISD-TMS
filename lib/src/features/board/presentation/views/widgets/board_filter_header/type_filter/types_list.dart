import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/type_filter/type_checkbox_list_tile.dart';

class TypesList extends StatelessWidget {
  const TypesList({
    super.key,
    required this.types,
    required this.selectedTypeKeys,
    required this.onTypeChanged,
  });

  final List<LookupModel> types;
  final List<String> selectedTypeKeys;
  final Function(String key, bool isSelected) onTypeChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: types.length,
      itemBuilder: (context, index) {
        final type = types[index];
        final isSelected = selectedTypeKeys.contains(type.key);
        return TypeCheckboxListTile(
          type: type,
          isSelected: isSelected,
          onChanged: (val) => onTypeChanged(type.key, val ?? false),
          onTap: () => onTypeChanged(type.key, !isSelected),
        );
      },
    );
  }
}
