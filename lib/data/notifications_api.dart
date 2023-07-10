import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:husk/models/notification.dart';

/// {@template notifications_api}
/// The interface for an API that provides access to a list of notifications.
///
///
/// Code
/// {@endtemplate}
class NotificationsApi {
  /// {@macro notifications_api}

  NotificationsApi();

  static const String DATABASE = "notifications";

  // var dataSource;

  /// Provides a [Stream] of all notifications.
  Future<Stream<Notification>> getNotifications() async {
    await Hive.initFlutter();
    await Hive.openBox<Notification>(DATABASE);

    Stream<Notification> nofitications =
        Stream.fromIterable(Hive.box<Notification>(DATABASE).values);

    return nofitications;
  }

  /// Saves a [notification].
  ///
  /// If a [notification] with the same id already exists, it will be replaced.
  Future<void> savenotification(Notification notification) async {
    var source = Hive.openBox(DATABASE);
  }

  ///
  /// If no `notification` with the given id exists, a [notificationNotFoundException] error is
  /// thrown.
  Future<void> deletenotification(Notification notification) async {
    // dataSource.delete(notification);
  }

//   /// Deletes all completed notifications.
//   ///
//   /// Returns the number of deleted notifications.
//   Future<int> clearCompleted();

//   /// Sets the `isCompleted` state of all notifications to the given value.
//   ///
//   /// Returns the number of updated notifications.
//   Future<int> completeAll({required bool isCompleted});
}

/// Error thrown when a [notification] with a given id is not found.
class notificationNotFoundException implements Exception {}
