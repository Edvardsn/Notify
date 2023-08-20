import 'package:husk/data/api/notifications_api.dart';
import 'package:husk/data/model/notification.dart';

class NotificationsRepository {
  /// The API for the data source to extract the necessary data
  final NotificationsApi _api;

  const NotificationsRepository({required NotificationsApi api}) : _api = api;

  /// Returns a [Stream] of [List]s reflecting of stored [Notification]s
  Stream<List<Notification>> getNotifications() => _api.getNotifications();

  /// Adds a notification to the data source.
  Future<void> addNotification(Notification notification) async {
    await _api.addNotification(notification);
  }

  /// Removes a collection of notifications to the data source.
  Future<void> removeNotificationCollection(
      Iterable<Notification> notifications) async {
    await _api.removeNotificationCollection(notifications);
  }

  /// Saves a change made to a notification to the data source.
  Future<void> editNotification(
      Notification proposedChange, Notification originalNotification) async {
    await _api.editNotification(proposedChange, originalNotification);
  }
}
