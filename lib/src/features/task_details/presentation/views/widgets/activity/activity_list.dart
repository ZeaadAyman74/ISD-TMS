import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_activity/task_activity_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/activity/activity_card.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key, this.activities = const []});

  final List<TaskActivityModel> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemBuilder: (context, index) {
        return ActivityCard(activity: activities[index]);
      },
    );
  }
}
