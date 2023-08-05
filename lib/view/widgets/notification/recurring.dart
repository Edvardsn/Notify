import 'package:flutter/material.dart';

class Recurring extends StatelessWidget {
  const Recurring({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      elevation: 2,
      child: SizedBox(
        height: 25,
        width: 40,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "30d",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.labelMedium?.color,
                      fontWeight: FontWeight.normal,
                      fontSize: 8),
                ),
              ),
              Flexible(
                child: Icon(
                  Icons.repeat_rounded,
                  color: Colors.blueAccent.shade700,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
