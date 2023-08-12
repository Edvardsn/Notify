import 'package:flutter/material.dart';

class NotificationTitle extends StatefulWidget {
  NotificationTitle({
    super.key,
    required this.title,
  });

  String? title;

  @override
  State<NotificationTitle> createState() => _NotificationTitleState();
}

class _NotificationTitleState extends State<NotificationTitle> {
  @override
  Widget build(BuildContext context) {
    widget.title ??= "Something important to remember";

    return Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
                fontSize: 13),
            decoration:
                const InputDecoration(border: InputBorder.none, isDense: true),
            controller: TextEditingController.fromValue(
              const TextEditingValue(
                  text:
                      "testing testing, 5 something has to remember blablablabal lalalalal jadadadada"),
            ),
          ),
        ),
      ],
    );
  }
}
