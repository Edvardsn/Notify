import 'dart:async';
import 'package:hive_flutter/adapters.dart';
import 'package:husk/data/api/notifications_api.dart';
import 'package:husk/data/model/notification.dart';

/// An API to communicate with a Hive database for storage of notifications
class HiveNotificationsApi extends NotificationsApi {
  final StreamController _notificationsStreamController =
      StreamController<List<Notification>>();

  static const String databaseKey = "notifications";
  late Box<Notification> notificationStorage;

  /// Constructs the api
  HiveNotificationsApi() {
    initHive();
  }

  /// Initiates Hive and the respective [Box] containing the relevant data.
  Future<void> initHive() async {
    await Hive.initFlutter();
    notificationStorage = await Hive.openBox<Notification>(databaseKey);

    List<Notification> notificationList =
        Hive.box<Notification>(databaseKey).values.toList();

    List<Notification> emptylist = List.empty();

    if (notificationList.isEmpty) {
      _notificationsStreamController.add(emptylist);
    } else {
      _notificationsStreamController.add(notificationList);
    }
  }

  /// Provides a [Stream] to the list containing all stored notifications.
  @override
  Stream<List<Notification>> getNotifications() {
    return _notificationsStreamController.stream as Stream<List<Notification>>;
  }

  /// Stores a [Notification] in the Hive database.
  ///
  /// In orer to utilize auto-increment-keys provided by Hive the [Notification] has to be
  /// stored first in order to obtain the auto-increment-key, hence the first iteration of adding and deleting.
  @override
  Future<void> addNotification(Notification notification) async {
    int autoIncrementedKey = await notificationStorage.add(notification);
    await notificationStorage.delete(autoIncrementedKey);

    await notificationStorage.put(
        autoIncrementedKey, notification.copyWith(id: autoIncrementedKey));
    throw UnimplementedError();
  }

  /// Removes a [Notification] in the Hive database.
  @override
  Future<void> removeNotification(Notification notification) async {
    await notificationStorage.delete(notification.id);
    throw UnimplementedError();
  }
}

/// Error thrown when a [Notification] with a given id is not found.
class NotificationNotFoundException implements Exception {}
