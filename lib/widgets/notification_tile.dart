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
      DateFormat("Hm").format(widget.notif.timeOfNotification);

  late String timeOfMonth;

  late String dateOfNotification =
      DateFormat("d/$timeOfMonth/y").format(widget.notif.timeOfNotification);

  /// Formats the given date to european format
  void _formatDate() {
    if (DateFormat("M").format(widget.notif.timeOfNotification).length == 1) {
      timeOfMonth =
          "0${DateFormat("M").format(widget.notif.timeOfNotification)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    _formatDate();

    return Card(
      margin: const EdgeInsets.all(12),
      color: Theme.of(context).cardColor,
      child: ListTile(
        horizontalTitleGap: 1,
        contentPadding: const EdgeInsets.all(8),
        isThreeLine: true,
        // dense: true,
        title: Text(widget.notif.title),
        //   style: const TextStyle(
        //       color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: 2,
        //   softWrap: true,
        // ),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    timeOfDay,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                  Text(
                    dateOfNotification,
                    maxLines: 1,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.labelSmall?.color,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1h",
                      style: selected
                          ? TextStyle(
                              color: const Color.fromARGB(255, 28, 45, 59),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 40,
                            )
                          : TextStyle(
                              color: Color.fromARGB(255, 207, 47, 207),
                              decoration: TextDecoration.lineThrough,
                            ),
                    ),
                    Icon(
                      FontAwesomeIcons.solidBell,
                      color: Color(0xFFB36823),
                      size: 18,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "30d",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.repeat_rounded,
                      color: Colors.blueAccent.shade700,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          icon: selected
              ? const Icon(Icons.radio_button_off)
              : const Icon(Icons.radio_button_checked_rounded),
          color: Theme.of(context).primaryTextTheme.labelSmall?.color,
          iconSize: 32,
          onPressed: () {
            setState(() {
              selected = !selected;
            });
            context
                .read<NotificationDashboardBloc>()
                .add(NotificationSelectedEvent(notification: widget.notif));
            print(this.selected);
          },
        ),
      ),
    );
  }
}
