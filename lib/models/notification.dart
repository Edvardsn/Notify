import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

///
/// A Notifications and its details surrounding.
///
/// [Notification]´s are immutable and can be copied using [copyWith].
@HiveType(typeId: 1)
class Notification extends Equatable {
  const Notification(
      {required this.id,
      this.title = "",
      this.timeOfNotification,
      this.recurringTimeframe = Duration.zero,
      this.preNotificationAlertTime = Duration.zero});

  @HiveField(0)
  final int id;

  /// The title of the notificaiton
  @HiveField(1)
  final String title;

  /// The time and date of the notification
  @HiveField(2)
  final DateTime? timeOfNotification;

  /// A duration representing the interval the notification should be repeated.
  @HiveField(3)
  final Duration recurringTimeframe;

  /// A duration representing a given amount of time before the actual notification timeslot
  /// to be alerted.
  @HiveField(4)
  final Duration preNotificationAlertTime;

  @override
  List<Object?> get props =>
      [title, timeOfNotification, recurringTimeframe, preNotificationAlertTime];

  /// Returns a copy of this `notification` with the given values updated.
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
