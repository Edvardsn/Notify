import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:husk/data/model/notification.dart';
import 'package:husk/view/widgets/notification/dateslot.dart';
import 'package:husk/view/widgets/notification/recurring.dart';
import 'package:husk/view/widgets/notification/reminder.dart';
import '../../pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';
import 'notification_title.dart';
import 'timeslot.dart';

class NotificationTile extends StatefulWidget {
  NotificationTile({super.key, required this.notif, required this.selected});

  final Notification notif;
  late Notification editedNotification;
  bool selected;

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  /// Registers changes to shared state.
  void registerNotificationChange(Notification notification) {
    context.read<NotificationDashboardBloc>().add(
          NotificationEditedEvent(notification, widget.notif),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.notif.timeOfNotification != null
          ? widget.notif.timeOfNotification!.isAfter(DateTime.now())
              ? Theme.of(context).cardColor
              : Colors.grey
          : Theme.of(context).cardColor,
      margin: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        title: NotificationTitle(notification: widget.notif),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Wrap(
          direction: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () async {
                var timeSelected = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                DateTime? newTime;

                if (timeSelected != null) {
                  if (widget.notif.timeOfNotification != null) {
                    newTime = widget.notif.timeOfNotification?.copyWith(
                        hour: timeSelected.hour, minute: timeSelected.minute);
                  } else {
                    newTime = DateTime.now().copyWith(
                        hour: timeSelected.hour, minute: timeSelected.minute);
                  }

                  if (newTime != null) {
                    var editedNotification =
                        widget.notif.copyWith(timeOfNotification: newTime);

                    registerNotificationChange(editedNotification);

                    setState(() {
                      widget.notif.timeOfNotification = newTime;
                    });
                  }
                }
              },
              child: TimeSlot(
                timeOfDay: widget.notif.timeOfNotification,
              ),
            ),
            GestureDetector(
              onTap: () async {
                var dateSelected = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.utc(2050));

                DateTime? newTime;

                if (dateSelected != null) {
                  if (widget.notif.timeOfNotification != null) {
                    newTime = widget.notif.timeOfNotification?.copyWith(
                        day: dateSelected.day,
                        month: dateSelected.month,
                        year: dateSelected.year);
                  } else {
                    newTime = DateTime.now().copyWith(
                        day: dateSelected.day,
                        month: dateSelected.month,
                        year: dateSelected.year);
                  }

                  if (newTime != null) {
                    var editedNotification =
                        widget.notif.copyWith(timeOfNotification: newTime);

                    registerNotificationChange(editedNotification);
                    setState(() {
                      widget.notif.timeOfNotification = newTime;
                    });
                  }
                }
              },
              child:
                  DateSlot(timeOfNotification: widget.notif.timeOfNotification),
            ),
            const Recurring(),
            const Reminder()
          ],
        ),
        trailing: IconButton(
          icon: widget.selected
              ? const Icon(Icons.radio_button_checked_rounded)
              : const Icon(Icons.radio_button_off_rounded),
          color: Colors.grey.shade600,
          iconSize: 24,
          onPressed: () {
            setState(() {
              widget.selected = !widget.selected;
            });

            context.read<NotificationDashboardBloc>().add(
                NotificationSelectedEvent(
                    notification: widget.notif, isSelected: widget.selected));
          },
        ),
      ),
    );
  }
}
