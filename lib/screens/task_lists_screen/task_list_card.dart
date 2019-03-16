import 'package:flutter/material.dart';

import './task.dart';

class TaskListCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  TaskListCard(this.title, this.backgroundColor);

  final List<Map<String, dynamic>> tasks = [
    {'id': 1, 'body': 'Book Flights', 'completed': false},
    {'id': 2, 'body': 'Passport check', 'completed': true},
    {'id': 3, 'body': 'Walk the dog', 'completed': false},
    {'id': 4, 'body': 'Hotel reservations', 'completed': true}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145.0,
      child: Card(
        color: backgroundColor,
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
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
