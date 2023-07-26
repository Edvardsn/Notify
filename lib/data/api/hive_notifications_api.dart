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

    List<List<Notification>> notificationsList =
        List<List<Notification>>.generate(
            1, (index) => List.from(notificationBox.values));

    Stream<List<Notification>> boxStream =
        Stream.fromIterable(notificationsList);

    _notificationsStreamController.addStream(boxStream);
  }

  /// Provides a [Stream] to the list containing all stored notifications.
  @override
  Stream<List<Notification>> getNotifications() {
    return _notificationsStreamController.stream.asBroadcastStream()
        as Stream<List<Notification>>;
  }

  /// Stores a [Notification] in the Hive database.
  ///
  /// In orer to utilize auto-increment-keys provided by Hive the [Notification] has to be
  /// stored first in order to obtain the auto-increment-key, hence the first iteration of adding and deleting.
  @override
  Future<void> addNotification(Notification notification) async {
    await notificationBox.add(notification);
    // print(_notificationsStreamController.stream.length);
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
  }
}

/// Error thrown when a [Notification] with a given id is not found.
class NotificationNotFoundException implements Exception {}
