import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String body;
  final bool completed;
  final Color mainColor;

  Task(this.body, this.completed, this.mainColor);

  List<Widget> _buildTask() {
    if (!completed) {
      return [
        Container(
          margin: EdgeInsets.only(right: 21.0),
          width: 15.0,
          height: 15.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
        ),
        SizedBox(width: 5.0),
        Text(
          body,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        )
      ];
    } else {
      return [
        Container(
          margin: EdgeInsets.only(right: 21.0),
          width: 15.0,
          height: 15.0,
        ),
        SizedBox(width: 5.0),
        Text(
          body,
          style: TextStyle(
            color: mainColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            decorationColor: mainColor,
            decoration: TextDecoration.lineThrough,
          ),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: completed ? Colors.grey[200] : null,
      padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 51.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildTask(),
      ),
    );
  }
}
