import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({super.key});

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool _tileSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Expanded(
        child: ListTile(
          horizontalTitleGap: 1,
          contentPadding: const EdgeInsets.all(8),
          isThreeLine: true,
          // dense: true,
          title: const Text(
            "Take out the trash and prepare dinner and do a lot of stuff that does not need to be done or something.",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: true,
          ),
          titleAlignment: ListTileTitleAlignment.center,
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "16:00",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
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
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1h",
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        FontAwesomeIcons.solidBell,
                        color: Color(0xFFB36823),
                        size: 18,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "30d",
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.repeat_rounded,
                        color: Colors.blueAccent.shade700,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.radio_button_off),
            color: Theme.of(context).primaryTextTheme.labelSmall?.color,
            iconSize: 32,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
