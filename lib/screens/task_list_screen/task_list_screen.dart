import 'package:flutter/material.dart';

import './top_bar/top_bar.dart';
import './task_list/task_list.dart';
import './add_task/add_task.dart';

class TaskListScreen extends StatelessWidget {
  final String listId;
  final String listName;
  final List<dynamic> tasks;
  final Color mainColor;

  TaskListScreen(this.listId, this.listName, this.tasks, this.mainColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragEnd: (DragEndDetails dragDetails) {
        if (dragDetails.primaryVelocity > 2000) Navigator.pop(context);
      },
      child: Hero(
        tag: listId,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          floatingActionButton: AddTask(listId, mainColor),
          body: Column(
            children: <Widget>[
              TopBar(),
              SizedBox(height: 50.0),
              TaskList(listId, listName, tasks, mainColor),
            ],
          ),
        ),
      ),
    );
  }
}
