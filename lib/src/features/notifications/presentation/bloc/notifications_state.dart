part of 'notifications_cubit.dart';

@immutable
sealed class NotificationsState {
  const NotificationsState();
}

final class NotificationsInitial extends NotificationsState {
  const NotificationsInitial();
}

final class NotificationsLoading extends NotificationsState {
  const NotificationsLoading();
}

final class NotificationsLoadingMore extends NotificationsState {
  const NotificationsLoadingMore();
}

final class NotificationsLoaded extends NotificationsState {
  const NotificationsLoaded(this.notifications);
  final List<NotificationModel> notifications;
}

final class NotificationsError extends NotificationsState {
  const NotificationsError(this.error);
  final String error;
}
