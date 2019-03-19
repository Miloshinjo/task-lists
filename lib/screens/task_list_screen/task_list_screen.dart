import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class TaskListScreen extends StatelessWidget {
  final String id;
  final Color mainColor;

  TaskListScreen(this.id, this.mainColor);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          color: mainColor,
          child: Text(
            'Welcome to Task List Screen. You`re finished $id',
          ),
        ),
      ),
    );
  }
}
