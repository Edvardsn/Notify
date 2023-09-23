import 'dart:async';
import 'package:hive_flutter/adapters.dart';
import 'package:husk/data/api/notifications_api.dart';
import 'package:husk/data/model/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// An API to communicate with a Hive database for storage of notifications
class HiveNotificationsApi extends NotificationsApi {
  final StreamController _notificationsStreamController =
      StreamController<List<Notification>>();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const String databaseKey = "notifications";
  late final Box<Notification> _notificationBox;

  /// Constructs the api
  HiveNotificationsApi() {
    initHive();
  }

  /// Initiates Hive and the respective [Box] containing the relevant data.
  Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(NotificationAdapter());

    _notificationBox = await Hive.openBox<Notification>(databaseKey);

    _notificationsStreamController.add(_notificationBox.values.toList());
  }

  /// Provides a [Stream] to the list containing all stored [Notification]s.
  @override
  Stream<List<Notification>> getNotifications() {
    return _notificationsStreamController.stream.asBroadcastStream()
        as Stream<List<Notification>>;
  }

  /// Stores a [Notification] in the Hive database.
  @override
  Future<void> addNotification(Notification notification) async {
    await _notificationBox.add(notification);
    _notificationsStreamController.add(_notificationBox.values.toList());

    


  }

  /// Removes a collection of [Notification]s in the Hive database.
  @override
  Future<void> removeNotificationCollection(
      Iterable<Notification> notifications) async {
    List<int> notificationKeys = List.empty(growable: true);

    for (var element in notifications) {
      notificationKeys.add(element.key);
    }
    await _notificationBox.deleteAll(notificationKeys);

    var newValues = _notificationBox.values.toList();

    _notificationsStreamController.add(newValues);
  }

  /// Saves the edited [Notification] to the [Hive] database.
  @override
  Future<void> editNotification(
      Notification proposedChange, Notification originalNotification) async {
    originalNotification.title = proposedChange.title;
    originalNotification.timeOfNotification = proposedChange.timeOfNotification;
    originalNotification.preNotificationAlertTime =
        proposedChange.preNotificationAlertTime;
    originalNotification.recurringTimeframe = proposedChange.recurringTimeframe;

    originalNotification.save();

    _notificationsStreamController.add(_notificationBox.values.toList());
  }
}

/// Error thrown when a [Notification] with a given id is not found.
class NotificationNotFoundException implements Exception {}
