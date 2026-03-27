import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';

class AssigneeCheckboxListTile extends StatefulWidget {
  const AssigneeCheckboxListTile({super.key, required this.member});

  final BoardMember member;

  @override
  State<AssigneeCheckboxListTile> createState() =>
      _AssigneeCheckboxListTileState();
}

class _AssigneeCheckboxListTileState extends State<AssigneeCheckboxListTile> {
  BoardCubit get cubit => context.read<BoardCubit>();
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = cubit.selectedAssigneeIds.contains(widget.member.userId);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Text(
          _getInitials(widget.member.name),
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(widget.member.name),
      trailing: Checkbox(
        value: isSelected,
        onChanged: (val) {
          setState(() {
            if (val == true) {
              cubit.selectedAssigneeIds.add(widget.member.userId);
            } else {
              cubit.selectedAssigneeIds.remove(widget.member.userId);
            }
          });
        },
      ),
      onTap: () {
        setState(() {
          if (isSelected) {
            cubit.selectedAssigneeIds.remove(widget.member.userId);
          } else {
            cubit.selectedAssigneeIds.add(widget.member.userId);
          }
        });
      },
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
