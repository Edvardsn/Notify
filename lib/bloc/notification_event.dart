part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {}

final class NotificationSelect extends NotificationEvent {}

final class NotificationUnSelect extends NotificationEvent {}
