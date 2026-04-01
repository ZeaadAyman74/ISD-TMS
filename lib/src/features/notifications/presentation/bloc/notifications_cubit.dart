import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/notifications/data/models/notification_model.dart';
import 'package:isd_tms/src/features/notifications/data/repo/notifications_repo.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._repo) : super(const NotificationsInitial());
  final NotificationsRepo _repo;

  List<NotificationModel> notifications = [];
  int _currentPage = 1;
  int _lastPage = 1;
  bool get hasMore => _currentPage < _lastPage;

  Future<void> getNotifications() async {
    emit(const NotificationsLoading());
    _currentPage = 1;
    final result = await _repo.getNotifications(page: _currentPage);

    result.when(
      success: (data) {
        notifications = data.notifications;
        _currentPage = data.meta?.currentPage ?? 1;
        _lastPage = data.meta?.lastPage ?? 1;
        emit(NotificationsLoaded(notifications));
      },
      failure: (error) {
        emit(NotificationsError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }

  Future<void> loadMore() async {
    if (!hasMore) return;
    if (state is NotificationsLoadingMore) return;

    emit(const NotificationsLoadingMore());
    final nextPage = _currentPage + 1;
    final result = await _repo.getNotifications(page: nextPage);

    result.when(
      success: (data) {
        notifications.addAll(data.notifications);
        _currentPage = data.meta?.currentPage ?? nextPage;
        _lastPage = data.meta?.lastPage ?? 1;
        emit(NotificationsLoaded(notifications));
      },
      failure: (error) {
        emit(NotificationsLoaded(notifications));
      },
    );
  }
}
