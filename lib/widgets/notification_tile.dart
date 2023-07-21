import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:husk/models/notification.dart';
import 'package:husk/pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';
import 'package:intl/intl.dart';

class NotificationTile extends StatefulWidget {
  NotificationTile({super.key, required this.notif});

  Notification notif;

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool selected = false;

  late String timeOfDay =
      DateFormat("Hm").format(widget.notif.timeOfNotification as DateTime);

  late String timeOfMonth;
  late String dayOfMonth;

  late String dateOfNotification = DateFormat("$dayOfMonth/$timeOfMonth/y")
      .format(widget.notif.title as DateTime);

  /// Formats the given date to european format
  void _formatDate() {
    if (widget.notif.timeOfNotification != null) {
      if (DateFormat("M")
              .format(widget.notif.timeOfNotification as DateTime)
              .length ==
          1) {
        timeOfMonth =
            "0${DateFormat("M").format(widget.notif.timeOfNotification as DateTime)}";
      }

      if (DateFormat("d")
              .format(widget.notif.timeOfNotification as DateTime)
              .length ==
          1) {
        dayOfMonth =
            "0${DateFormat("d").format(widget.notif.timeOfNotification as DateTime)}";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _formatDate();

    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
        title: NotificationTitle(widget: widget),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TimeSlot(
                  timeOfDay: timeOfDay, dateOfNotification: dateOfNotification),
              Reminder(selected: selected),
              const Recurring(),
            ],
          ),
        ),
        trailing: IconButton(
          icon: selected
              ? const Icon(Icons.radio_button_checked_rounded)
              : const Icon(Icons.radio_button_off_rounded),
          color: Colors.grey.shade600,
          iconSize: 24,
          onPressed: () {
            setState(() {
              selected = !selected;
            });
            context.read<NotificationDashboardBloc>().add(
                NotificationSelectedEvent(
                    notification: widget.notif, isSelected: selected));
            print(this.selected);
          },
        ),
      ),
    );
  }
}

class NotificationTitle extends StatelessWidget {
  const NotificationTitle({
    super.key,
    required this.widget,
  });

  final NotificationTile widget;

  @override
  Widget build(BuildContext context) {
    return Text(widget.notif.title,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        maxLines: 2,
        overflow: TextOverflow.ellipsis);
  }
}

class TimeSlot extends StatelessWidget {
  const TimeSlot({
    super.key,
    required this.timeOfDay,
    required this.dateOfNotification,
  });

  final String timeOfDay;
  final String dateOfNotification;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          timeOfDay,
          style: TextStyle(
              color: Theme.of(context).textTheme.labelMedium?.color,
              fontSize: 8,
              fontWeight: FontWeight.normal),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: true,
        ),
        Text(
          dateOfNotification,
          maxLines: 1,
          style: TextStyle(
              color: Theme.of(context).textTheme.labelSmall?.color,
              fontSize: 7,
              fontWeight: FontWeight.w100),
        )
      ],
    );
  }
}

class Recurring extends StatelessWidget {
  const Recurring({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "30d",
            style: TextStyle(
                color: Theme.of(context).textTheme.labelMedium?.color,
                fontWeight: FontWeight.normal,
                fontSize: 8),
          ),
          Icon(
            Icons.repeat_rounded,
            color: Colors.blueAccent.shade700,
            size: 16,
          ),
        ],
      ),
    );
  }
}

class Reminder extends StatelessWidget {
  const Reminder({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1h",
            style: selected
                ? TextStyle(
                    color: Theme.of(context).textTheme.labelSmall?.color,
                    fontSize: 10,
                  )
                : TextStyle(
                    color: Theme.of(context).textTheme.labelSmall?.color,
                    fontWeight: FontWeight.normal,
                    fontSize: 8),
          ),
          const Icon(
            FontAwesomeIcons.solidBell,
            color: Color(0xFFB36823),
            size: 12,
          )
        ],
      ),
    );
  }
}
