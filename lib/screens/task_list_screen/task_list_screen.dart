import 'package:flutter/material.dart';

import '../../widgets/logo.dart';
import './task_list_header.dart';

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
          floatingActionButton: InkWell(
            onTap: () {},
            splashColor: Colors.white,
            highlightColor: Colors.white,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: mainColor,
              ),
              child: Icon(
                Icons.add,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 50.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Logo(),
                    IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 32.0,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              TaskListHeader(mainColor, 3, 7)
            ],
          ),
        ),
      ),
    );
  }
}
