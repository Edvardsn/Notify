import 'package:flutter/material.dart';

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
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: SizedBox(
          height: 25,
          width: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "16:00",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.labelMedium?.color,
                      fontSize: 8,
                      fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                ),
              ),
              Flexible(
                child: Text(
                  dateOfNotification,
                  maxLines: 1,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.labelSmall?.color,
                      fontSize: 7,
                      fontWeight: FontWeight.w100),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
