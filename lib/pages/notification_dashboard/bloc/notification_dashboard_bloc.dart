import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:husk/data/notifications_api.dart';

import '../../../models/notification.dart';

part 'notification_dashboard_event.dart';
part 'notification_dashboard_state.dart';

/// A bloc which manages the state of the notification dashboard.
class NotificationDashboardBloc
    extends Bloc<NotificationDashboardEvent, NotificationDashboardState> {
  Future<Stream<Notification>> notifications;

  final NotificationsApi _api;

  NotificationDashboardBloc({required NotificationsApi api})
      : _api = api,
        notifications = api.getNotifications(),
        super(const NotificationDashboardState()) {
    on<NotificationSelectedEvent>(_onSelectedNotification);
    on<NotificationAddedEvent>(_onRemoveSelectedNotifications);
  }

  /// When a notification is selected
  FutureOr<void> _onSelectedNotification(NotificationSelectedEvent event,
      Emitter<NotificationDashboardState> emit) {
    /// Extract existing selected notifications
    List<Notification> selectedNotifs = List.from(state.selectedNotifications);

    if (event.isSelected) {
      selectedNotifs.add(event.notification);
    } else {
      selectedNotifs.remove(event.notification);
    }
    var newState = state.copyWith(null, null, selectedNotifs);

    emit(newState);
  }

  /// When selected notifications are removed
  FutureOr<void> _onRemoveSelectedNotifications(
      NotificationAddedEvent event, Emitter<NotificationDashboardState> emit) {
    emit(state.copyWith(
        null, null, List.from(state.selectedNotifications)..clear()));
  }
}
