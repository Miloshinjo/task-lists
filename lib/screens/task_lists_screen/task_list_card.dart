import 'package:flutter/material.dart';

import './task.dart';

class TaskListCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final List<dynamic> tasks;

  TaskListCard(this.title, this.backgroundColor, this.tasks);

  // final List<Map<String, dynamic>> tasks = [
  //   {'body': 'Book Flights', 'completed': false},
  //   {'body': 'Passport check', 'completed': true},
  //   {'body': 'Walk the dog', 'completed': false},
  //   {'body': 'Hotel reservations', 'completed': true}
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145.0,
      child: Card(
        color: backgroundColor,
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 50.0,
              margin: EdgeInsets.only(top: 15.0, left: 21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 21.0, top: 15.0),
              padding: EdgeInsets.only(top: 15.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
              ),
              child: Column(
                children: tasks
                    .map((task) => Task(task['body'], task['completed']))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
