import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/notifications/data/models/notification_model.dart';
import 'package:isd_tms/src/features/notifications/presentation/views/widgets/notification_card.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key, required this.notifications});

  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationCard(notification: notifications[index]);
      },
    );
  }
}
