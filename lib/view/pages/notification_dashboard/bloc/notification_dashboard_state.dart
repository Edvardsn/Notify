part of 'notification_dashboard_bloc.dart';

/// The different status types of the dashboard
enum NotificationDashboardStatus { loading, inactive, active }

/// This class represents the state of the notification dashboard
final class NotificationDashboardState extends Equatable {
  const NotificationDashboardState(
      {this.status = NotificationDashboardStatus.inactive,
      this.notifications = const [],
      this.selectedNotifications = const []});

  final NotificationDashboardStatus status;
  final List<Notification> notifications;
  final List<Notification> selectedNotifications;

  /// The properties that determines if the widget should be rebuilt upon changes.
  ///
  /// Used for the comparison provided by the [Equatable].
  @override
  List<Object> get props => [status, notifications, selectedNotifications];

  /// A constructor for creating a copy of the state of the dashboard with the option of
  /// modifying existing fields.
  NotificationDashboardState copyWith(
    NotificationDashboardStatus? status,
    List<Notification>? notifications,
    List<Notification>? selectedNotifications,
  ) {
    return NotificationDashboardState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      selectedNotifications:
          selectedNotifications ?? this.selectedNotifications,
    );
  }
}
