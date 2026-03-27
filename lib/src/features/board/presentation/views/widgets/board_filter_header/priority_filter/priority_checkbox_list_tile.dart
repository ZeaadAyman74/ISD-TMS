import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class PriorityCheckboxListTile extends StatelessWidget {
  const PriorityCheckboxListTile({
    super.key,
    required this.priority,
    required this.isSelected,
    required this.onChanged,
    required this.onTap,
  });

  final LookupModel priority;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        _getIcon(priority.icon),
        color: _getColor(priority.color),
      ),
      title: Text(priority.label),
      trailing: Checkbox(
        value: isSelected,
        onChanged: onChanged,
      ),
      onTap: onTap,
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'arrow-down':
        return Icons.arrow_downward;
      case 'minus':
        return Icons.remove;
      case 'arrow-up':
        return Icons.arrow_upward;
      default:
        return Icons.flag;
    }
  }

  Color _getColor(String hexColor) {
    try {
      final buffer = StringBuffer();
      if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
      buffer.write(hexColor.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return Colors.grey;
    }
  }
}
