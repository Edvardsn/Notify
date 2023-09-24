import 'package:flutter/material.dart';

class DateSlot extends StatefulWidget {
  const DateSlot({
    super.key,
    required this.timeOfNotification,
  });

  final DateTime? timeOfNotification;

  @override
  State<DateSlot> createState() => _DateSlotState();
}

class _DateSlotState extends State<DateSlot> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: widget.timeOfNotification != null
            ? widget.timeOfNotification!.isAfter(DateTime.now())
                ? Theme.of(context).cardColor
                : Colors.grey
            : Theme.of(context).cardColor,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        (widget.timeOfNotification != null)
                            ? "${widget.timeOfNotification!.day}.${widget.timeOfNotification!.month}"
                            : "-",
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 9,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                      Text(
                        (widget.timeOfNotification != null)
                            ? "${widget.timeOfNotification!.year}"
                            : "-",
                        style: const TextStyle(fontSize: 7),
                      )
                    ],
                  ),
                ),
                const Flexible(
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
