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

    return Text(widget.title as String,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        maxLines: 2,
        overflow: TextOverflow.ellipsis);
  }
}
