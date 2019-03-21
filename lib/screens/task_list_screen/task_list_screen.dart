import 'package:flutter/material.dart';

import './top_bar/top_bar.dart';
import './task_list/task_list.dart';
import './add_task/add_task.dart';

class TaskListScreen extends StatelessWidget {
  final String listId;
  final Color mainColor;

  TaskListScreen(this.listId, this.mainColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (DragEndDetails dragDetails) {
        if (dragDetails.primaryVelocity > 3000) Navigator.pop(context);
      },
      child: Hero(
        tag: listId,
        child: Scaffold(
          floatingActionButton: AddTask(mainColor),
          body: Column(
            children: <Widget>[
              TopBar(),
              SizedBox(height: 50.0),
              TaskList(listId, mainColor),
            ],
          ),
        ),
      ),
    );
  }
}
