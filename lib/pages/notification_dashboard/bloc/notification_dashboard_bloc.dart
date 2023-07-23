import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:husk/data/notifications_repository.dart';
import '../../../models/notification.dart';
part 'notification_dashboard_event.dart';
part 'notification_dashboard_state.dart';

/// A bloc which manages the state of the notification dashboard.
class NotificationDashboardBloc
    extends Bloc<NotificationDashboardEvent, NotificationDashboardState> {
  Stream<List<Notification>> _notificationsList;

  final NotificationsRepository _repository;

  NotificationDashboardBloc({required NotificationsRepository repository})
      : _repository = repository,
        _notificationsList = repository.getNotifications(),
        super(const NotificationDashboardState()) {
    on<NotificationSelectedEvent>(_onNotificationSelected);
    on<NotificationRemovedSelectedEvent>(_onNotificationsSelectedRemoved);
    on<NotificationsSubscriptionEvent>(_onNotificationsSubscription);
    on<NotificationCreatedEvent>(_onNotificationCreation);
  }

  /// When a notification is selected
  FutureOr<void> _onNotificationSelected(NotificationSelectedEvent event,
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
  FutureOr<void> _onNotificationsSelectedRemoved(
      NotificationRemovedSelectedEvent event,
      Emitter<NotificationDashboardState> emit) {
    List allNotifs = List.from(state.notifications);

    allNotifs.removeWhere(
        (element) => (state.selectedNotifications.contains(element)));

    emit(state.copyWith(null, allNotifs.cast<Notification>(), const []));
  }

  /// When a notification is created
  Future<void> _onNotificationCreation(NotificationCreatedEvent event,
      Emitter<NotificationDashboardState> emit) async {
    var newNotifications = state.notifications;

    newNotifications.add(Notification(id: newNotifications.length, title: ""));
  }

  /// When selected notifications are removed
  Future<void> _onNotificationsSubscription(
      NotificationsSubscriptionEvent event,
      Emitter<NotificationDashboardState> emit) async {
    var allNotifications = await _repository.getNotifications();

    emit(state.copyWith(NotificationDashboardStatus.loaded,
        allNotifications as List<Notification>?, null));
  }
}
