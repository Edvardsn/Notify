import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:husk/domain/repository/notifications_repository.dart';
import '../../../data/model/notification.dart';
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
    var newNotifications = List<Notification>.from(state.notifications);

    newNotifications.add(const Notification());

    emit(state.copyWith(null, newNotifications, null));
  }

  /// When selected notifications are removed
  Future<void> _onNotificationsSubscription(
      NotificationsSubscriptionEvent event,
      Emitter<NotificationDashboardState> emit) async {
    var notificationsStream = _repository.getNotifications();

    await emit.forEach(notificationsStream,
        onData: (data) => state.copyWith(null, data, null));
  }
}
