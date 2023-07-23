import '../../models/notification.dart';

/// An interface containing basic essential methods to manage notifications.
abstract class NotificationsApi {
  /// Returns a [Stream] containing a list of all notifications registered in the data source.
  Stream<List<Notification>> getNotifications();

  /// Adds a [Notification] to the data source.
  Future<void> addNotification();

  /// Removes a [Notification] from the data source.
  Future<void> removeNotification();
}
