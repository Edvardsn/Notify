import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({
    super.key,
    required this.timeOfDay,
    required this.dateOfNotification,
  });

  final String timeOfDay;
  final String dateOfNotification;

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: SizedBox(
          height: 25,
          width: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Text(
                  "16:00",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 9,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                ),
              ),
              Flexible(
                child: Icon(
                  FontAwesomeIcons.solidBell,
                  color: Colors.orange,
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
