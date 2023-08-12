import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:husk/data/model/notification.dart';
import 'package:husk/utils/logger_utils.dart';
import 'package:husk/view/pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';
import 'package:husk/view/widgets/notification/notification_tile.dart';
import 'package:husk/view/widgets/notification_item.dart';

///
///
///
class NotificationsList extends StatefulWidget {
  const NotificationsList({
    super.key,
    required this.initialList,
  });

  final List<Notification> initialList;

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();

  ///* Make subscription to bloc stream is better, stops having to update.
  List<Notification> _listItems = [];
  List<Notification> _selectedItems = [];

  // Initializes the internal list state to reflect the state of the list upon creation.
  @override
  void initState() {
    super.initState();
    _listItems = widget.initialList;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        /// Records selection of list items to internal state
        BlocListener<NotificationDashboardBloc, NotificationDashboardState>(
          listenWhen: (previous, current) {
            return previous.selectedNotifications !=
                    current.selectedNotifications &&
                current.status != NotificationDashboardStatus.processing;
          },
          listener: (context, state) {
            _selectedItems = context
                .read<NotificationDashboardBloc>()
                .state
                .selectedNotifications;
          },
        ),

        // Removal of items
        BlocListener<NotificationDashboardBloc, NotificationDashboardState>(
          listenWhen: (previous, current) {
            return previous.notifications.length > current.notifications.length;
          },
          listener: (context, state) async {
            for (final item in _listItems) {
              if (item.key == null) {
                _animatedListKey.currentState!.removeItem(
                  _listItems.indexOf(item),
                  (context, animation) => NotificationItem(
                    animation: animation,
                    notification: NotificationTile(notif: item, selected: true),
                  ),
                );
              }
            }
            _listItems = state.notifications;
          },
        ),

        // Insertion of item
        BlocListener<NotificationDashboardBloc, NotificationDashboardState>(
          listenWhen: (previous, current) {
            return previous.notifications.length < current.notifications.length;
          },
          listener: (context, state) {
            var lastItemIndex = context
                    .read<NotificationDashboardBloc>()
                    .state
                    .notifications
                    .length -
                1;

            _animatedListKey.currentState?.insertItem(lastItemIndex);

            _listItems = state.notifications;
          },
        ),
      ],
      child: AnimationLimiter(
        child: FadingEdgeScrollView.fromAnimatedList(
          child: AnimatedList(
            key: _animatedListKey,
            controller: ScrollController(),
            shrinkWrap: true,
            initialItemCount: context
                .read<NotificationDashboardBloc>()
                .state
                .notifications
                .length,
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            itemBuilder: (context, index, animation) {
              LoggerUtils.logger
                  .d("Building item index:$index", time: DateTime.now());
              return AnimationConfiguration.staggeredList(
                position: index,
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 600),
                  child: NotificationItem(
                    animation: animation,
                    notification: NotificationTile(
                      notif: _listItems[index],
                      selected: _selectedItems.contains(_listItems[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
