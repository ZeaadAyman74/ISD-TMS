import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_details_models.dart';

class TypeCheckboxListTile extends StatelessWidget {
  const TypeCheckboxListTile({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onChanged,
    required this.onTap,
  });

  final LookupModel type;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(type.label),
      leading: Icon(
        _getIcon(type.icon),
        color: _getColor(type.color),
      ),
      trailing: Checkbox(
        value: isSelected,
        onChanged: onChanged,
      ),
      onTap: onTap,
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'square-check':
        return Icons.check_box_outlined;
      case 'bug':
        return Icons.bug_report_outlined;
      case 'book':
        return Icons.book_outlined;
      case 'trending-up':
        return Icons.trending_up;
      default:
        return Icons.label_outline;
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
