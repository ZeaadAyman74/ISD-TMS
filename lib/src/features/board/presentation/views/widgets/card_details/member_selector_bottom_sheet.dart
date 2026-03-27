import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class MemberSelectorBottomSheet extends StatefulWidget {
  const MemberSelectorBottomSheet({
    super.key,
    required this.allMembers,
    required this.selectedMemberIds,
    required this.onSelectionChanged,
  });

  final List<BoardMember> allMembers;
  final List<int> selectedMemberIds;
  final ValueChanged<List<int>> onSelectionChanged;

  @override
  State<MemberSelectorBottomSheet> createState() => _MemberSelectorBottomSheetState();
}

class _MemberSelectorBottomSheetState extends State<MemberSelectorBottomSheet> {
  late List<int> _tempSelectedIds;

  @override
  void initState() {
    super.initState();
    _tempSelectedIds = List.from(widget.selectedMemberIds);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.appColors.scaffoldBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assign Members',
                style: context.appTextTheme.font16TextPrimarySemiBold,
              ),
              TextButton(
                onPressed: () {
                  widget.onSelectionChanged(_tempSelectedIds);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 400.h),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.allMembers.length,
              itemBuilder: (context, index) {
                final member = widget.allMembers[index];
                final isSelected = _tempSelectedIds.contains(member.id);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Text(
                      member.initials,
                      style: TextStyle(color: AppColors.primary, fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(member.name, style: context.appTextTheme.font14TextPrimaryRegular),
                  trailing: Checkbox(
                    value: isSelected,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _tempSelectedIds.add(member.id);
                        } else {
                          _tempSelectedIds.remove(member.id);
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
