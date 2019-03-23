import 'package:flutter/material.dart';

import './task.dart';
import '../../../task_list_screen/task_list_screen.dart';

class TaskListCard extends StatelessWidget {
  final String listId;
  final String title;
  final Color backgroundColor;
  final List<dynamic> tasks;

  TaskListCard(this.listId, this.title, this.backgroundColor, this.tasks);

  Widget _buildTasksList(List<dynamic> tasks) {
    // if there is no tasks, show some placeholder UI
    if (tasks.length == 0) {
      return Center(
        child: Text(
          'Drag up 👆 to start adding some tasks',
          style: TextStyle(
            fontSize: 8.0,
            color: Colors.white,
          ),
        ),
      );
    }

    // if List of tasks is longer then 4, show only 4 tasks as max on the UI
    if (tasks.length > 4) {
      List<dynamic> shownTasks = tasks.take(4).toList();
      return Column(
        children: shownTasks
            .map((task) => Task(task['body'], task['completed']))
            .toList(),
      );
    }

    return Column(
      children:
          tasks.map((task) => Task(task['body'], task['completed'])).toList(),
    );
  }

  void _redirectToTaskList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        maintainState: true,
        builder: (BuildContext context) =>
            TaskListScreen(listId, backgroundColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (DragEndDetails dragDetails) {
        if (dragDetails.primaryVelocity < 0) _redirectToTaskList(context);
      },
      child: Hero(
        tag: listId,
        child: Container(
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
                    child: _buildTasksList(tasks)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
