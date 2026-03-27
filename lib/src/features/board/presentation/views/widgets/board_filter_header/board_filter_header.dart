import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/assignee_filter/assignee_filter.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/board_search_field.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/priority_filter/priority_filter.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/type_filter/type_filter.dart';

class BoardFilterHeader extends StatelessWidget {
  const BoardFilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: context.appColors.appBarBackground,
        border: Border(
          bottom: BorderSide(
            color: context.appColors.secondaryBackground,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          const BoardSearchField(),
          SizedBox(height: 12.h),
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const AssigneeFilter(),
                8.horizontalSpace,
                const PriorityFilter(),
                8.horizontalSpace,
                const TypeFilter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


