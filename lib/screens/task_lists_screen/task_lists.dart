import 'package:flutter/material.dart';

import './task_list_card.dart';
import '../../theme/colors.dart';

List<Widget> _mockedTaskListItems = [
  TaskListCard('My Tasks', listColors[0]),
  TaskListCard('Flutter Tasks', listColors[1]),
  TaskListCard('Shopping List', listColors[2]),
  TaskListCard('Shopping List', listColors[3]),
  TaskListCard('Shopping List', listColors[4]),
  TaskListCard('Shopping List', listColors[5]),
];

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: _mockedTaskListItems,
        ),
      ),
    );
  }
}
