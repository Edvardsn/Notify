import 'package:husk/data/api/notifications_api.dart';
import 'package:husk/data/model/notification.dart';

class NotificationsRepository {
  /// The API for the data source to extract the necessary data
  final NotificationsApi _api;

  const NotificationsRepository({required NotificationsApi api}) : _api = api;

  /// Returns a [Stream] of [List]s reflecting of stored [Notification]s
  Stream<List<Notification>> getNotifications() => _api.getNotifications();

  Future<void> addNotification(Notification notification) async {
    await _api.addNotification(notification);
  }

  /// Removes a
  Future<void> removeNotificationCollection(
      Iterable<Notification> notifications) async {
    await _api.removeNotificationCollection(notifications);
  }
}
