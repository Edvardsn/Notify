import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:husk/data/api/hive_notifications_api.dart';
import 'package:husk/domain/repository/notifications_repository.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:device_preview/device_preview.dart';
import 'package:husk/utils/logger_utils.dart';
import 'package:husk/view/pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';
import 'package:husk/view/themes/blue_theme.dart';
import 'package:husk/view/widgets/navbar.dart';

import 'view/widgets/notification/notification_tile.dart';

void main() async {
  NotificationsRepository notificationsRepository =
      NotificationsRepository(api: HiveNotificationsApi());

  LoggerUtils.logger.i("Application initialized");

  runApp(
    DevicePreview(
      builder: (context) => MyApp(
        notificationsRepository: notificationsRepository,
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key, required NotificationsRepository notificationsRepository})
      : _notificationsRepository = notificationsRepository;

  final NotificationsRepository _notificationsRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: _notificationsRepository,
        child: MaterialApp(
          title: 'Husk',
          theme: BlueTheme.themeData,
          home: const MyHomePage(title: 'Notifications'),
          builder: DevicePreview.appBuilder,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationDashboardBloc(
          repository: context.read<NotificationsRepository>())
        ..add(const NotificationsSubscriptionEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          centerTitle: false,
          title: Text(widget.title),
        ),
        body: Column(
          //Total flex factor: 100
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 3),
            BlocBuilder<NotificationDashboardBloc, NotificationDashboardState>(
              builder: (context, state) {
                if (state.status == NotificationDashboardStatus.loading) {
                  return const Expanded(
                    flex: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    flex: 65,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: state.notifications.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
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
              },
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 15,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocBuilder<NotificationDashboardBloc,
                      NotificationDashboardState>(
                    builder: (context, state) {
                      if (state.status == NotificationDashboardStatus.loading) {
                        return const SizedBox(height: 0, width: 0);
                      } else if (state.selectedNotifications.isEmpty) {
                        return const AddNotificationButton();
                      } else {
                        return const RemoveNotificationButton();
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}

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
