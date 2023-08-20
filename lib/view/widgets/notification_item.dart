import 'package:flutter/material.dart';
import 'package:husk/view/widgets/notification/notification_tile.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key, required this.animation, required this.notification});

  final Animation<double> animation;
  final NotificationTile notification;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animation, child: notification);
  }
}
