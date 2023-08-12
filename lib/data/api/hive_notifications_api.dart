import 'dart:async';
import 'package:hive_flutter/adapters.dart';
import 'package:husk/data/api/notifications_api.dart';
import 'package:husk/data/model/notification.dart';

/// An API to communicate with a Hive database for storage of notifications
class HiveNotificationsApi extends NotificationsApi {
  final StreamController _notificationsStreamController =
      StreamController<List<Notification>>();

  static const String databaseKey = "notifications";
  late final Box<Notification> notificationBox;

  /// Constructs the api
  HiveNotificationsApi() {
    initHive();
  }

  /// Initiates Hive and the respective [Box] containing the relevant data.
  Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(NotificationAdapter());

    notificationBox = await Hive.openBox<Notification>(databaseKey);

    _notificationsStreamController.add(notificationBox.values.toList());
  }

  /// Provides a [Stream] to the list containing all stored notifications.
  @override
  Stream<List<Notification>> getNotifications() {
    return _notificationsStreamController.stream.asBroadcastStream()
        as Stream<List<Notification>>;
  }

  /// Stores a [Notification] in the Hive database.
  @override
  Future<void> addNotification(Notification notification) async {
    await notificationBox.add(notification);
    _notificationsStreamController.add(notificationBox.values.toList());
  }

  /// Removes a collection of [Notification]s in the Hive database.
  @override
  Future<void> removeNotificationCollection(
      Iterable<Notification> notifications) async {
    List<int> notificationKeys = List.empty(growable: true);

    for (var element in notifications) {
      notificationKeys.add(element.key);
    }
    await notificationBox.deleteAll(notificationKeys);

    var newValues = notificationBox.values.toList();

    _notificationsStreamController.add(newValues);
  }
}

/// Error thrown when a [Notification] with a given id is not found.
class NotificationNotFoundException implements Exception {}
