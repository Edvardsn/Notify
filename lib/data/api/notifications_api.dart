import '../model/notification.dart';

/// An interface containing the necessary methods to manage [Notification]s.
abstract class NotificationsApi {
  /// Returns a [Stream] containing a [List] of all [Notification]s registered in the data source.
  Stream<List<Notification>> getNotifications();

  /// Adds a [Notification] to the data source.
  Future<void> addNotification(Notification notification);

  /// Removes all [Notification]s present in the given [Iterable].
  Future<void> removeNotificationCollection(
      Iterable<Notification> notification);

  /// Saves a change to a [Notification].
  Future<void> editNotification(Notification notification);
}
