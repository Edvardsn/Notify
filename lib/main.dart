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

  final List<Widget> _notif_type = <Widget>[
    const Text('Active', style: TextStyle(color: Colors.black87)),
    const Text('Inactive', style: TextStyle(color: Colors.black87))
  ];
  final List<bool> _selectedFruits = <bool>[true, false];

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
    var deviceData = MediaQuery.of(context);

    var screenWidth = MediaQuery.of(context).size.width;

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 30,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: ToggleButtons(
                        direction: Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                            // The button that is tapped is set to true, and the others to false.
                            for (int i = 0; i < _selectedFruits.length; i++) {
                              _selectedFruits[i] = i == index;
                            }
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        hoverColor: Colors.black38,
                        disabledColor: Colors.white60,
                        color: Colors.white,
                        fillColor: Colors.white,
                        borderColor: Colors.grey,
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        isSelected: _selectedFruits,
                        children: _notif_type,
                      ),
                    ),
                  ),
                  const Spacer(flex: 15),
                  Flexible(
                    flex: 21,
                    fit: FlexFit.tight,
                    child: Icon(
                      Icons.alarm,
                      color:
                          Theme.of(context).primaryTextTheme.labelSmall?.color,
                      size: 26,
                    ),
                  ),
                  Flexible(
                    flex: 14,
                    fit: FlexFit.tight,
                    child: Icon(
                      Icons.refresh_rounded,
                      color:
                          Theme.of(context).primaryTextTheme.labelSmall?.color,
                      size: 26,
                    ),
                  ),
                  Flexible(
                    flex: 20,
                    fit: FlexFit.tight,
                    child: Icon(FontAwesomeIcons.solidBell,
                        color: Theme.of(context)
                            .primaryTextTheme
                            .labelSmall
                            ?.color,
                        size: 20),
                  ),
                  const Spacer(flex: 15)
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
              children: [
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Flexible(
                            flex: 30,
                            fit: FlexFit.loose,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Text(
                                "Take out the trash and prepare dinner and do a lot of stuff that does not need to be done or something.",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 21,
                            fit: FlexFit.loose,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "16:00",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                  ),
                                  Text(
                                    "10/07/2023",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .labelSmall
                                            ?.color,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Flexible(
                            flex: 14,
                            fit: FlexFit.loose,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "1h",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.solidBell,
                                    color: Color(0xFFB36823),
                                    size: 18,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "30d",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.repeat_rounded,
                                  color: Colors.blueAccent.shade700,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 15,
                            fit: FlexFit.loose,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.radio_button_off,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .labelSmall
                                      ?.color,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
