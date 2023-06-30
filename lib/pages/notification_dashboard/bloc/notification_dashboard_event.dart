part of 'notification_dashboard_bloc.dart';

sealed class NotificationDashboardEvent extends Equatable {
  const NotificationDashboardEvent();

  @override
  List<Object> get props => [];
}

/// An event which signals that a notification has been selected
final class NotificationSelectedEvent extends NotificationDashboardEvent {
  const NotificationSelectedEvent({required this.notification});

  final Notification notification;
}
