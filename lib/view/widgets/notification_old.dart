import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A class representing a notification
///
///
///
// ignore: Deprecated by the Notification.
@Deprecated("Outdated widget. See NavBar for updated version.")
class NotificationOld extends StatelessWidget {
  const NotificationOld({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  Flexible(
                    flex: 21,
                    fit: FlexFit.loose,
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
    );
  }
}
