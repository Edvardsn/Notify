import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({
    super.key,
    required this.timeOfDay,
  });

  final DateTime? timeOfDay;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: SizedBox(
          height: 25,
          width: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Text(
                  timeOfDay != null && timeOfDay!.minute >= 10
                      ? "${timeOfDay!.hour}:${timeOfDay!.minute}"
                      : (timeOfDay != null)
                          ? "${timeOfDay!.hour}:0${timeOfDay!.minute}"
                          : "-",
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 9,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                ),
              ),
              const Flexible(
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
