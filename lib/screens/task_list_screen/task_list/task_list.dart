import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import './task_list_header/task_list_header.dart';

class TaskList extends StatelessWidget {
  final String listId;
  final Color mainColor;

  TaskList(this.listId, this.mainColor);

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

            if (snapshot.data['tasks'] == null) {
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

            final List<dynamic> tasks = snapshot.data['tasks'];
            final int tasksLength = tasks.length;
            final int tasksCompleted =
                tasks.where((task) => task['completed'] == true).length;

            return Column(
              children: <Widget>[
                TaskListHeader(
                  listName,
                  mainColor,
                  tasksCompleted,
                  tasksLength,
                ),
                Container(
                  height: 400.0,
                  child: ListView.builder(
                    itemCount: tasksLength,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(tasks[index]['body']);
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
