import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:husk/data/notifications_api.dart';
import 'package:husk/models/notification.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:device_preview/device_preview.dart';
import 'package:husk/pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';
import 'package:husk/themes/blue_theme.dart';
import 'package:husk/widgets/navbar.dart';
import 'package:husk/widgets/navbar_old.dart';
import 'package:husk/themes/dark_theme.dart';
import 'package:husk/widgets/notification_tile.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Husk',
      theme: BlueTheme.themeData,
      home: const MyHomePage(title: 'Notifications'),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
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
    var deviceData = MediaQuery.of(context);
    var screenWidth = MediaQuery.of(context).size.width;

    // ignore: unused_local_variable
    var test = Notification(
        title: "Something that despereatley needs to be done",
        timeOfNotification: DateTime.now(),
        id: 1);

    return BlocProvider(
      create: (context) => NotificationDashboardBloc(api: NotificationsApi()),
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
            Expanded(
              flex: 65,
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal),
                scrollDirection: Axis.vertical,
                children: [
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                  NotificationTile(notif: test),
                ],
              ),
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
                      if (state.selectedNotifications.isEmpty) {
                        return FloatingActionButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(28),
                            ),
                          ),
                          onPressed: () => {},
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.add),
                        );
                      } else {
                        return FloatingActionButton(
                            onPressed: () => {
                                  context.read<NotificationDashboardBloc>().add(
                                      const NotificationRemovedSelectedEvent())
                                },
                            backgroundColor: Colors.red,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(28),
                              ),
                            ),
                            child: const Icon(FontAwesomeIcons.trashCan));
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
