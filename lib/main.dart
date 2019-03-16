import 'package:flutter/material.dart';

import './screens/task_lists_screen/task_lists_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks Lists',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: TaskListsScreen(),
    );
  }
}
