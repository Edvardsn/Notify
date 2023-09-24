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
    on<NotificationEditedEvent>(_onNotificationEdited);
  }

  /// When selected notifications are removed
  Future<void> _onNotificationsSubscription(
      NotificationsSubscriptionEvent event,
      Emitter<NotificationDashboardState> emit) async {
    emit(state.copyWith(NotificationDashboardStatus.loading, null, null));
    LoggerUtils.logger.i("Status: Loading");

    var notificationsStream = _repository.getNotifications();

    await emit.forEach(notificationsStream, onData: (data) {
      LoggerUtils.logger
          .d("(A) Emitted notifications: " + data.map((e) => e.key).join("-"));
      return state.copyWith(NotificationDashboardStatus.active, data, null);
    });
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

    LoggerUtils.logger.d("Selected notifications:" +
        state.selectedNotifications.map((e) => e.key).join("-"));
  }

  /// When selected notifications are removed
  FutureOr<void> _onNotificationsSelectedRemoved(
      NotificationRemovedSelectedEvent event,
      Emitter<NotificationDashboardState> emit) async {
    LoggerUtils.logger.d("Removing: " + state.selectedNotifications.join("-"));

    var selected = state.selectedNotifications;

    emit(state.copyWith(NotificationDashboardStatus.processing, null, []));

    await _repository.removeNotificationCollection(selected);
  }

  /// Requests
  Future<void> _onNotificationCreation(NotificationCreatedEvent event,
      Emitter<NotificationDashboardState> emit) async {
    await _repository.addNotification(Notification(title: " "));
  }

  /// Requests given change to [Notification] is saved in the repository.
  Future<void> _onNotificationEdited(NotificationEditedEvent event,
      Emitter<NotificationDashboardState> emit) async {
    _repository.editNotification(
        event.proposedChange, event.originalNotification);
  }
}
