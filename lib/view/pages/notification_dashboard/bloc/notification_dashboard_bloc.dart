// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:husk/domain/repository/notifications_repository.dart';
import 'package:husk/utils/logger_utils.dart';
import '../../../../data/model/notification.dart';
part 'notification_dashboard_event.dart';
part 'notification_dashboard_state.dart';

/// A bloc which manages the state of the notification dashboard.
class NotificationDashboardBloc
    extends Bloc<NotificationDashboardEvent, NotificationDashboardState> {
  final NotificationsRepository _repository;

  NotificationDashboardBloc({required NotificationsRepository repository})
      : _repository = repository,
        super(const NotificationDashboardState()) {
    on<NotificationSelectedEvent>(_onNotificationSelected);
    on<NotificationRemovedSelectedEvent>(_onNotificationsSelectedRemoved);
    on<NotificationsSubscriptionEvent>(_onNotificationsSubscription);
    on<NotificationCreatedEvent>(_onNotificationCreation);
  }

  /// When a notification is selected
  FutureOr<void> _onNotificationSelected(NotificationSelectedEvent event,
      Emitter<NotificationDashboardState> emit) async {
    /// Extract existing selected notifications
    List<Notification> selectedNotifs = List.from(state.selectedNotifications);

    if (event.isSelected) {
      selectedNotifs.add(event.notification);
    } else {
      selectedNotifs.remove(event.notification);
    }
    var newState = state.copyWith(null, null, selectedNotifs);

    emit(newState);

    LoggerUtils.logger.i("Selected notifications:" +
        state.selectedNotifications.map((e) => e.key).join("-"));
  }

  /// When selected notifications are removed
  FutureOr<void> _onNotificationsSelectedRemoved(
      NotificationRemovedSelectedEvent event,
      Emitter<NotificationDashboardState> emit) async {
    await _repository.removeNotificationCollection(state.selectedNotifications);
    emit(state.copyWith(null, null, const []));
  }

  /// When a notification is created
  Future<void> _onNotificationCreation(NotificationCreatedEvent event,
      Emitter<NotificationDashboardState> emit) async {
    var id = state.notifications.length + 1;
    await _repository.addNotification(Notification(title: id.toString()));
  }

  /// When selected notifications are removed
  Future<void> _onNotificationsSubscription(
      NotificationsSubscriptionEvent event,
      Emitter<NotificationDashboardState> emit) async {
    var notificationsStream = _repository.getNotifications();

    LoggerUtils.logger.i("Subscription recieved");

    await emit.forEach(notificationsStream, onData: (data) {
      LoggerUtils.logger
          .d("Emitted notifications: " + data.map((e) => e.key).join("-"));
      if (state.notifications.isNotEmpty) {
        // LoggerUtils.logger.i("Last key: " + data.last.key.toString());
      }
      return state.copyWith(null, data, null);
    });
  }
}
