import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';

class AddNotificationButton extends StatefulWidget {
  const AddNotificationButton({super.key});

  @override
  State<AddNotificationButton> createState() => _AddNotificationButtonState();
}

class _AddNotificationButtonState extends State<AddNotificationButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context
              .read<NotificationDashboardBloc>()
              .state
              .selectedNotifications
              .isEmpty
          ? Colors.blue
          : Colors.red,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {},
    );
  }
}
