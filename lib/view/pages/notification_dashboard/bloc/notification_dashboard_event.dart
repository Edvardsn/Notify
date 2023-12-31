part of 'notification_dashboard_bloc.dart';

sealed class NotificationDashboardEvent extends Equatable {
  const NotificationDashboardEvent();

  @override
  List<Object> get props => [];
}

/// An event which signals that a notification has been selected.
final class NotificationSelectedEvent extends NotificationDashboardEvent {
  const NotificationSelectedEvent(
      {required this.notification, required this.isSelected});

  final Notification notification;
  final bool isSelected;
}

/// An event which signals to remove all selected notifications.
final class NotificationRemovedSelectedEvent
    extends NotificationDashboardEvent {
  const NotificationRemovedSelectedEvent();
}

/// An event which signals the creation of a new notification.
final class NotificationCreatedEvent extends NotificationDashboardEvent {
  const NotificationCreatedEvent();
}

/// An event which signals that a notification has been edited
final class NotificationEditedEvent extends NotificationDashboardEvent {
  const NotificationEditedEvent(
    this.proposedChange,
    this.originalNotification,
  );

  final Notification proposedChange;
  final Notification originalNotification;
}

/// An event which signals that an object has subscribed on notifications data.
final class NotificationsSubscriptionEvent extends NotificationDashboardEvent {
  const NotificationsSubscriptionEvent();
}
