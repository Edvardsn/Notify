import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';

class AddNotificationButton extends StatelessWidget {
  const AddNotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      onPressed: () => {
        context
            .read<NotificationDashboardBloc>()
            .add(const NotificationCreatedEvent())
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.add),
    );
  }
}
