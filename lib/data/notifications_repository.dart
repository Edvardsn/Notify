import 'package:husk/data/api/hive_notifications_api.dart';
import 'package:husk/data/api/notifications_api.dart';
import 'package:husk/models/notification.dart';

class NotificationsRepository {
  /// The API for the data source to extract the necessary data
  final NotificationsApi _api;

  const NotificationsRepository({required NotificationsApi api}) : _api = api;

  Stream<List<Notification>> getNotifications() => _api.getNotifications();
}
