import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class AssigneeCheckboxListTile extends StatelessWidget {
  const AssigneeCheckboxListTile({
    super.key,
    required this.member,
    required this.onChanged,
    required this.onTap,
    required this.isSelected,
  });

  final BoardMember member;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Text(
          _getInitials(member.name),
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(member.name),
      trailing: Checkbox(
        value: isSelected,
        onChanged: onChanged
      ),
      onTap: onTap,
    );
  }

  String _getInitials(String fullName) {
    if (fullName.isEmpty) return '?';
    final parts = fullName.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return fullName[0].toUpperCase();
  }
}
