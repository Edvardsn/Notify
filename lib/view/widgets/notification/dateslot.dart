import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DateSlot extends StatelessWidget {
  const DateSlot({
    super.key,
    required this.timeOfDay,
    required this.dateOfNotification,
  });

  final String timeOfDay;
  final String dateOfNotification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return Focus(
            child: DatePickerDialog(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2050),
              initialCalendarMode: DatePickerMode.day,
            ),
          );
        },
      ),
      child: const Card(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "24.08",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 9,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                      Text(
                        "2023",
                        style: TextStyle(fontSize: 7),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.red,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
