import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:husk/data/model/notification.dart';
import 'package:husk/view/widgets/notification/dateslot.dart';
import '../../pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';
import 'notification_title.dart';
import 'recurring.dart';
import 'reminder.dart';
import 'timeslot.dart';

class NotificationTile extends StatefulWidget {
  NotificationTile({super.key, required this.notif, required this.selected});

  final Notification notif;
  bool selected;

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  late String timeOfDay = "16:00";
  late String dateOfNotification = "24/06/2023";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        title: NotificationTitle(title: widget.notif.title),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              TimeSlot(
                  timeOfDay: timeOfDay, dateOfNotification: dateOfNotification),
              DateSlot(
                  timeOfDay: timeOfDay, dateOfNotification: dateOfNotification),
              const Recurring()
            ],
          ),
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
