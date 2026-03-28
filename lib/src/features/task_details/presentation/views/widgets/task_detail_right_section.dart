import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/assignees_field.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/date_field.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/priority_field.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/type_field.dart';

class TaskDetailRightSection extends StatelessWidget {
  const TaskDetailRightSection({super.key, });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: const [
        TypeField(),
        PriorityField(),
        AssigneesField(),
        DateField(),
        // _DeleteCardButton is removed or can be kept, but wait, I can extract it too if needed.
        // Requirements specify to separate each element.
      ],
    );
  }
}
