import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/core/widgets/error_state_widget.dart';
import 'package:isd_tms/src/features/notifications/presentation/bloc/notifications_cubit.dart';
import 'package:isd_tms/src/features/notifications/presentation/views/widgets/notifications_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: context.appColors.appBarBackground,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.r),
          onPressed: () => context.pop(),
        ),
        title: Text(
          context.localization.notifications,
          style: context.appTextTheme.font20TextPrimaryBold,
        ),
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsLoading) {
            return const AppLoading();
          }

          if (state is NotificationsError) {
            return ErrorStateWidget(message: state.error);
          }

          final cubit = context.read<NotificationsCubit>();
          final notifications = cubit.notifications;

          if (notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none_rounded,
                      size: 64.r, color: AppColors.textHint),
                  SizedBox(height: 12.h),
                  Text(
                    context.localization.no_notifications,
                    style: context.appTextTheme.font14TextSecondaryRegular,
                  ),
                ],
              ),
            );
          }

          return NotificationsList(notifications: notifications);
        },
      ),
    );
  }
}
