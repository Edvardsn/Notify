part of 'notification_dashboard_bloc.dart';

sealed class NotificationDashboardEvent extends Equatable {
  const NotificationDashboardEvent();

  @override
  List<Object> get props => [];
}

/// An event which signals that a notification has been selected
final class NotificationSelectedEvent extends NotificationDashboardEvent {
  const NotificationSelectedEvent(
      {required this.notification, required this.isSelected});

  final Notification notification;
  final bool isSelected;
}

/// An event which signals to remove all selected notifications
final class NotificationRemovedSelectedEvent
    extends NotificationDashboardEvent {
  const NotificationRemovedSelectedEvent();
}

/// An event which signals the creation of a new notification
final class NotificationAddedEvent extends NotificationDashboardEvent {
  const NotificationAddedEvent();
}
