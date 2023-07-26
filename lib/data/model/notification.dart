import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

///
/// A class representing a Notification and its properties.
///
/// [Notification]´s are immutable but can be copied using [copyWith].
@HiveType(typeId: 1, adapterName: "NotificationAdapter")
class Notification extends HiveObject with EquatableMixin {
  Notification(
      {this.title,
      this.timeOfNotification,
      this.recurringTimeframe,
      this.preNotificationAlertTime});

  /// The title of the notificaiton
  @HiveField(1, defaultValue: "")
  final String? title;

  /// The time and date of the notification
  @HiveField(2, defaultValue: null)
  final DateTime? timeOfNotification;

  /// A duration representing the interval the notification should be repeated.
  @HiveField(3, defaultValue: null)
  final Duration? recurringTimeframe;

  /// A duration representing a given amount of time to be alerted before the notification.
  @HiveField(4, defaultValue: null)
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
      title: title ?? this.title,
      timeOfNotification: timeOfNotification ?? this.timeOfNotification,
      recurringTimeframe: recurringTimeframe ?? this.recurringTimeframe,
      preNotificationAlertTime:
          preNotificationAlertTime ?? this.preNotificationAlertTime,
    );
  }
}

/// This class represents an adapter for the [Hive] database used to convert
/// [Notification]s to binary in order to be stored.
class NotificationAdapter extends TypeAdapter<Notification> {
  @override
  final int typeId = 1;

  @override
  Notification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notification(
      title: fields[1] == null ? '' : fields[1] as String?,
      timeOfNotification: fields[2] as DateTime?,
      recurringTimeframe: fields[3] as Duration?,
      preNotificationAlertTime: fields[4] as Duration?,
    );
  }

  @override
  void write(BinaryWriter writer, Notification obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.timeOfNotification)
      ..writeByte(3)
      ..write(obj.recurringTimeframe)
      ..writeByte(4)
      ..write(obj.preNotificationAlertTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
