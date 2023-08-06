import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';
import 'notification/notification_tile.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var state = context.read<NotificationDashboardBloc>().state;

    return AnimationLimiter(
      child: FadingEdgeScrollView.fromAnimatedList(
        child: AnimatedList(
          initialItemCount: state.notifications.length,
          controller: ScrollController(),
          itemBuilder: (context, index, animaiton) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 400),
              child: SlideAnimation(
                verticalOffset: 30,
                child: FadeInAnimation(
                  child: NotificationTile(
                    notif: state.notifications[index],
                    selected: state.selectedNotifications
                        .contains(state.notifications[index]),
                  ),
                ),
              ),
            );
          },
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
