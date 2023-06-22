import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationHeader extends StatefulWidget {
  const NotificationHeader({super.key});

  @override
  State<NotificationHeader> createState() => _NotificationHeaderState();
}

class _NotificationHeaderState extends State<NotificationHeader> {
  final List<Widget> _notif_type = <Widget>[
    const Text('Active', style: TextStyle(color: Colors.black87)),
    const Text('Inactive', style: TextStyle(color: Colors.black87))
  ];

  final List<bool> _selectedFruits = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(
        children: [
          Flexible(
            flex: 28,
            fit: FlexFit.loose,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
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
                borderRadius: const BorderRadius.all(Radius.circular(8)),
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
          const Spacer(flex: 3),
          Flexible(
            flex: 21,
            fit: FlexFit.tight,
            child: Icon(
              Icons.alarm,
              color: Theme.of(context).primaryTextTheme.labelSmall?.color,
              size: 26,
            ),
          ),
          Flexible(
            flex: 14,
            fit: FlexFit.tight,
            child: Icon(
              Icons.refresh_rounded,
              color: Theme.of(context).primaryTextTheme.labelSmall?.color,
              size: 26,
            ),
          ),
          Flexible(
            flex: 20,
            fit: FlexFit.tight,
            child: Icon(FontAwesomeIcons.solidBell,
                color: Theme.of(context).primaryTextTheme.labelSmall?.color,
                size: 20),
          ),
          const Spacer(flex: 15)
        ],
      )
    ]);
  }
}
