import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Reminder extends StatelessWidget {
  const Reminder({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: SizedBox(
        height: 25,
        width: 40,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "1h",
                  style: selected
                      ? TextStyle(
                          color: Theme.of(context).textTheme.labelSmall?.color,
                          fontSize: 10,
                        )
                      : TextStyle(
                          color: Theme.of(context).textTheme.labelSmall?.color,
                          fontWeight: FontWeight.normal,
                          fontSize: 8),
                ),
              ),
              const Flexible(
                child: Icon(
                  FontAwesomeIcons.solidBell,
                  color: Color(0xFFB36823),
                  size: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
