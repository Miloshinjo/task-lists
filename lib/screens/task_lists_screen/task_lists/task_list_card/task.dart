import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String body;
  final bool completed;

  Task(this.body, this.completed);

  List<Widget> _buildTask() {
    if (!completed) {
      return [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
        ),
        SizedBox(width: 5.0),
        Text(
          body,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
          ),
        )
      ];
    } else {
      return [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: 8.0,
          height: 8.0,
        ),
        SizedBox(width: 5.0),
        Text(
          body,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
            decorationColor: Colors.white,
            decoration: TextDecoration.lineThrough,
          ),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildTask(),
    );
  }
}
