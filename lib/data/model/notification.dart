import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

///
/// A class representing a Notification and its properties.
///
/// [Notification]´s are immutable but can be copied using [copyWith].
@HiveType(typeId: 1)
class Notification extends Equatable {
  const Notification(
      {this.id,
      this.title,
      this.timeOfNotification,
      this.recurringTimeframe,
      this.preNotificationAlertTime});

  @HiveField(0)
  final int? id;

  /// The title of the notificaiton
  @HiveField(1)
  final String? title;

  /// The time and date of the notification
  @HiveField(2)
  final DateTime? timeOfNotification;

  /// A duration representing the interval the notification should be repeated.
  @HiveField(3)
  final Duration? recurringTimeframe;

  /// A duration representing a given amount of time before the actual notification timeslot
  /// to be alerted.
  @HiveField(4)
  final Duration? preNotificationAlertTime;

  @override
  List<Object?> get props =>
      [title, timeOfNotification, recurringTimeframe, preNotificationAlertTime];

  /// Returns a copy of the [Notification] with the given values updated.
  ///
  /// {@macro notification_item}
  Notification copyWith(
      {int? id,
      String? title,
      DateTime? timeOfNotification,
      Duration? recurringTimeframe,
      Duration? preNotificationAlertTime}) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      timeOfNotification: timeOfNotification ?? this.timeOfNotification,
      recurringTimeframe: recurringTimeframe ?? this.recurringTimeframe,
      preNotificationAlertTime:
          preNotificationAlertTime ?? this.preNotificationAlertTime,
    );
  }
}
