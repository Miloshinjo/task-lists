import 'package:flutter/material.dart';

class TaskListHeader extends StatelessWidget {
  final Color mainColor;
  final int tasksCompleted;
  final int tasksCount;

  TaskListHeader(this.mainColor, this.tasksCompleted, this.tasksCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      padding: EdgeInsets.only(left: 21.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 25.0, bottom: 30.0),
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(mainColor),
              value: tasksCompleted / tasksCount,
              strokeWidth: 3.0,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[300],
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'My Tasks',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$tasksCompleted of $tasksCount tasks',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
