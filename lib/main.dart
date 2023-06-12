import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:husk/navbar.dart';

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
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color(0xFF14181b),
          focusColor: const Color(0xFF0A0C0E),
          primaryTextTheme: const TextTheme(
              displayLarge: TextStyle(color: Colors.white),
              labelSmall: TextStyle(color: Color(0xFF57636C)))),
      home: const MyHomePage(title: 'Notifications'),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).focusColor,

          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: TextStyle(
              color: Theme.of(context).primaryTextTheme.displayLarge?.color,
            ),
          )),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSlidingSegmentedControl(
                    children: const {1: Text("Active"), 2: Text("Inactive")},
                    onValueChanged: (int newValue) {},
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    thumbDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Icon(
                    Icons.alarm,
                    color: Theme.of(context).primaryTextTheme.labelSmall?.color,
                    size: 26,
                  ),
                  Icon(
                    Icons.refresh_rounded,
                    color: Theme.of(context).primaryTextTheme.labelSmall?.color,
                    size: 26,
                  ),
                  Icon(FontAwesomeIcons.solidBell,
                      color:
                          Theme.of(context).primaryTextTheme.labelSmall?.color,
                      size: 20),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).primaryTextTheme.labelSmall?.color,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(12),
              children: [
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Flexible(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Take out the trash and prepare dinner and do a lot of stuff that does not need to be done or something.",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                      const Flexible(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                "16:00",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                              ),
                              Text("10/07/2023")
                            ],
                          ),
                        ),
                      ),
                      const Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Text(
                              "1h",
                              style: TextStyle(color: Colors.black87),
                            ),
                            Icon(
                              FontAwesomeIcons.solidBell,
                              color: Color(0xFFB36823),
                              size: 18,
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.refresh_rounded,
                              color: Colors.blueAccent.shade700,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
