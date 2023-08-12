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
    return const Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: SizedBox(
        height: 30,
        width: 40,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Text(
                  "1h",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 9,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Flexible(
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
