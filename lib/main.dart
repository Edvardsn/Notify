import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:husk/widgets/navbar.dart';
import 'package:husk/themes/dark_theme.dart';
import 'package:husk/widgets/notification_header.dart';
import 'package:husk/widgets/notification_tile.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DarkTheme.themeData,
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

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).focusColor,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // const NotificationHeader(),
          // Divider(
          //   color: Theme.of(context).primaryTextTheme.labelSmall?.color,
          //   thickness: 1,
          //   indent: 16,
          //   endIndent: 16,
          // ),
          Flexible(
            flex: 8,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              scrollDirection: Axis.vertical,
              children: [
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
              ],
            ),
          ),
          const Spacer(flex: 2)
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
