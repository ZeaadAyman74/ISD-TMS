import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/task_detail_left_section.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/task_detail_right_section.dart';

class TaskDetailsForm extends StatelessWidget {
  const TaskDetailsForm({
    super.key,
    required this.maxWidth,
  });

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    if (maxWidth > 800) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 2, child: TaskDetailLeftSection()),
          32.horizontalSpace,
          const Expanded(flex: 1, child: TaskDetailRightSection()),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TaskDetailLeftSection(),
          20.verticalSpace,
          const TaskDetailRightSection(),
        ],
      );
    }
  }
}
