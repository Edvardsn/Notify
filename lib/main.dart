import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:husk/data/api/hive_notifications_api.dart';
import 'package:husk/domain/repository/notifications_repository.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:device_preview/device_preview.dart';
import 'package:husk/utils/logger_utils.dart';
import 'package:husk/utils/notification_utils.dart';
import 'package:husk/view/pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';
import 'package:husk/view/themes/blue_theme.dart';
import 'package:husk/view/widgets/navbar.dart';
import 'view/widgets/buttons/add_notificaton_button.dart';
import 'view/widgets/buttons/remove_notification_button.dart';
import 'view/widgets/loading_indicator.dart';
import 'view/widgets/notifications_list.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationUtils().initNotification();
  tz.initializeTimeZones();
  // tz.setLocalLocation();

  NotificationsRepository notificationsRepository =
      NotificationsRepository(api: HiveNotificationsApi());

  LoggerUtils.logger.i("Application initialized");

  runApp(
    // DevicePreview(
    //   builder: (context) =>
    MyApp(
      notificationsRepository: notificationsRepository,
    ), // Wrap your app
    // ),
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
              buildWhen: (previous, current) {
                return previous.status != current.status;
              },
              builder: (context, state) {
                if (state.status == NotificationDashboardStatus.loading) {
                  return const Expanded(
                    flex: 65,
                    child: LoadingIndicator(),
                  );
                } else if (state.status ==
                    NotificationDashboardStatus.inactive) {
                  return const SizedBox(
                    height: 0,
                    width: 0,
                  );
                } else {
                  return Expanded(
                    flex: 77,
                    child: NotificationsList(
                      initialList: state.notifications,
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
      ),
    );
  }
}
