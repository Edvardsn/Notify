import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:husk/view/pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';

import '../../../data/model/notification.dart';

class NotificationTitle extends StatefulWidget {
  NotificationTitle({
    super.key,
    required this.notification,
  });

  Notification notification;

  @override
  State<NotificationTitle> createState() => _NotificationTitleState();
}

class _NotificationTitleState extends State<NotificationTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
                fontSize: 13),
            decoration:
                const InputDecoration(border: InputBorder.none, isDense: true),
            controller: TextEditingController.fromValue(
              TextEditingValue(text: widget.notification.title ?? "-"),
            ),
            keyboardType: TextInputType.multiline,
            onChanged: (value) {
              context.read<NotificationDashboardBloc>().add(
                    NotificationEditedEvent(
                        widget.notification.copyWith(title: value),
                        widget.notification),
                  );
            },
          ),
        ),
      ],
    );
  }
}
