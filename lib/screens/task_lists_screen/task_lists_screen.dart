import 'package:flutter/material.dart';

import './top_bar/top_bar.dart';
import './app_title/app_title.dart';
import './bottom_bar/bottom_bar.dart';
import './task_lists/task_lists.dart';
import './add_list/add_list.dart';

class TaskListsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomBar(),
        body: Column(
          children: <Widget>[
            TopBar(),
            SizedBox(height: 50.0),
            AppTitle(),
            SizedBox(height: 30.0),
            AddList(),
            SizedBox(height: 20.0),
            TaskLists(),
          ],
        ));
  }
}
