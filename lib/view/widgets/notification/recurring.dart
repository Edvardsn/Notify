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
        height: 30,
        width: 45,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Flexible(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 9),
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
