import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/firestore_utils.dart' as firestore;

import './task_list_header/task_list_header.dart';
import './task/task.dart';

class TaskList extends StatelessWidget {
  final String listId;
  final String listName;
  final List<dynamic> tasks;
  final Color mainColor;

  TaskList(this.listId, this.listName, this.tasks, this.mainColor);

  Column _buildTasks(List<dynamic> tasks) {
    return Column(
      children: tasks
          .map(
            (task) => Dismissible(
                  key: Key(task['body']),
                  child: Task(
                    listId,
                    task['id'],
                    task['body'],
                    task['completed'],
                    mainColor,
                  ),
                  background: Container(color: mainColor),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.startToEnd) {
                      firestore.deleteTaskDocument(listId, {
                        'id': task['id'],
                        'body': task['body'],
                        'completed': task['completed'],
                      });
                    }
                  },
                ),
          )
          .toList(),
    );
  }

  Expanded _buildEmptyContainer(String _listName) {
    return Expanded(
      child: Column(
        children: <Widget>[
          TaskListHeader(
            _listName,
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

  Container _buildContainer(
      String _listName, int _tasksCompleted, List _tasks) {
    return Container(
      child: Column(
        children: <Widget>[
          TaskListHeader(
            listName,
            mainColor,
            _tasksCompleted,
            _tasks.length,
          ),
          _buildTasks(_tasks),
        ],
      ),
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
              if (tasks == null || tasks.length == 0)
                return _buildEmptyContainer(listName);
              final int tasksCompleted =
                  tasks.where((task) => task['completed'] == true).length;
              return _buildContainer(listName, tasksCompleted, tasks);
            }
            final String _listName = snapshot.data['listName'];

            final List<dynamic> _tasks = snapshot.data['tasks'];

            if (_tasks == null || _tasks.length == 0)
              return _buildEmptyContainer(_listName);

            final int _tasksCompleted =
                _tasks.where((task) => task['completed'] == true).length;

            return _buildContainer(_listName, _tasksCompleted, _tasks);
          }),
    );
  }
}
