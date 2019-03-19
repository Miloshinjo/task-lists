import 'package:flutter/material.dart';

import '../../widgets/logo.dart';

class TaskListScreen extends StatelessWidget {
  final String id;
  final Color mainColor;

  TaskListScreen(this.id, this.mainColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (DragEndDetails dragDetails) {
        if (dragDetails.primaryVelocity > 500) Navigator.pop(context);
      },
      child: Hero(
        tag: id,
        child: Scaffold(
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
              Padding(
                padding: EdgeInsets.only(left: 21.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 25.0,
                      height: 25.0,
                      child: CircularProgressIndicator(
                        backgroundColor: mainColor,
                        value: 1.0,
                        strokeWidth: 3.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'My Tasks',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '2 of 7 tasks',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
