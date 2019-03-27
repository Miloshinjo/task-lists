import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/firestore_utils.dart' as firestore;

import './task_list_header/task_list_header.dart';
import './task/task.dart';

class TaskList extends StatelessWidget {
  final String listId;
  final Color mainColor;

  TaskList(this.listId, this.mainColor);

  Widget _buildTasks(List<dynamic> tasks) {
    return Column(
      children: tasks
          .map(
            (task) => Dismissible(
                  key: Key(task['body']),
                  child:
                      Task(listId, task['body'], task['completed'], mainColor),
                  background: Container(color: mainColor),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.startToEnd) {
                      firestore.deleteArrayDocument('task-lists', listId, {
                        'body': task['body'],
                        'completed': task['completed']
                      });
                    }
                  },
                ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<Object>(
          stream: Firestore.instance
              .collection('task-lists')
              .document(listId)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                ),
              );
            }
            final String listName = snapshot.data['listName'];

            final List<dynamic> tasks = snapshot.data['tasks'];

            if (tasks == null || tasks.length == 0) {
              return Expanded(
                child: Column(
                  children: <Widget>[
                    TaskListHeader(
                      listName,
                      mainColor,
                      0,
                      0,
                    ),
                    Center(
                      child: Text('You have no tasks at the moment'),
                    )
                  ],
                ),
              );
            }

            final int tasksCompleted =
                tasks.where((task) => task['completed'] == true).length;

            return Container(
              child: Column(
                children: <Widget>[
                  TaskListHeader(
                    listName,
                    mainColor,
                    tasksCompleted,
                    tasks.length,
                  ),
                  _buildTasks(tasks),
                ],
              ),
            );
          }),
    );
  }
}
