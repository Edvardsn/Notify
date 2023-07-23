import 'dart:async';
import 'package:hive_flutter/adapters.dart';
import 'package:husk/data/api/notifications_api.dart';
import 'package:husk/models/notification.dart';

/// An API to communicate with a Hive database for storage of notifications
class HiveNotificationsApi extends NotificationsApi {
  final StreamController _notificationsStreamController =
      StreamController<List<Notification>>();

  static const String DATABASEKEY = "notifications";

  /// Constructs the api
  HiveNotificationsApi() {
    initHive();
  }

  /// Initiates Hive and its respective database
  Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox<Notification>(DATABASEKEY);

    List<Notification> notificationList =
        Hive.box<Notification>(DATABASEKEY).values.toList();

    _notificationsStreamController.add(notificationList);
  }

  /// Provides a [Stream] of all notifications.
  @override
  Stream<List<Notification>> getNotifications() {
    return _notificationsStreamController.stream as Stream<List<Notification>>;
  }

  @override
  Future<void> addNotification() {
    // TODO: implement addNotification
    throw UnimplementedError();
  }

  @override
  Future<void> removeNotification() {
    // TODO: implement removeNotification
    throw UnimplementedError();
  }
}

/// Error thrown when a [Notification] with a given id is not found.
class NotificationNotFoundException implements Exception {}
