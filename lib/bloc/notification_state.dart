part of 'notification_bloc.dart';

///
/// A class to represent the state of a given notification at the time of a event
///
///
sealed class NotificationState extends Equatable {
  const NotificationState(this.selected);
  final bool selected;
}

final class NotificationInitial extends NotificationState {
  const NotificationInitial(super.selected);

  @override
  // Properties to evaluate wheter state has been changed
  List<Object?> get props => [selected];
}

final class NotificationSelected extends NotificationState {
  const NotificationSelected(super.selected);

  @override
  // Properties to evaluate wheter state has been changed
  List<Object?> get props => [selected];
}
