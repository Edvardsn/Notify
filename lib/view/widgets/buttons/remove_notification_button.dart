import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';

class RemoveNotificationButton extends StatelessWidget {
  const RemoveNotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => {
              context
                  .read<NotificationDashboardBloc>()
                  .add(const NotificationRemovedSelectedEvent())
            },
        backgroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        child: const Icon(FontAwesomeIcons.trashCan));
  }
}
